import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/advice_detail_screen.dart';
import '../screens/history_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/persona_detail_screen.dart';
import '../screens/language_selector_screen.dart';
import '../models/persona.dart';
import '../models/advice.dart';

/// App router configuration
class AppRouter {
  static const String home = '/';
  static const String chat = '/chat/:personaId';
  static const String adviceDetail = '/advice';
  static const String history = '/history';
  static const String favorites = '/favorites';
  static const String settings = '/settings';
  static const String personaDetail = '/persona/:personaId';
  static const String languageSelector = '/language';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    debugLogDiagnostics: true,
    routes: [
      // Home - Persona selection
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

      // Chat with persona
      GoRoute(
        path: chat,
        name: 'chat',
        builder: (context, state) {
          final personaId = state.pathParameters['personaId']!;
          final persona = PersonaData.getById(personaId);
          if (persona == null) {
            return const Scaffold(
              body: Center(child: Text('Persona not found')),
            );
          }
          return ChatScreen(persona: persona);
        },
      ),

      // Advice detail - uses extra to pass the record
      GoRoute(
        path: adviceDetail,
        name: 'adviceDetail',
        builder: (context, state) {
          final record = state.extra as AdviceRecord?;
          if (record == null) {
            return const Scaffold(
              body: Center(child: Text('Advice not found')),
            );
          }
          return AdviceDetailScreen(record: record);
        },
      ),

      // History
      GoRoute(
        path: history,
        name: 'history',
        builder: (context, state) => const HistoryScreen(),
      ),

      // Favorites
      GoRoute(
        path: favorites,
        name: 'favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),

      // Settings
      GoRoute(
        path: settings,
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),

      // Persona detail
      GoRoute(
        path: personaDetail,
        name: 'personaDetail',
        builder: (context, state) {
          final personaId = state.pathParameters['personaId']!;
          final persona = PersonaData.getById(personaId);
          if (persona == null) {
            return const Scaffold(
              body: Center(child: Text('Persona not found')),
            );
          }
          return PersonaDetailScreen(persona: persona);
        },
      ),

      // Language selector
      GoRoute(
        path: languageSelector,
        name: 'languageSelector',
        builder: (context, state) => const LanguageSelectorScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri}'),
      ),
    ),
  );

  // Navigation helpers
  static void goToChat(BuildContext context, String personaId) {
    context.push('/chat/$personaId');
  }

  static void goToAdviceDetail(BuildContext context, AdviceRecord record) {
    context.push(adviceDetail, extra: record);
  }

  static void goToPersonaDetail(BuildContext context, String personaId) {
    context.push('/persona/$personaId');
  }

  static void goToHistory(BuildContext context) {
    context.push(history);
  }

  static void goToFavorites(BuildContext context) {
    context.push(favorites);
  }

  static void goToSettings(BuildContext context) {
    context.push(settings);
  }

  static void goToLanguageSelector(BuildContext context) {
    context.push(languageSelector);
  }

  static void goHome(BuildContext context) {
    context.go(home);
  }
}
