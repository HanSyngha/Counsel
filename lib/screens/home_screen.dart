import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../config/theme.dart';
import '../models/persona.dart';
import '../providers/providers.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/glass_card.dart';
import 'consultation_screen.dart';
import 'history_screen.dart';
import 'favorites_screen.dart';
import 'settings_screen.dart';
import 'persona_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

/// Custom scroll physics that snaps exactly one item at a time
class SingleItemScrollPhysics extends ScrollPhysics {
  const SingleItemScrollPhysics({super.parent});

  @override
  SingleItemScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SingleItemScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    // Limit velocity to prevent skipping multiple items
    // This ensures swipes only move one item at a time
    final double maxVelocity = position.viewportDimension * 2;
    final clampedVelocity = velocity.clamp(-maxVelocity, maxVelocity);
    return super.createBallisticSimulation(position, clampedVelocity);
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  // PageController for each category carousel
  final Map<PersonaCategory, PageController> _pageControllers = {};

  @override
  void initState() {
    super.initState();
    // Initialize page controllers for each category
    for (final category in PersonaCategory.values) {
      _pageControllers[category] = PageController(viewportFraction: 0.45);
    }
  }

  @override
  void dispose() {
    for (final controller in _pageControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                _buildHomeContent(l10n),
                const HistoryScreen(),
                const FavoritesScreen(),
                const SettingsScreen(),
              ],
            ),
          ),
          const StickyBannerAd(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.border, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: l10n.navHome,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.history_outlined),
              activeIcon: const Icon(Icons.history),
              label: l10n.navHistory,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_outline),
              activeIcon: const Icon(Icons.favorite),
              label: l10n.navFavorites,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              activeIcon: const Icon(Icons.settings),
              label: l10n.navSettings,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent(AppLocalizations l10n) {
    return Stack(
      children: [
        // Gradient background
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundGradient,
            ),
          ),
        ),
        // Decorative blur circles
        Positioned(
          top: -100,
          right: -80,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.15),
                  AppColors.primary.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 300,
          left: -100,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.categoryReligion.withValues(alpha: 0.1),
                  AppColors.categoryReligion.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          right: -50,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.categoryLiterature.withValues(alpha: 0.12),
                  AppColors.categoryLiterature.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        // Main content
        SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  l10n.appTitle,
                  style: AppTextStyles.headlineLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                centerTitle: true,
              ),
              // Welcome Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppColors.primaryGradient.createShader(bounds),
                        child: Text(
                          l10n.homeWelcome,
                          style: AppTextStyles.titleLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l10n.homeSubtitle,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Category Carousels
              ..._buildCategoryCarousels(l10n),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCategoryCarousels(AppLocalizations l10n) {
    final history = ref.watch(adviceHistoryProvider);

    // Count consultations per persona and category
    final consultationCounts = <String, int>{};
    final categoryCounts = <PersonaCategory, int>{};

    for (final record in history) {
      consultationCounts[record.personaId] =
          (consultationCounts[record.personaId] ?? 0) + 1;

      // Find persona's category and count it
      final persona = PersonaData.all.where((p) => p.id == record.personaId).firstOrNull;
      if (persona != null) {
        categoryCounts[persona.category] =
            (categoryCounts[persona.category] ?? 0) + 1;
      }
    }

    final List<Widget> slivers = [];

    // Sort categories by consultation count (descending)
    final categoryOrder = [
      PersonaCategory.philosophy,
      PersonaCategory.religion,
      PersonaCategory.history,
      PersonaCategory.literature,
      PersonaCategory.anime,
    ];

    categoryOrder.sort((a, b) {
      final countA = categoryCounts[a] ?? 0;
      final countB = categoryCounts[b] ?? 0;
      return countB.compareTo(countA);
    });

    for (final category in categoryOrder) {
      final personas = List<Persona>.from(PersonaData.byCategory(category));
      if (personas.isEmpty) continue;

      // Sort by consultation count
      personas.sort((a, b) {
        final countA = consultationCounts[a.id] ?? 0;
        final countB = consultationCounts[b.id] ?? 0;
        return countB.compareTo(countA);
      });

      final categoryColor = _getCategoryColor(category);
      final categoryLabel = _getCategoryLabel(category, l10n);

      // Category Header
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 14),
            child: Row(
              children: [
                // Glowing accent dot
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: categoryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: categoryColor.withValues(alpha: 0.6),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  categoryLabel,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: categoryColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: categoryColor.withValues(alpha: 0.3),
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    '${personas.length}',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: categoryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                // Swipe hint (only show if infinite scroll is enabled)
                if (personas.length > 3)
                  Icon(
                    Icons.swipe,
                    size: 16,
                    color: AppColors.textTertiary.withValues(alpha: 0.5),
                  ),
              ],
            ),
          ),
        ),
      );

      // Category Carousel
      // Use infinite scroll only if there are more than 3 personas
      final enableInfiniteScroll = personas.length > 3;

      slivers.add(
        SliverToBoxAdapter(
          child: SizedBox(
            height: 220,
            child: enableInfiniteScroll
                ? PageView.builder(
                    controller: _pageControllers[category],
                    padEnds: false,
                    physics: const SingleItemScrollPhysics(
                      parent: PageScrollPhysics(),
                    ),
                    itemBuilder: (context, index) {
                      // Infinite loop: use modulo to cycle through personas
                      final persona = personas[index % personas.length];
                      return _buildCarouselCard(persona, l10n, categoryColor);
                    },
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    physics: const SingleItemScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    itemCount: personas.length,
                    itemBuilder: (context, index) {
                      return _buildCarouselCard(personas[index], l10n, categoryColor);
                    },
                  ),
          ),
        ),
      );
    }

    return slivers;
  }

  Widget _buildCarouselCard(
    Persona persona,
    AppLocalizations l10n,
    Color categoryColor,
  ) {
    return GlassPersonaCard(
      imagePath: persona.imagePath,
      name: _getPersonaName(persona, l10n),
      title: _getPersonaTitle(persona, l10n),
      era: persona.era != 0 ? persona.eraDisplay : null,
      sourceTag: persona.sourceTag,
      categoryColor: categoryColor,
      onTap: () => _onPersonaTap(persona),
      onLongPress: () => _onPersonaLongPress(persona),
    );
  }

  Color _getCategoryColor(PersonaCategory category) {
    switch (category) {
      case PersonaCategory.philosophy:
        return AppColors.categoryPhilosophy;
      case PersonaCategory.religion:
        return AppColors.categoryReligion;
      case PersonaCategory.history:
        return AppColors.categoryHistory;
      case PersonaCategory.literature:
        return AppColors.categoryLiterature;
      case PersonaCategory.anime:
        return AppColors.categoryAnime;
    }
  }

  String _getCategoryLabel(PersonaCategory category, AppLocalizations l10n) {
    switch (category) {
      case PersonaCategory.philosophy:
        return l10n.categoryPhilosophy;
      case PersonaCategory.religion:
        return l10n.categoryReligion;
      case PersonaCategory.history:
        return l10n.categoryHistory;
      case PersonaCategory.literature:
        return l10n.categoryLiterature;
      case PersonaCategory.anime:
        return l10n.category_anime;
    }
  }

  String _getPersonaName(Persona persona, AppLocalizations l10n) {
    switch (persona.id) {
      case 'socrates': return l10n.personaSocrates;
      case 'plato': return l10n.personaPlato;
      case 'aristotle': return l10n.personaAristotle;
      case 'seneca': return l10n.personaSeneca;
      case 'confucius': return l10n.personaConfucius;
      case 'laozi': return l10n.personaLaozi;
      case 'jesus': return l10n.personaJesus;
      case 'buddha': return l10n.personaBuddha;
      case 'muhammad': return l10n.personaMuhammad;
      case 'lincoln': return l10n.personaLincoln;
      case 'napoleon': return l10n.personaNapoleon;
      case 'steve_jobs': return l10n.personaSteveJobs;
      case 'sherlock_holmes': return l10n.personaSherlockHolmes;
      case 'dumbledore': return l10n.personaDumbledore;
      case 'gandhi': return l10n.personaGandhi;
      case 'rumi': return l10n.personaRumi;
      case 'krishna': return l10n.personaKrishna;
      case 'brahma': return l10n.personaBrahma;
      case 'tolstoy': return l10n.personaTolstoy;
      case 'vishnu': return l10n.personaVishnu;
      case 'luffy': return l10n.persona_luffy;
      case 'gon_freecss': return l10n.persona_gon_freecss;
      case 'natsu_dragneel': return l10n.persona_natsu_dragneel;
      case 'izuku_midoriya': return l10n.persona_izuku_midoriya;
      case 'son_goku': return l10n.persona_son_goku;
      case 'edward_elric': return l10n.persona_edward_elric;
      case 'eren_yeager': return l10n.persona_eren_yeager;
      case 'naruto_uzumaki': return l10n.persona_naruto_uzumaki;
      case 'tsunayoshi_sawada': return l10n.persona_tsunayoshi_sawada;
      case 'tanjiro_kamado': return l10n.persona_tanjiro_kamado;
      case 'ichigo_kurosaki': return l10n.persona_ichigo_kurosaki;
      case 'martin_luther_king': return l10n.persona_martin_luther_king;
      case 'albert_einstein': return l10n.persona_albert_einstein;
      case 'julius_caesar': return l10n.persona_julius_caesar;
      case 'david': return l10n.persona_david;
      case 'aslan': return l10n.persona_aslan;
      case 'jean_valjean': return l10n.persona_jean_valjean;
      case 'liu_bei': return l10n.persona_liu_bei;
      case 'zhuge_liang': return l10n.persona_zhuge_liang;
      case 'cao_cao': return l10n.persona_cao_cao;
      default: return persona.id;
    }
  }

  String _getPersonaTitle(Persona persona, AppLocalizations l10n) {
    switch (persona.id) {
      case 'socrates': return l10n.personaSocratesTitle;
      case 'plato': return l10n.personaPlatoTitle;
      case 'aristotle': return l10n.personaAristotleTitle;
      case 'seneca': return l10n.personaSenecaTitle;
      case 'confucius': return l10n.personaConfuciusTitle;
      case 'laozi': return l10n.personaLaoziTitle;
      case 'jesus': return l10n.personaJesusTitle;
      case 'buddha': return l10n.personaBuddhaTitle;
      case 'muhammad': return l10n.personaMuhammadTitle;
      case 'lincoln': return l10n.personaLincolnTitle;
      case 'napoleon': return l10n.personaNapoleonTitle;
      case 'steve_jobs': return l10n.personaSteveJobsTitle;
      case 'sherlock_holmes': return l10n.personaSherlockHolmesTitle;
      case 'dumbledore': return l10n.personaDumbledoreTitle;
      case 'gandhi': return l10n.personaGandhiTitle;
      case 'rumi': return l10n.personaRumiTitle;
      case 'krishna': return l10n.personaKrishnaTitle;
      case 'brahma': return l10n.personaBrahmaTitle;
      case 'tolstoy': return l10n.personaTolstoyTitle;
      case 'vishnu': return l10n.personaVishnuTitle;
      case 'luffy': return l10n.persona_luffy_title;
      case 'gon_freecss': return l10n.persona_gon_freecss_title;
      case 'natsu_dragneel': return l10n.persona_natsu_dragneel_title;
      case 'izuku_midoriya': return l10n.persona_izuku_midoriya_title;
      case 'son_goku': return l10n.persona_son_goku_title;
      case 'edward_elric': return l10n.persona_edward_elric_title;
      case 'eren_yeager': return l10n.persona_eren_yeager_title;
      case 'naruto_uzumaki': return l10n.persona_naruto_uzumaki_title;
      case 'tsunayoshi_sawada': return l10n.persona_tsunayoshi_sawada_title;
      case 'tanjiro_kamado': return l10n.persona_tanjiro_kamado_title;
      case 'ichigo_kurosaki': return l10n.persona_ichigo_kurosaki_title;
      case 'martin_luther_king': return l10n.persona_martin_luther_king_title;
      case 'albert_einstein': return l10n.persona_albert_einstein_title;
      case 'julius_caesar': return l10n.persona_julius_caesar_title;
      case 'david': return l10n.persona_david_title;
      case 'aslan': return l10n.persona_aslan_title;
      case 'jean_valjean': return l10n.persona_jean_valjean_title;
      case 'liu_bei': return l10n.persona_liu_bei_title;
      case 'zhuge_liang': return l10n.persona_zhuge_liang_title;
      case 'cao_cao': return l10n.persona_cao_cao_title;
      default: return '';
    }
  }

  void _onPersonaTap(Persona persona) {
    ref.read(selectedPersonaProvider.notifier).state = persona;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConsultationScreen(persona: persona),
      ),
    );
  }

  void _onPersonaLongPress(Persona persona) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonaDetailScreen(persona: persona),
      ),
    );
  }
}
