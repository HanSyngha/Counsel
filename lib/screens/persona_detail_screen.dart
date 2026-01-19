import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../config/theme.dart';
import '../models/persona.dart';
import '../providers/providers.dart';
import 'chat_screen.dart';

class PersonaDetailScreen extends ConsumerWidget {
  final Persona persona;

  const PersonaDetailScreen({
    super.key,
    required this.persona,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final categoryColor = _getCategoryColor(persona.category);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero Image App Bar
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.background.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Persona Image
                  Image.asset(
                    persona.imagePath,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.surfaceVariant,
                        child: Icon(
                          Icons.person,
                          size: 100,
                          color: AppColors.textTertiary,
                        ),
                      );
                    },
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          AppColors.background.withOpacity(0.5),
                          AppColors.background,
                        ],
                        stops: const [0.0, 0.3, 0.7, 1.0],
                      ),
                    ),
                  ),
                  // Category badge
                  Positioned(
                    top: 100,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: categoryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _getCategoryLabel(persona.category, l10n),
                        style: AppTextStyles.labelMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Title
                  Text(
                    _getPersonaName(persona, l10n),
                    style: AppTextStyles.displayMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getPersonaTitle(persona, l10n),
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Era
                  if (persona.era != 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: categoryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        persona.eraDisplay,
                        style: AppTextStyles.labelMedium.copyWith(
                          color: categoryColor,
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),

                  // Quote Section
                  _buildQuoteSection(l10n, categoryColor),
                  const SizedBox(height: 24),

                  // About Section
                  _buildAboutSection(l10n),
                  const SizedBox(height: 24),

                  // Expertise Tags
                  _buildExpertiseTags(l10n, categoryColor),
                  const SizedBox(height: 32),

                  // Ask Button
                  _buildAskButton(context, ref, l10n),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteSection(AppLocalizations l10n, Color categoryColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            categoryColor.withOpacity(0.1),
            AppColors.surfaceVariant,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: categoryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.format_quote, color: categoryColor, size: 24),
              const SizedBox(width: 8),
              Text(
                l10n.personaSignatureQuote,
                style: AppTextStyles.labelMedium.copyWith(
                  color: categoryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '"${_getPersonaQuote(persona, l10n)}"',
            style: AppTextStyles.quote,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.textSecondary, size: 20),
              const SizedBox(width: 8),
              Text(
                l10n.personaAbout,
                style: AppTextStyles.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _getPersonaDescription(persona, l10n),
            style: AppTextStyles.bodyMedium.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpertiseTags(AppLocalizations l10n, Color categoryColor) {
    final expertise = _getPersonaExpertise(persona);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.school_outlined, color: AppColors.textSecondary, size: 20),
            const SizedBox(width: 8),
            Text(
              l10n.personaExpertise,
              style: AppTextStyles.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: expertise.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: categoryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: categoryColor.withOpacity(0.3)),
              ),
              child: Text(
                tag,
                style: AppTextStyles.labelMedium.copyWith(
                  color: categoryColor,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAskButton(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          ref.read(selectedPersonaProvider.notifier).state = persona;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(persona: persona),
            ),
          );
        },
        icon: const Icon(Icons.chat_bubble_outline),
        label: Text(l10n.personaAskQuestion),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
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

  String _getPersonaQuote(Persona persona, AppLocalizations l10n) {
    // In a real app, this would use localization
    final quotes = {
      'socrates': 'The unexamined life is not worth living.',
      'plato': 'Be kind, for everyone you meet is fighting a hard battle.',
      'aristotle': 'We are what we repeatedly do. Excellence, then, is not an act, but a habit.',
      'seneca': 'It is not that we have a short time to live, but that we waste a lot of it.',
      'confucius': 'It does not matter how slowly you go as long as you do not stop.',
      'laozi': 'The journey of a thousand miles begins with one step.',
      'rumi': 'What you seek is seeking you.',
      'jesus': 'Love your neighbor as yourself.',
      'buddha': 'Peace comes from within. Do not seek it without.',
      'muhammad': 'The best among you are those who have the best manners and character.',
      'krishna': 'You have the right to work, but never to the fruit of work.',
      'brahma': 'From the unreal lead me to the real.',
      'lincoln': 'In the end, it\'s not the years in your life that count. It\'s the life in your years.',
      'napoleon': 'Impossible is a word to be found only in the dictionary of fools.',
      'steve_jobs': 'Stay hungry, stay foolish.',
      'gandhi': 'Be the change you wish to see in the world.',
      'sherlock_holmes': 'When you have eliminated the impossible, whatever remains, however improbable, must be the truth.',
      'dumbledore': 'Happiness can be found even in the darkest of times, if one only remembers to turn on the light.',
      'tolstoy': 'Everyone thinks of changing the world, but no one thinks of changing himself.',
    };

    return quotes[persona.id] ?? 'Wisdom awaits those who seek it.';
  }

  String _getPersonaDescription(Persona persona, AppLocalizations l10n) {
    // Return a generic description since systemPrompt was removed
    return l10n.settingsAboutContent;
  }

  List<String> _getPersonaExpertise(Persona persona) {
    // Extract expertise based on category and persona
    final expertiseMap = {
      'socrates': ['Ethics', 'Dialectic', 'Philosophy', 'Self-Knowledge'],
      'plato': ['Metaphysics', 'Politics', 'Education', 'Ethics'],
      'aristotle': ['Logic', 'Ethics', 'Natural Science', 'Politics'],
      'seneca': ['Stoicism', 'Ethics', 'Self-Discipline', 'Resilience'],
      'confucius': ['Ethics', 'Social Harmony', 'Education', 'Governance'],
      'laozi': ['Taoism', 'Simplicity', 'Nature', 'Balance'],
      'rumi': ['Mysticism', 'Poetry', 'Divine Love', 'Spirituality'],
      'jesus': ['Love', 'Forgiveness', 'Spirituality', 'Moral Teaching'],
      'buddha': ['Mindfulness', 'Compassion', 'Enlightenment', 'Meditation'],
      'muhammad': ['Faith', 'Justice', 'Community', 'Moral Guidance'],
      'krishna': ['Duty', 'Devotion', 'Wisdom', 'Cosmic Truth'],
      'brahma': ['Creation', 'Vedic Wisdom', 'Cosmic Cycles', 'Reality'],
      'lincoln': ['Leadership', 'Unity', 'Justice', 'Perseverance'],
      'napoleon': ['Strategy', 'Leadership', 'Ambition', 'Military'],
      'steve_jobs': ['Innovation', 'Design', 'Vision', 'Entrepreneurship'],
      'gandhi': ['Non-violence', 'Truth', 'Civil Rights', 'Self-discipline'],
      'sherlock_holmes': ['Deduction', 'Observation', 'Logic', 'Problem-Solving'],
      'dumbledore': ['Wisdom', 'Love', 'Courage', 'Leadership'],
      'tolstoy': ['Literature', 'Morality', 'Simplicity', 'Human Nature'],
    };

    return expertiseMap[persona.id] ?? ['Wisdom', 'Guidance', 'Insight'];
  }
}
