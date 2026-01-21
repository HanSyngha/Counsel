#!/bin/bash

# =============================================================================
# 검증 + 수정 + AAB 빌드 스크립트 v2.0.5
# 40개 인물 × 21개 언어 = 840개 파일 검증
# =============================================================================

cd /home/syngha/Counsel

# 색상
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo "============================================================"
echo "   🔍 Prompt 파일 검증 시작"
echo "   40 인물 × 21 언어 = 840 파일"
echo "============================================================"
echo ""

# Python으로 검증 및 수정
python3 << 'PYTHON_SCRIPT'
import os
import re
import sys

# 언어별 emphasis.text 번역
EMPHASIS_TEXT = {
    "en": "The most important sentence from your advice",
    "ko": "조언 중 가장 핵심적인 한 문장",
    "ja": "あなたのアドバイスで最も重要な一文",
    "zh": "建议中最重要的一句话",
    "zh_tw": "建議中最重要的一句話",
    "es": "La frase más importante de tu consejo",
    "fr": "La phrase la plus importante de ton conseil",
    "de": "Der wichtigste Satz aus deinem Rat",
    "pt": "A frase mais importante do seu conselho",
    "ru": "Самое важное предложение из вашего совета",
    "ar": "أهم جملة من نصيحتك",
    "hi": "आपकी सलाह का सबसे महत्वपूर्ण वाक्य",
    "th": "ประโยคที่สำคัญที่สุดจากคำแนะนำของคุณ",
    "vi": "Câu quan trọng nhất từ lời khuyên của bạn",
    "id": "Kalimat terpenting dari nasihat Anda",
    "ms": "Ayat paling penting daripada nasihat anda",
    "tr": "Tavsiyenizden en önemli cümle",
    "it": "La frase più importante del tuo consiglio",
    "pl": "Najważniejsze zdanie z twojej rady",
    "nl": "De belangrijkste zin uit je advies",
    "uk": "Найважливіше речення з вашої поради",
}

def check_emphasis_in_json(content):
    """
    JSON 예시 블록 안에 "emphasis": { 가 있는지 확인

    올바른 예시:
    {
      "advice": "...",
      "action_steps": [...],
      "closing_words": "...",
      "emphasis": {
        "text": "..."
      }
    }

    잘못된 예시 (JSON 밖에만 설명):
    {
      "advice": "...",
      "closing_words": "..."
    }

    IMPORTANT: Include 'emphasis' field...
    """
    # JSON 블록 찾기: { 로 시작해서 } 로 끝나는 부분 중 "citation" 포함된 것
    # 응답 형식 JSON 블록을 찾음
    json_pattern = r'\{\s*"citation"[\s\S]*?\n\}'

    matches = re.findall(json_pattern, content)

    if not matches:
        return False, "JSON 블록을 찾을 수 없음"

    # 마지막 JSON 블록 (응답 형식)에서 emphasis 확인
    json_block = matches[-1]

    if '"emphasis":' in json_block and '"text":' in json_block:
        return True, "OK"
    else:
        return False, "JSON 안에 emphasis 없음"

def fix_file(filepath, lang):
    """파일에 emphasis 필드 추가"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # 이미 JSON 안에 emphasis 있으면 스킵
    is_ok, _ = check_emphasis_in_json(content)
    if is_ok:
        return False, "이미 정상"

    emphasis_text = EMPHASIS_TEXT.get(lang)
    if not emphasis_text:
        return False, f"알 수 없는 언어: {lang}"

    # closing_words 다음 줄의 } 앞에 emphasis 추가
    # 패턴: "closing_words": "..." 다음에 } 가 오는 경우
    pattern = r'("closing_words":\s*"[^"]*")\s*\n(\s*)\}'

    def replacement(m):
        closing = m.group(1)
        indent = m.group(2)
        return f'{closing},\n{indent}  "emphasis": {{\n{indent}    "text": "{emphasis_text}"\n{indent}  }}\n{indent}}}'

    new_content, count = re.subn(pattern, replacement, content)

    if count > 0:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        return True, "수정 완료"
    else:
        return False, "패턴 매칭 실패"

# 메인 검증 로직
personas_dir = "lib/l10n/prompts"
languages = ["en", "ko", "ja", "zh", "zh_tw", "es", "fr", "de", "pt", "ru",
             "ar", "hi", "th", "vi", "id", "ms", "tr", "it", "pl", "nl", "uk"]

total = 0
passed = 0
fixed = 0
failed = 0
failed_list = []

# 모든 persona 폴더
personas = sorted([d for d in os.listdir(personas_dir)
                   if os.path.isdir(os.path.join(personas_dir, d)) and d != '__pycache__'])

print(f"검증 대상: {len(personas)}개 인물 × {len(languages)}개 언어\n")

for persona in personas:
    persona_path = os.path.join(personas_dir, persona)
    print(f"\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m")
    print(f"\033[1;33m👤 {persona}\033[0m")
    print(f"\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m")

    for lang in languages:
        filepath = os.path.join(persona_path, f"prompt_{lang}.dart")
        total += 1

        if not os.path.exists(filepath):
            print(f"  {lang}: \033[0;31m❌ 파일 없음\033[0m")
            failed += 1
            failed_list.append(f"{persona}/{lang}")
            continue

        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        is_ok, msg = check_emphasis_in_json(content)

        if is_ok:
            print(f"  {lang}: \033[0;32m✅ OK\033[0m")
            passed += 1
        else:
            # 수정 시도
            was_fixed, fix_msg = fix_file(filepath, lang)
            if was_fixed:
                print(f"  {lang}: \033[1;33m🔧 수정됨\033[0m")
                fixed += 1
                passed += 1
            else:
                print(f"  {lang}: \033[0;31m❌ {fix_msg}\033[0m")
                failed += 1
                failed_list.append(f"{persona}/{lang}")

print("\n" + "=" * 60)
print("   📊 검증 결과")
print("=" * 60)
print(f"\n총 파일: {total}")
print(f"\033[0;32m통과: {passed}\033[0m")
print(f"\033[1;33m수정됨: {fixed}\033[0m")
print(f"\033[0;31m실패: {failed}\033[0m")

if failed_list:
    print(f"\n\033[0;31m실패 목록:\033[0m")
    for item in failed_list:
        print(f"  - {item}")

# 결과 코드 반환
if failed > 0:
    sys.exit(1)
else:
    sys.exit(0)
PYTHON_SCRIPT

# Python 결과 확인
if [ $? -eq 0 ]; then
    echo ""
    echo "============================================================"
    echo -e "${GREEN}✅ 모든 검증 완료! AAB 빌드 시작${NC}"
    echo "============================================================"
    echo ""

    echo "📝 버전 업데이트 (2.0.5+25)..."
    sed -i 's/^version: .*/version: 2.0.5+25/' pubspec.yaml

    echo "🧹 Flutter clean..."
    flutter clean

    echo "📦 Flutter pub get..."
    flutter pub get

    echo "🏗️ AAB 빌드 (v2.0.5)..."
    flutter build appbundle --release

    # 결과 파일 복사
    if [ -f "build/app/outputs/bundle/release/app-release.aab" ]; then
        cp build/app/outputs/bundle/release/app-release.aab ./counsel-v2.0.5.aab
        echo ""
        echo "============================================================"
        echo -e "${GREEN}🎉 v2.0.5 빌드 완료!${NC}"
        echo "============================================================"
        echo ""
        echo "AAB 파일 위치:"
        echo "  - build/app/outputs/bundle/release/app-release.aab"
        echo "  - ./counsel-v2.0.5.aab"
        ls -lh ./counsel-v2.0.5.aab
    else
        echo -e "${RED}❌ AAB 빌드 실패${NC}"
    fi
else
    echo ""
    echo "============================================================"
    echo -e "${YELLOW}⚠️ 검증 실패 - 빌드 건너뜀${NC}"
    echo "============================================================"
fi
