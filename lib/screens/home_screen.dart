import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../config/theme.dart';
import '../models/persona.dart';
import '../providers/providers.dart';
import 'chat_screen.dart';
import 'history_screen.dart';
import 'favorites_screen.dart';
import 'settings_screen.dart';
import 'persona_detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;
  PersonaCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeContent(l10n),
          const HistoryScreen(),
          const FavoritesScreen(),
          const SettingsScreen(),
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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            title: Text(
              l10n.appTitle,
              style: AppTextStyles.headlineLarge,
            ),
            centerTitle: true,
          ),
          // Welcome Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.homeWelcome,
                    style: AppTextStyles.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.homeSubtitle,
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          // Category Chips
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildCategoryChip(null, l10n.categoryAll, l10n),
                  const SizedBox(width: 8),
                  _buildCategoryChip(
                    PersonaCategory.philosophy,
                    l10n.categoryPhilosophy,
                    l10n,
                    color: AppColors.categoryPhilosophy,
                  ),
                  const SizedBox(width: 8),
                  _buildCategoryChip(
                    PersonaCategory.religion,
                    l10n.categoryReligion,
                    l10n,
                    color: AppColors.categoryReligion,
                  ),
                  const SizedBox(width: 8),
                  _buildCategoryChip(
                    PersonaCategory.history,
                    l10n.categoryHistory,
                    l10n,
                    color: AppColors.categoryHistory,
                  ),
                  const SizedBox(width: 8),
                  _buildCategoryChip(
                    PersonaCategory.literature,
                    l10n.categoryLiterature,
                    l10n,
                    color: AppColors.categoryLiterature,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          // Persona Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: _buildPersonaGrid(l10n),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(
    PersonaCategory? category,
    String label,
    AppLocalizations l10n, {
    Color? color,
  }) {
    final isSelected = _selectedCategory == category;
    return FilterChip(
      label: Text(
        label,
        style: AppTextStyles.labelMedium.copyWith(
          color: isSelected ? Colors.white : AppColors.textSecondary,
        ),
      ),
      selected: isSelected,
      onSelected: (_) => setState(() => _selectedCategory = category),
      backgroundColor: AppColors.surfaceVariant,
      selectedColor: color ?? AppColors.primary,
      checkmarkColor: Colors.white,
      side: BorderSide(
        color: isSelected ? (color ?? AppColors.primary) : AppColors.border,
      ),
    );
  }

  Widget _buildPersonaGrid(AppLocalizations l10n) {
    List<Persona> personas;
    if (_selectedCategory == null) {
      personas = PersonaData.all;
    } else {
      personas = PersonaData.byCategory(_selectedCategory!);
    }

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildPersonaCard(personas[index], l10n),
        childCount: personas.length,
      ),
    );
  }

  Widget _buildPersonaCard(Persona persona, AppLocalizations l10n) {
    final categoryColor = _getCategoryColor(persona.category);

    return GestureDetector(
      onTap: () => _onPersonaTap(persona),
      onLongPress: () => _onPersonaLongPress(persona),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Persona Image
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    persona.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.surfaceVariant,
                        child: Icon(
                          Icons.person,
                          size: 48,
                          color: AppColors.textTertiary,
                        ),
                      );
                    },
                  ),
                  // Gradient overlay
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.surface.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Category badge
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: categoryColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _getCategoryLabel(persona.category, l10n),
                        style: AppTextStyles.labelSmall.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Featured badge
                  if (persona.isFeatured)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.warning.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Persona Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getPersonaName(persona, l10n),
                      style: AppTextStyles.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getPersonaTitle(persona, l10n),
                      style: AppTextStyles.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    if (persona.era != 0)
                      Text(
                        persona.eraDisplay,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: categoryColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
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
    }
  }

  String _getPersonaName(Persona persona, AppLocalizations l10n) {
    // In a real app, you'd use l10n with the nameKey
    // For now, we'll use a map or direct approach
    return _getLocalizedString(persona.nameKey, l10n);
  }

  String _getPersonaTitle(Persona persona, AppLocalizations l10n) {
    return _getLocalizedString(persona.titleKey, l10n);
  }

  String _getLocalizedString(String key, AppLocalizations l10n) {
    // This would ideally use a lookup method on AppLocalizations
    // For demonstration, returning the key formatted
    final formattedKey = key.replaceAll('persona_', '').replaceAll('_', ' ');
    return formattedKey.split(' ').map((word) =>
      word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1)}' : ''
    ).join(' ');
  }

  void _onPersonaTap(Persona persona) {
    ref.read(selectedPersonaProvider.notifier).state = persona;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(persona: persona),
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
