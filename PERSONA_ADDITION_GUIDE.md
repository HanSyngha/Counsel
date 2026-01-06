# 인물(Persona) 추가 가이드

새로운 인물을 추가할 때 수정해야 하는 모든 파일 목록입니다.

---

## 1. 이미지 파일 추가

```
assets/images/personas/{persona_id}.jpeg
```
- 파일명은 소문자, 언더스코어 사용 (예: `steve_jobs.jpeg`)

---

## 2. 상수 파일 (Constants)

### `lib/config/constants.dart`
```dart
static const String {personaId} = '${personaImagesPath}{persona_id}.jpeg';
```

---

## 3. 페르소나 데이터 모델

### `lib/models/persona.dart`
```dart
// PersonaData 클래스에 추가
static const Persona {personaId} = Persona(
  id: '{persona_id}',
  nameKey: 'persona_{persona_id}',
  titleKey: 'persona_{persona_id}_title',
  quoteKey: 'persona_{persona_id}_quote',
  category: PersonaCategory.{category},  // philosophy, religion, history, literature
  imagePath: AppAssets.{personaId},
  era: 0,  // 연도 (BC는 음수)
);

// all 리스트에 추가
static const List<Persona> all = [
  // ... 기존 인물들
  {personaId},
];
```

---

## 4. 다국어 번역 파일 (16개 언어)

### `lib/l10n/app_{lang}.arb` (16개 파일)

| 파일 | 언어 |
|------|------|
| `app_en.arb` | English |
| `app_ko.arb` | 한국어 |
| `app_ja.arb` | 日本語 |
| `app_zh.arb` | 中文 |
| `app_es.arb` | Español |
| `app_fr.arb` | Français |
| `app_de.arb` | Deutsch |
| `app_pt.arb` | Português |
| `app_ru.arb` | Русский |
| `app_ar.arb` | العربية |
| `app_hi.arb` | हिन्दी |
| `app_th.arb` | ไทย |
| `app_vi.arb` | Tiếng Việt |
| `app_id.arb` | Bahasa Indonesia |
| `app_ms.arb` | Bahasa Melayu |
| `app_tr.arb` | Türkçe |

각 파일에 추가:
```json
"persona{PersonaId}": "인물 이름",
"persona{PersonaId}Title": "인물 직함",
"persona{PersonaId}Quote": "대표 명언"
```

---

## 5. 대기 메시지 (Waiting Messages)

### `lib/models/waiting_messages.dart`

16개 언어 블록 각각에 추가:
```dart
'{persona_id}': [
  '"대기 메시지 1..."',
  '"대기 메시지 2..."',
  '"대기 메시지 3..."',
],
```

---

## 6. Switch 문 수정 (7개 파일, 14곳)

### `lib/screens/advice_detail_screen.dart` (2곳)
- `_getPersonaName()`
- `_getPersonaTitle()`

### `lib/screens/home_screen.dart` (2곳)
- `_getPersonaName()`
- `_getPersonaTitle()`

### `lib/screens/chat_screen.dart` (3곳)
- `_getPersonaName()`
- `_getPersonaTitle()`
- `_getPersonaQuote()`

### `lib/screens/consultation_screen.dart` (3곳)
- `_getPersonaName()`
- `_getPersonaTitle()`
- `_getPersonaQuote()`

### `lib/widgets/advice_card.dart` (1곳)
- `_getPersonaName()`

### `lib/widgets/persona_card.dart` (2곳)
- `_getPersonaName()`
- `_getPersonaTitle()`

### `lib/widgets/loading_indicator.dart` (1곳)
- `_getPersonaName()`

각 switch문에 추가:
```dart
case '{persona_id}': return l10n.persona{PersonaId};
case '{persona_id}': return l10n.persona{PersonaId}Title;
case '{persona_id}': return l10n.persona{PersonaId}Quote;
```

---

## 체크리스트

```
[ ] 1. 이미지 파일 추가 (assets/images/personas/)
[ ] 2. constants.dart - 이미지 경로 상수
[ ] 3. persona.dart - Persona 객체 및 all 리스트
[ ] 4. 16개 ARB 파일 - Name, Title, Quote
[ ] 5. waiting_messages.dart - 16개 언어 × 3개 메시지
[ ] 6. advice_detail_screen.dart - Name, Title
[ ] 7. home_screen.dart - Name, Title
[ ] 8. chat_screen.dart - Name, Title, Quote
[ ] 9. consultation_screen.dart - Name, Title, Quote
[ ] 10. advice_card.dart - Name
[ ] 11. persona_card.dart - Name, Title
[ ] 12. loading_indicator.dart - Name
[ ] 13. flutter pub get && flutter build appbundle
```

---

## 빠른 검색 명령어

누락 확인용 grep 명령어:
```bash
# 마지막 인물(tolstoy) 기준으로 새 인물 누락 확인
grep -r "case 'tolstoy'" lib/ --include="*.dart"

# 새 인물이 제대로 추가되었는지 확인
grep -r "case '{persona_id}'" lib/ --include="*.dart"
```

---

## 주의사항

1. **persona_id 명명 규칙**: 소문자, 언더스코어 (예: `steve_jobs`)
2. **l10n key 명명 규칙**: camelCase (예: `personaSteveJobs`)
3. **이미지 파일**: `.jpeg` 또는 `.png` 확장자
4. **ARB 수정 후**: `flutter gen-l10n` 또는 빌드 시 자동 생성
5. **카테고리**: `philosophy`, `religion`, `history`, `literature` 중 선택
