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

- [ ] `lib/l10n/app_*.arb` - personaName_{id}, personaTitle_{id}, personaDescription_{id} 추가

### 6. 기타 파일 확인 (선택)

- [ ] `lib/models/waiting_messages.dart` - 페르소나별 대기 메시지
- [ ] `lib/models/failure_messages.dart` - 페르소나별 실패 메시지

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
