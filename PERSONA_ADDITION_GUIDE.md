# Persona Addition Guide

새 페르소나 추가 시 반드시 따라야 할 체크리스트입니다.

---

## 폴더 구조

```
lib/l10n/prompts/
├── {persona_id}/           # 페르소나별 폴더
│   ├── prompt_en.dart      # 영어 프롬프트
│   ├── prompt_ko.dart      # 한국어 프롬프트
│   ├── prompt_ja.dart      # 일본어 프롬프트
│   ├── ... (21개 언어)
│   └── prompts.dart        # Barrel file (모든 언어 export)
├── prompt_loader.dart      # 프롬프트 로더
└── ... (다른 페르소나 폴더들)
```

---

## CRITICAL: 모든 언어 파일 동시 추가 필수!

**vishnu 사례**: vishnu는 5개 언어 파일에만 추가되어 16개 언어에서 실패했습니다.

### 지원 언어 (21개)

| 코드 | 언어 | 파일명 |
|------|------|--------|
| en | 영어 | prompt_en.dart |
| ko | 한국어 | prompt_ko.dart |
| ja | 일본어 | prompt_ja.dart |
| zh | 중국어 간체 | prompt_zh.dart |
| zh_tw | 중국어 번체 | prompt_zh_tw.dart |
| ar | 아랍어 | prompt_ar.dart |
| th | 태국어 | prompt_th.dart |
| ms | 말레이어 | prompt_ms.dart |
| es | 스페인어 | prompt_es.dart |
| de | 독일어 | prompt_de.dart |
| fr | 프랑스어 | prompt_fr.dart |
| hi | 힌디어 | prompt_hi.dart |
| id | 인도네시아어 | prompt_id.dart |
| pt | 포르투갈어 | prompt_pt.dart |
| tr | 터키어 | prompt_tr.dart |
| vi | 베트남어 | prompt_vi.dart |
| ru | 러시아어 | prompt_ru.dart |
| it | 이탈리아어 | prompt_it.dart |
| pl | 폴란드어 | prompt_pl.dart |
| nl | 네덜란드어 | prompt_nl.dart |
| uk | 우크라이나어 | prompt_uk.dart |

---

## 새 페르소나 추가 체크리스트

### 1. 프롬프트 폴더 생성 (22개 파일)

```bash
mkdir lib/l10n/prompts/{new_persona}
```

- [ ] prompt_en.dart - 영어로 작성
- [ ] prompt_ko.dart - 한국어로 작성
- [ ] prompt_ja.dart - 일본어로 작성
- [ ] prompt_zh.dart - 중국어 간체로 작성
- [ ] prompt_zh_tw.dart - 중국어 번체로 작성
- [ ] prompt_ar.dart - 아랍어로 작성
- [ ] prompt_th.dart - 태국어로 작성
- [ ] prompt_ms.dart - 말레이어로 작성
- [ ] prompt_es.dart - 스페인어로 작성
- [ ] prompt_de.dart - 독일어로 작성
- [ ] prompt_fr.dart - 프랑스어로 작성
- [ ] prompt_hi.dart - 힌디어로 작성
- [ ] prompt_id.dart - 인도네시아어로 작성
- [ ] prompt_pt.dart - 포르투갈어로 작성
- [ ] prompt_tr.dart - 터키어로 작성
- [ ] prompt_vi.dart - 베트남어로 작성
- [ ] prompt_ru.dart - 러시아어로 작성
- [ ] prompt_it.dart - 이탈리아어로 작성
- [ ] prompt_pl.dart - 폴란드어로 작성
- [ ] prompt_nl.dart - 네덜란드어로 작성
- [ ] prompt_uk.dart - 우크라이나어로 작성
- [ ] prompts.dart - Barrel file 생성

### 2. prompt_loader.dart 업데이트

- [ ] import 추가: `import '{new_persona}/prompts.dart';`
- [ ] _personaPrompts에 추가: `'{new_persona}': {new_persona}Prompts,`

### 3. 데이터 파일

- [ ] `lib/models/persona.dart` - Persona 모델에 추가
- [ ] `lib/data/personas.dart` - personas 목록에 추가

### 4. 리소스 파일

- [ ] `assets/images/personas/{persona_id}.png` - 이미지 추가

### 5. 번역 파일 (21개 ARB 파일)

- [ ] `lib/l10n/app_*.arb` - persona_{id}, persona_{id}_title, persona_{id}_quote 추가

### 6. 대기/실패 메시지 (필수!)

**CRITICAL**: 이 파일들을 업데이트하지 않으면 로딩 화면에서 기본 메시지만 표시됩니다!

- [ ] `lib/models/waiting_messages.dart` - 21개 언어 모두에 페르소나별 대기 메시지 추가 (각 3개씩)
- [ ] `lib/models/failure_messages.dart` - 21개 언어 모두에 페르소나별 실패 메시지 추가 (각 1개씩)

### 7. UI 스위치문 업데이트 (필수!)

**CRITICAL**: 이 파일들의 `_getPersonaName`, `_getPersonaTitle`, `_getPersonaQuote` 스위치문에 새 페르소나 케이스를 추가하지 않으면 영어로만 표시됩니다!

업데이트 필요 파일 목록:
- [ ] `lib/screens/home_screen.dart` - _getPersonaName, _getPersonaTitle
- [ ] `lib/screens/persona_detail_screen.dart` - _getPersonaName, _getPersonaTitle
- [ ] `lib/screens/advice_detail_screen.dart` - _getPersonaName, _getPersonaTitle
- [ ] `lib/screens/chat_screen.dart` - _getPersonaName, _getPersonaTitle, _getPersonaQuote
- [ ] `lib/screens/consultation_screen.dart` - _getPersonaName, _getPersonaTitle, _getPersonaQuote
- [ ] `lib/screens/favorites_screen.dart` - _getPersonaName
- [ ] `lib/screens/history_screen.dart` - _getPersonaName
- [ ] `lib/widgets/advice_card.dart` - _getPersonaName
- [ ] `lib/widgets/persona_card.dart` - _getPersonaName, _getPersonaTitle
- [ ] `lib/widgets/loading_indicator.dart` - _getPersonaName

스위치문 추가 형식:
```dart
case '{persona_id}': return l10n.persona_{persona_id};
case '{persona_id}': return l10n.persona_{persona_id}_title;
case '{persona_id}': return l10n.persona_{persona_id}_quote;
```

### 8. 기타 파일 확인 (선택)

- [ ] 이미지 최적화 확인 (WebP 변환 권장)

---

## 파일 템플릿

### prompt_{lang}.dart 템플릿

```dart
/// {LANG} prompt for {persona}

const String prompt{LangVar} = '''당신은 [이름], [설명]입니다.

인용 요구사항:
- [인용 규칙 1]
- [인용 규칙 2]

말투:
- [스타일 1]
- [스타일 2]

{JSON_SCHEMA}''';
```

### prompts.dart (Barrel file) 템플릿

```dart
/// Barrel file for {persona} prompts
/// Exports all language variants for this persona

import 'prompt_en.dart';
import 'prompt_ko.dart';
import 'prompt_ja.dart';
import 'prompt_zh.dart';
import 'prompt_zh_tw.dart';
import 'prompt_ar.dart';
import 'prompt_th.dart';
import 'prompt_ms.dart';
import 'prompt_es.dart';
import 'prompt_de.dart';
import 'prompt_fr.dart';
import 'prompt_hi.dart';
import 'prompt_id.dart';
import 'prompt_pt.dart';
import 'prompt_tr.dart';
import 'prompt_vi.dart';
import 'prompt_ru.dart';
import 'prompt_it.dart';
import 'prompt_pl.dart';
import 'prompt_nl.dart';
import 'prompt_uk.dart';

/// All prompts for {persona} indexed by language code
const Map<String, String> {persona}Prompts = {
  'en': promptEn,
  'ko': promptKo,
  'ja': promptJa,
  'zh': promptZh,
  'zh_TW': promptZhTw,
  'ar': promptAr,
  'th': promptTh,
  'ms': promptMs,
  'es': promptEs,
  'de': promptDe,
  'fr': promptFr,
  'hi': promptHi,
  'id': promptId,
  'pt': promptPt,
  'tr': promptTr,
  'vi': promptVi,
  'ru': promptRu,
  'it': promptIt,
  'pl': promptPl,
  'nl': promptNl,
  'uk': promptUk,
};
```

---

## 추가 후 검증 스크립트

```bash
# 모든 언어 파일이 있는지 확인
PERSONA_ID="new_persona"
DIR="lib/l10n/prompts/$PERSONA_ID"

for lang in en ko ja zh zh_tw ar th ms es de fr hi id pt tr vi ru it pl nl uk; do
  if [ -f "$DIR/prompt_$lang.dart" ]; then
    echo "OK: prompt_$lang.dart"
  else
    echo "MISSING: prompt_$lang.dart"
  fi
done

# barrel file 확인
if [ -f "$DIR/prompts.dart" ]; then
  echo "OK: prompts.dart"
else
  echo "MISSING: prompts.dart"
fi
```

---

## 절대 하지 말 것

1. **일부 언어만 추가하지 말 것** - 21개 언어 모두 + barrel file 필수
2. **영어 기반 프롬프트 사용 금지** - 각 언어로 네이티브하게 작성
3. **영어로 "respond in {language}"하지 말 것** - 프롬프트 자체가 해당 언어로 작성되어야 함
4. **prompt_loader.dart 업데이트 잊지 말 것** - import 및 _personaPrompts 추가 필수

---

## 마지막 확인

새 페르소나 추가 후:

```bash
# 모든 페르소나 폴더에 22개 파일이 있는지 확인
for dir in lib/l10n/prompts/*/; do
  count=$(ls -1 "$dir"*.dart 2>/dev/null | wc -l)
  name=$(basename "$dir")
  echo "$name: $count/22 files"
done
```

모든 페르소나가 22/22이어야 합니다 (21개 언어 + 1개 barrel file)

---

## 대기/실패 메시지 템플릿

### waiting_messages.dart 구조

각 언어 섹션에 다음 형식으로 추가:

```dart
'{persona_id}': [
  '"메시지 1 - 캐릭터 특성 반영..."',
  '"메시지 2 - 유명 대사/능력 관련..."',
  '"메시지 3 - 세계관 요소 활용..."',
],
```

**메시지 작성 가이드**:
- 각 페르소나당 3개의 대기 메시지
- 캐릭터의 특성, 유명 대사, 능력, 세계관 요소 활용
- 21개 언어 모두 해당 언어로 네이티브하게 작성
- 쌍따옴표로 감싸고 말줄임표(...) 포함

### failure_messages.dart 구조

```dart
'{persona_id}': {
  'en': '"English failure message..."',
  'ko': '"한국어 실패 메시지..."',
  // ... 21개 언어 모두
},
```

**메시지 작성 가이드**:
- 각 페르소나당 1개의 실패 메시지
- 캐릭터가 응답하지 못하는 상황을 캐릭터답게 표현
- 사과/재시도 권유 포함

---

## 프롬프트 확장 규칙 (3단계 우선순위 인용 시스템)

확장된 페르소나는 3단계 우선순위 기반 인용 시스템을 사용합니다.

### 확장 구조

```
인용 요구사항 (우선순위 순서):
1. 1순위 - [주요 인용 출처]
   - 원천 텍스트/직접 발언 인용
   - 구체적인 출처 명시

2. 2순위 - [보조 인용 출처]
   - 1순위가 불충분할 때 사용
   - 관련 인물/제자/동료의 관찰

3. 3순위 - [추가 인용 출처]
   - 2순위도 불충분할 때 사용
   - 부차적 인물/관련 문헌
```

### 확장된 페르소나 목록

| 페르소나 | sourceTag | 1순위 | 2순위 | 3순위 |
|---------|-----------|-------|-------|-------|
| **예수** | [New Testament] | 복음서 직접 발언 | 사도들 (베드로, 요한, 바울) | 초대교회 인물들 |
| **무함마드** | [Quran, Hadith] | 꾸란, 하디스 | 사하바 (아부 바크르, 우마르, 알리) | 초기 무슬림 |
| **붓다** | [Buddhist Sutras] | 담마파다, 경전 직접 가르침 | 수제자들 (사리푸트라, 아난다) | 아라한, 대승 보살 |
| **공자** | [Analects] | 논어 직접 발언 | 제자들 (안회, 자공, 자로) | 사서오경 |
| **소크라테스** | [Plato, Xenophon] | 플라톤 대화편 | 크세노폰 저작 | 아리스토텔레스 |
| **덤블도어** | [Harry Potter] | 해리포터 시리즈 직접 대사 | 호그와트 교직원/불사조 기사단 | 해리와 친구들 |
| **셜록 홈즈** | [Conan Doyle] | 코난 도일 원작 대사 | 왓슨 박사 관찰 | 마이크로프트, 레스트레이드, 모리아티 |
| **루피** | [One Piece] | 원피스 직접 대사 | 동료들 (조로, 나미, 상디) | 해적/해군 인물들 |

### 허구 캐릭터 인용 규칙

허구 캐릭터(덤블도어, 셜록 홈즈, 루피)의 경우:
- `citation.original_text`: **영어 원문** (원작이 영어인 경우)
- `citation.translated_text`: 해당 언어 번역

### sourceTag 추가 방법

`lib/models/persona.dart`의 Persona 정의에 `sourceTag` 필드 추가:

```dart
static const Persona newPersona = Persona(
  id: 'new_persona',
  nameKey: 'persona_new_persona',
  titleKey: 'persona_new_persona_title',
  quoteKey: 'persona_new_persona_quote',
  category: PersonaCategory.religion,
  imagePath: AppAssets.newPersona,
  era: 1000,
  sourceTag: '[Source Name]',  // 확장된 페르소나에 추가
);
```

### 프롬프트 확장 템플릿

```dart
const String promptKo = '''당신은 [이름], [설명]입니다.

인용 요구사항 (우선순위 순서):
1. 1순위 - [주요 출처]:
   - [인용 방법]
   - [형식 예시]
   - [참조 내용]

2. 2순위 - [보조 출처]:
   - 1순위가 불충분할 때 사용
   - 형식: "[출처]에서 [인물]이 말하기를..."
   - [참조 내용]

3. 3순위 - [추가 출처]:
   - 2순위도 불충분할 때 사용
   - [인물 목록]
   - 형식: "[인물]이 [상황]에서..."

말투:
- [스타일 1]
- [스타일 2]

중요 지침:
- advice 필드는 반드시 줄바꿈(\\n)을 사용하여 단락을 구분하세요
- citation.original_text는 [원본 언어] 원문
- citation.translated_text는 [대상 언어] 번역

응답 형식 (JSON):
{JSON_SCHEMA}

중요: 반드시 한국어로 응답하세요.''';
```

---

## 확장 검증 체크리스트

확장 후 반드시 확인:

1. **21개 언어 파일 모두 확장됨**
2. **3단계 우선순위 구조 일관성**
3. **각 언어별 응답 지시 포함** (예: "중요: 반드시 한국어로 응답하세요")
4. **sourceTag가 persona.dart에 추가됨**
5. **허구 캐릭터: original_text 언어 규칙 준수**
