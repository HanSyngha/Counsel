import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/advice.dart';
import '../l10n/prompts/prompt_loader.dart';

/// Grok API service for getting advice from personas
class GrokService {
  static const String _baseUrl = 'https://api.x.ai/v1/chat/completions';
  static const String _model = 'grok-4-1-fast-non-reasoning';

  final http.Client _client;

  GrokService({http.Client? client}) : _client = client ?? http.Client();

  /// Get advice from a persona
  Future<AdviceResponse> getAdvice({
    required String personaId,
    required String userQuery,
    required Locale locale,
  }) async {
    final apiKey = dotenv.env['GROK_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('GROK_API_KEY not found in environment');
    }

    final systemPrompt = PromptLoader.getPrompt(personaId, locale);
    if (systemPrompt.isEmpty) {
      throw Exception('Prompt not found for persona: $personaId');
    }

    final response = await _client.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': _model,
        'messages': [
          {
            'role': 'system',
            'content': systemPrompt,
          },
          {
            'role': 'user',
            'content': userQuery,
          },
        ],
        'response_format': {
          'type': 'json_object',
        },
        'temperature': 0.7,
        'max_tokens': 2048,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Grok API error: ${response.statusCode} - ${response.body}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final content = data['choices'][0]['message']['content'] as String;

    try {
      final jsonResponse = jsonDecode(content) as Map<String, dynamic>;
      return AdviceResponse.fromJson(jsonResponse);
    } catch (e) {
      throw Exception('Failed to parse Grok response: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}
