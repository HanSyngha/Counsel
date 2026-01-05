import 'package:hive_flutter/hive_flutter.dart';

import '../models/advice.dart';

/// Local storage service using Hive
class StorageService {
  static const String _adviceBoxName = 'advice_records';
  static const String _settingsBoxName = 'settings';

  late Box<Map> _adviceBox;
  late Box _settingsBox;

  bool _isInitialized = false;

  /// Initialize Hive and open boxes
  Future<void> init() async {
    if (_isInitialized) return;

    await Hive.initFlutter();

    _adviceBox = await Hive.openBox<Map>(_adviceBoxName);
    _settingsBox = await Hive.openBox(_settingsBoxName);

    _isInitialized = true;
  }

  /// Save an advice record
  Future<void> saveAdvice(AdviceRecord record) async {
    await _adviceBox.put(record.id, record.toJson());
  }

  /// Get all advice records
  List<AdviceRecord> getAllAdvice() {
    return _adviceBox.values
        .map((json) => AdviceRecord.fromJson(Map<String, dynamic>.from(json)))
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Get advice records for a specific persona
  List<AdviceRecord> getAdviceByPersona(String personaId) {
    return getAllAdvice()
        .where((record) => record.personaId == personaId)
        .toList();
  }

  /// Get favorite advice records
  List<AdviceRecord> getFavorites() {
    return getAllAdvice().where((record) => record.isFavorite).toList();
  }

  /// Toggle favorite status
  Future<void> toggleFavorite(String id) async {
    final json = _adviceBox.get(id);
    if (json != null) {
      final record = AdviceRecord.fromJson(Map<String, dynamic>.from(json));
      final updated = record.copyWith(isFavorite: !record.isFavorite);
      await _adviceBox.put(id, updated.toJson());
    }
  }

  /// Delete an advice record
  Future<void> deleteAdvice(String id) async {
    await _adviceBox.delete(id);
  }

  /// Clear all advice records
  Future<void> clearAllAdvice() async {
    await _adviceBox.clear();
  }

  /// Get a specific advice record
  AdviceRecord? getAdvice(String id) {
    final json = _adviceBox.get(id);
    if (json == null) return null;
    return AdviceRecord.fromJson(Map<String, dynamic>.from(json));
  }

  // Settings methods

  /// Get the selected language code
  String? getLanguageCode() {
    return _settingsBox.get('language_code') as String?;
  }

  /// Set the selected language code
  Future<void> setLanguageCode(String code) async {
    await _settingsBox.put('language_code', code);
  }

  /// Get the last selected persona ID
  String? getLastPersonaId() {
    return _settingsBox.get('last_persona_id') as String?;
  }

  /// Set the last selected persona ID
  Future<void> setLastPersonaId(String personaId) async {
    await _settingsBox.put('last_persona_id', personaId);
  }

  /// Check if onboarding is completed
  bool isOnboardingCompleted() {
    return _settingsBox.get('onboarding_completed', defaultValue: false) as bool;
  }

  /// Mark onboarding as completed
  Future<void> setOnboardingCompleted() async {
    await _settingsBox.put('onboarding_completed', true);
  }

  /// Get ad-free status (for future IAP)
  bool isAdFree() {
    return _settingsBox.get('ad_free', defaultValue: false) as bool;
  }

  /// Set ad-free status
  Future<void> setAdFree(bool value) async {
    await _settingsBox.put('ad_free', value);
  }

  /// Close all boxes
  Future<void> close() async {
    await _adviceBox.close();
    await _settingsBox.close();
  }
}
