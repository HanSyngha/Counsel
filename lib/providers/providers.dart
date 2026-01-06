import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/advice.dart';
import '../models/persona.dart';
import '../services/grok_service.dart';
import '../services/storage_service.dart';
import '../services/ad_service.dart';

// ============================================================================
// App Info Providers
// ============================================================================

/// Package info provider - loads version info from pubspec.yaml
final packageInfoProvider = FutureProvider<PackageInfo>((ref) async {
  return await PackageInfo.fromPlatform();
});

/// App version string provider
final appVersionProvider = Provider<String>((ref) {
  final packageInfo = ref.watch(packageInfoProvider);
  return packageInfo.when(
    data: (info) => info.version,
    loading: () => '...',
    error: (_, __) => '1.0.0',
  );
});

// ============================================================================
// Service Providers
// ============================================================================

/// Storage service provider
final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

/// Grok API service provider
final grokServiceProvider = Provider<GrokService>((ref) {
  return GrokService();
});

/// Ad service provider
final adServiceProvider = Provider<AdService>((ref) {
  return AdService();
});

// ============================================================================
// State Providers
// ============================================================================

/// Current locale provider
final localeProvider = StateProvider<Locale>((ref) {
  return const Locale('en');
});

/// Selected persona provider
final selectedPersonaProvider = StateProvider<Persona?>((ref) {
  return null;
});

/// Loading state provider
final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

/// Error message provider
final errorMessageProvider = StateProvider<String?>((ref) {
  return null;
});

// ============================================================================
// Advice Providers
// ============================================================================

/// Current advice response provider
final currentAdviceProvider = StateProvider<AdviceResponse?>((ref) {
  return null;
});

/// Advice history provider
final adviceHistoryProvider = StateNotifierProvider<AdviceHistoryNotifier, List<AdviceRecord>>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return AdviceHistoryNotifier(storage);
});

/// Favorites provider
final favoritesProvider = Provider<List<AdviceRecord>>((ref) {
  final history = ref.watch(adviceHistoryProvider);
  return history.where((record) => record.isFavorite).toList();
});

// ============================================================================
// Notifiers
// ============================================================================

/// Advice history state notifier
class AdviceHistoryNotifier extends StateNotifier<List<AdviceRecord>> {
  final StorageService _storage;

  AdviceHistoryNotifier(this._storage) : super([]) {
    _loadHistory();
  }

  void _loadHistory() {
    state = _storage.getAllAdvice();
  }

  Future<void> addAdvice(AdviceRecord record) async {
    await _storage.saveAdvice(record);
    state = [record, ...state];
  }

  Future<void> toggleFavorite(String id) async {
    await _storage.toggleFavorite(id);
    state = state.map((record) {
      if (record.id == id) {
        return record.copyWith(isFavorite: !record.isFavorite);
      }
      return record;
    }).toList();
  }

  Future<void> deleteAdvice(String id) async {
    await _storage.deleteAdvice(id);
    state = state.where((record) => record.id != id).toList();
  }

  Future<void> clearAll() async {
    await _storage.clearAllAdvice();
    state = [];
  }

  void refresh() {
    _loadHistory();
  }
}

// ============================================================================
// Advice Request Provider
// ============================================================================

/// Provider for requesting advice from a persona
final adviceRequestProvider = FutureProvider.family<AdviceResponse, AdviceRequest>((ref, request) async {
  final grokService = ref.read(grokServiceProvider);

  final response = await grokService.getAdvice(
    personaId: request.personaId,
    userQuery: request.userQuery,
    locale: request.locale,
  );

  // Save to history
  final record = AdviceRecord(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    personaId: request.personaId,
    userQuery: request.userQuery,
    response: response,
    createdAt: DateTime.now(),
  );

  await ref.read(adviceHistoryProvider.notifier).addAdvice(record);

  // Check if we should show an ad
  final adService = ref.read(adServiceProvider);
  await adService.onAdviceReceived();

  return response;
});

/// Request model for advice
class AdviceRequest {
  final String personaId;
  final String userQuery;
  final Locale locale;

  const AdviceRequest({
    required this.personaId,
    required this.userQuery,
    required this.locale,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AdviceRequest &&
        other.personaId == personaId &&
        other.userQuery == userQuery &&
        other.locale == locale;
  }

  @override
  int get hashCode => Object.hash(personaId, userQuery, locale);
}

// ============================================================================
// Settings Providers
// ============================================================================

/// Onboarding completed provider
final onboardingCompletedProvider = StateProvider<bool>((ref) {
  final storage = ref.read(storageServiceProvider);
  return storage.isOnboardingCompleted();
});

/// Ad-free status provider
final isAdFreeProvider = StateProvider<bool>((ref) {
  final storage = ref.read(storageServiceProvider);
  return storage.isAdFree();
});

// ============================================================================
// Persona Category Provider
// ============================================================================

/// Personas grouped by category
final personasByCategoryProvider = Provider<Map<PersonaCategory, List<Persona>>>((ref) {
  final Map<PersonaCategory, List<Persona>> grouped = {};

  for (final persona in PersonaData.all) {
    grouped.putIfAbsent(persona.category, () => []).add(persona);
  }

  return grouped;
});
