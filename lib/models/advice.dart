/// Helper function to deeply convert maps from Hive
Map<String, dynamic> _deepConvertMap(dynamic value) {
  if (value is Map) {
    return Map<String, dynamic>.from(
      value.map((k, v) => MapEntry(k.toString(), v is Map ? _deepConvertMap(v) : v)),
    );
  }
  return <String, dynamic>{};
}

/// 인용 출처 타입
enum SourceType {
  scripture, // 경전 (성경, 코란, 베다, 불경 등)
  book, // 책/저서 (논어, 도덕경, 국가론 등)
  speech, // 연설 (게티즈버그 연설, 스탠포드 연설 등)
  battle, // 전투/전쟁 상황 (워털루, 아우스터리츠 등)
  letter, // 편지/서한 (루킬리우스 서한집 등)
  dialogue, // 대화/문답 (소크라테스 대화편 등)
  moment, // 특정 순간/사건 (보리수나무 아래 등)
  teaching, // 가르침/설법 (산상수훈, 녹야원 설법 등)
  novel, // 소설/문학작품 (해리포터, 셜록홈즈 등)
}

/// 인용 출처 정보
class CitationSource {
  /// 출처 타입
  final SourceType type;

  /// 출처명 (도덕경, 워털루 전투, 게티즈버그 연설 등)
  final String name;

  /// 구체적 위치 (제8장, 5장 3-12절, 전투 마지막 날 등)
  final String location;

  /// 연도/시기 (1815년 6월 18일, 기원전 6세기 등) - 선택
  final String? year;

  /// 상황 맥락 (패배를 직감하며 근위대에게 명령하던 순간 등)
  final String context;

  const CitationSource({
    required this.type,
    required this.name,
    required this.location,
    this.year,
    required this.context,
  });

  factory CitationSource.fromJson(Map<String, dynamic> json) {
    return CitationSource(
      type: _parseSourceType(json['type'] as String? ?? 'book'),
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
      year: json['year'] as String?,
      context: json['context'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'name': name,
      'location': location,
      'year': year,
      'context': context,
    };
  }

  static SourceType _parseSourceType(String value) {
    return SourceType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => SourceType.book,
    );
  }
}

/// 인용문 정보
class Citation {
  /// 원어 인용문 (그리스어, 라틴어, 산스크리트어, 한문 등)
  final String originalText;

  /// 번역된 인용문 (사용자 언어로)
  final String translatedText;

  /// 출처 정보
  final CitationSource source;

  /// 이 인용이 사용자의 고민과 연결되는 이유
  final String relevance;

  const Citation({
    required this.originalText,
    required this.translatedText,
    required this.source,
    required this.relevance,
  });

  /// 하위 호환성: 기존 코드에서 text를 사용하는 경우 translatedText 반환
  String get text => translatedText;

  /// 하위 호환성: 기존 'text' 필드만 있는 경우 처리
  factory Citation.fromJson(Map<String, dynamic> json) {
    final sourceData = json['source'];

    // 새 형식: original_text + translated_text
    String originalText = json['original_text'] as String? ?? '';
    String translatedText = json['translated_text'] as String? ?? '';

    // 하위 호환성: 기존 'text' 필드만 있는 경우
    if (originalText.isEmpty && translatedText.isEmpty) {
      final legacyText = json['text'] as String? ?? '';
      originalText = legacyText;
      translatedText = legacyText;
    }

    return Citation(
      originalText: originalText,
      translatedText: translatedText,
      source: CitationSource.fromJson(
        sourceData is Map ? _deepConvertMap(sourceData) : <String, dynamic>{},
      ),
      relevance: json['relevance'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original_text': originalText,
      'translated_text': translatedText,
      'source': source.toJson(),
      'relevance': relevance,
    };
  }
}

/// Grok API 응답 - 조언 전체 구조
class AdviceResponse {
  /// 인용문 및 출처
  final Citation citation;

  /// 조언 본문 (인물 특유의 말투로)
  final String advice;

  /// 실천 단계 (3개)
  final List<String> actionSteps;

  /// 마무리 한마디 (시그니처 표현)
  final String closingWords;

  const AdviceResponse({
    required this.citation,
    required this.advice,
    required this.actionSteps,
    required this.closingWords,
  });

  factory AdviceResponse.fromJson(Map<String, dynamic> json) {
    final citationData = json['citation'];
    return AdviceResponse(
      citation: Citation.fromJson(
        citationData is Map ? _deepConvertMap(citationData) : <String, dynamic>{},
      ),
      advice: json['advice'] as String? ?? '',
      actionSteps: (json['action_steps'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      closingWords: json['closing_words'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'citation': citation.toJson(),
      'advice': advice,
      'action_steps': actionSteps,
      'closing_words': closingWords,
    };
  }
}

/// 저장용 조언 기록
class AdviceRecord {
  /// 고유 ID
  final String id;

  /// 페르소나 ID
  final String personaId;

  /// 사용자 질문
  final String userQuery;

  /// 조언 응답
  final AdviceResponse response;

  /// 생성 시간
  final DateTime createdAt;

  /// 북마크 여부
  final bool isFavorite;

  const AdviceRecord({
    required this.id,
    required this.personaId,
    required this.userQuery,
    required this.response,
    required this.createdAt,
    this.isFavorite = false,
  });

  AdviceRecord copyWith({
    String? id,
    String? personaId,
    String? userQuery,
    AdviceResponse? response,
    DateTime? createdAt,
    bool? isFavorite,
  }) {
    return AdviceRecord(
      id: id ?? this.id,
      personaId: personaId ?? this.personaId,
      userQuery: userQuery ?? this.userQuery,
      response: response ?? this.response,
      createdAt: createdAt ?? this.createdAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory AdviceRecord.fromJson(Map<String, dynamic> json) {
    final responseData = json['response'];
    return AdviceRecord(
      id: json['id'] as String? ?? '',
      personaId: json['persona_id'] as String? ?? '',
      userQuery: json['user_query'] as String? ?? '',
      response: AdviceResponse.fromJson(
        responseData is Map ? _deepConvertMap(responseData) : <String, dynamic>{},
      ),
      createdAt: DateTime.tryParse(json['created_at'] as String? ?? '') ?? DateTime.now(),
      isFavorite: json['is_favorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'persona_id': personaId,
      'user_query': userQuery,
      'response': response.toJson(),
      'created_at': createdAt.toIso8601String(),
      'is_favorite': isFavorite,
    };
  }
}
