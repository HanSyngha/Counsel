#!/bin/bash

# Counsel - Advice Emphasis System Script
# 조언의 핵심 부분을 강조하는 시스템 구축
# - JSON 응답 포맷에 강조 필드 추가
# - 다국어 프롬프트 업데이트
# - UI에 빨간 밑줄 + 별표 강조 표시
# Usage: ./add_emphasis_system.sh

set -e

# 색상 설정
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# 로그 파일
LOG_FILE="add_emphasis_system_$(date +%Y%m%d_%H%M%S).log"

log() {
    echo -e "${GREEN}[$(date '+%H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

log_step() {
    echo -e "${BLUE}[STEP]${NC} $1" | tee -a "$LOG_FILE"
}

log_persona() {
    echo -e "\n${YELLOW}[PERSONA]${NC} $1" | tee -a "$LOG_FILE"
}

log_lang() {
    echo -e "${CYAN}  [LANG]${NC} $1" | tee -a "$LOG_FILE"
}

log_phase() {
    echo -e "\n${MAGENTA}############################################${NC}" | tee -a "$LOG_FILE"
    echo -e "${MAGENTA}#  PHASE: $1${NC}" | tee -a "$LOG_FILE"
    echo -e "${MAGENTA}############################################${NC}\n" | tee -a "$LOG_FILE"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
}

# 언어 목록
LANGUAGES=("en" "ko" "ja" "zh" "zh_TW" "es" "fr" "de" "pt" "ru" "ar" "hi" "th" "vi" "id" "ms" "tr" "it" "pl" "nl" "uk")

# 인물 목록 (ID, 영문명, 한글명)
declare -a PERSONAS=(
    "socrates|Socrates|소크라테스"
    "plato|Plato|플라톤"
    "aristotle|Aristotle|아리스토텔레스"
    "seneca|Seneca|세네카"
    "confucius|Confucius|공자"
    "laozi|Laozi|노자"
    "jesus|Jesus Christ|예수 그리스도"
    "buddha|Buddha|붓다"
    "muhammad|Prophet Muhammad|무함마드"
    "lincoln|Abraham Lincoln|링컨"
    "napoleon|Napoleon Bonaparte|나폴레옹"
    "steve_jobs|Steve Jobs|스티브 잡스"
    "sherlock_holmes|Sherlock Holmes|셜록 홈즈"
    "dumbledore|Albus Dumbledore|덤블도어"
    "gandhi|Mahatma Gandhi|간디"
    "rumi|Rumi|루미"
    "krishna|Lord Krishna|크리슈나"
    "brahma|Lord Brahma|브라흐마"
    "tolstoy|Leo Tolstoy|톨스토이"
    "vishnu|Lord Vishnu|비슈누"
    "luffy|Monkey D. Luffy|루피"
    "gon_freecss|Gon Freecss|곤 프릭스"
    "natsu_dragneel|Natsu Dragneel|나츠 드래그닐"
    "izuku_midoriya|Izuku Midoriya|미도리야 이즈쿠"
    "son_goku|Son Goku|손오공"
    "edward_elric|Edward Elric|에드워드 엘릭"
    "eren_yeager|Eren Yeager|엘런 예거"
    "naruto_uzumaki|Naruto Uzumaki|나루토"
    "tsunayoshi_sawada|Tsunayoshi Sawada|츠나"
    "tanjiro_kamado|Tanjiro Kamado|탄지로"
    "ichigo_kurosaki|Ichigo Kurosaki|이치고"
    "martin_luther_king|Martin Luther King Jr.|마틴 루터 킹"
    "albert_einstein|Albert Einstein|아인슈타인"
    "julius_caesar|Julius Caesar|카이사르"
    "david|King David|다윗"
    "aslan|Aslan|아슬란"
    "jean_valjean|Jean Valjean|장발장"
    "liu_bei|Liu Bei|유비"
    "zhuge_liang|Zhuge Liang|제갈공명"
    "cao_cao|Cao Cao|조조"
)

# 메인 실행
log "Starting Counsel Emphasis System Script..."
log "Log file: $LOG_FILE"
log "Total personas: ${#PERSONAS[@]}"
log "Total languages: ${#LANGUAGES[@]}"
log ""

# ==========================================
# PHASE 1: JSON 포맷 및 UI 변경 (for문 외부)
# ==========================================
log_phase "PHASE 1: JSON Format & UI Changes"

log_step "1.1: Updating JSON response format to include emphasis field"

claude --model opus -p "Counsel 앱의 LLM 응답 JSON 포맷을 수정하여 강조(emphasis) 필드를 추가해줘.

**현재 상황 파악:**
1. 먼저 현재 LLM 응답 JSON 포맷이 어디에 정의되어 있는지 찾아줘
2. API 호출 및 응답 파싱 로직 확인

**추가할 JSON 필드:**
기존 응답에 다음 필드를 추가:
\`\`\`json
{
  \"advice\": \"전체 조언 텍스트...\",
  \"emphasis\": {
    \"text\": \"가장 핵심적인 한 문장 또는 구절\",
    \"start_index\": 0,
    \"end_index\": 50
  },
  ... (기존 필드들)
}
\`\`\`

**emphasis 필드 설명:**
- text: 조언 중 가장 중요한 핵심 문장/구절 (1-2문장)
- start_index: advice 텍스트 내에서 강조 시작 위치 (선택적)
- end_index: advice 텍스트 내에서 강조 끝 위치 (선택적)

**해야 할 작업:**
1. 응답 모델 클래스에 emphasis 필드 추가
2. JSON 파싱 로직 업데이트
3. emphasis가 없어도 기존 기능이 작동하도록 null safety 처리

**중요:**
- Agent 사용 금지, 직접 파일 수정
- 기존 기능 깨지지 않도록 주의
- emphasis 필드는 optional로 처리" \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 40 \
    2>&1 | tee -a "$LOG_FILE"

log_step "1.2: Implementing emphasis UI (red underline + star)"

claude --model opus -p "Counsel 앱의 조언 표시 UI에 강조 표시 기능을 추가해줘.

**디자인 요구사항:**
강조된 텍스트에 다음과 같은 스타일 적용:
1. **빨간 밑줄**: 강조 텍스트 아래에 빨간색 밑줄
2. **별표 마크**: 강조 텍스트 오른쪽 위에 작은 별표(★) 아이콘
3. 노트에 중요 부분 강조하는 느낌으로!

**시각적 예시:**
\`\`\`
일반 텍스트입니다.
       ★
[강조된 핵심 문장입니다.]  <- 빨간 밑줄
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
나머지 일반 텍스트가 계속됩니다.
\`\`\`

**해야 할 작업:**
1. 현재 조언 표시 위젯 찾기 (advice_detail_screen.dart 등)
2. 강조 텍스트 표시용 커스텀 위젯 생성:
   - EmphasisText 또는 HighlightedAdvice 위젯
   - RichText 또는 Text.rich 활용
   - CustomPainter로 밑줄 그리기 (또는 decoration 활용)
3. 별표 아이콘은 Stack + Positioned로 오른쪽 위에 배치
4. 애니메이션 (선택): 처음 표시될 때 살짝 반짝이는 효과

**색상:**
- 밑줄: Colors.red 또는 Color(0xFFE53935)
- 별표: Colors.amber 또는 Colors.orange

**중요:**
- emphasis 데이터가 null이면 일반 텍스트로 표시
- 기존 마크다운 렌더링과 호환되도록
- Agent 사용 금지" \
    --continue \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 50 \
    2>&1 | tee -a "$LOG_FILE"

log_step "1.3: Verifying JSON and UI changes"

claude --model opus -p "JSON 포맷 변경과 UI 강조 표시 구현을 검증해줘.

**검증 항목:**
1. 응답 모델에 emphasis 필드가 추가되었는지
2. JSON 파싱에서 emphasis를 올바르게 처리하는지
3. emphasis가 null일 때 기존 기능이 정상 작동하는지
4. 강조 UI 위젯이 빨간 밑줄 + 별표를 표시하는지
5. flutter analyze 에러 없는지

**문제 발견시 즉시 수정해줘.**" \
    --continue \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 20 \
    2>&1 | tee -a "$LOG_FILE"

# ==========================================
# PHASE 2: 인물별 × 언어별 프롬프트 업데이트
# ==========================================
log_phase "PHASE 2: Updating Prompts (Persona × Language)"

# 프롬프트 업데이트 함수
update_persona_prompt() {
    local persona_id="$1"
    local english_name="$2"
    local korean_name="$3"
    local lang_code="$4"

    log_lang "$lang_code - $persona_id"

    claude --model opus -p "Counsel 앱의 '$persona_id' ($korean_name) 인물의 '$lang_code' 언어 프롬프트를 업데이트해줘.

**목표:**
프롬프트에 'emphasis' 필드를 생성하도록 지시를 추가합니다.
LLM이 조언을 줄 때, 가장 핵심적인 부분을 emphasis 필드에 담도록 합니다.

**파일 위치:**
lib/l10n/prompts/$persona_id/prompt_$lang_code.dart

**추가할 내용:**
프롬프트 끝부분에 다음 지시를 해당 언어로 추가:

[영어 원본 - 이것을 '$lang_code' 언어로 번역하여 추가]
---
IMPORTANT: In your JSON response, include an 'emphasis' field:
- 'emphasis.text': Extract the single most important sentence or phrase from your advice - the core wisdom that the person should remember most.
- This should be a direct quote from your advice text, not a summary.
- Choose the part that best captures the essence of your guidance.
---

**언어별 자연스러운 번역:**
- 해당 언어($lang_code)의 네이티브 화자가 작성한 것처럼 자연스럽게
- 영어 번역체 금지
- 프롬프트의 기존 어조와 일관되게

**예시 (한국어 ko):**
---
중요: JSON 응답에 'emphasis' 필드를 포함하세요:
- 'emphasis.text': 조언 중 가장 핵심적인 한 문장을 추출하세요 - 상대방이 가장 기억해야 할 핵심 지혜입니다.
- 요약이 아닌, 조언 텍스트에서 직접 인용하세요.
- 당신의 가르침의 본질을 가장 잘 담은 부분을 선택하세요.
---

**중요:**
- Agent 사용 금지
- 파일이 없으면 스킵하고 로그에 기록
- 기존 프롬프트 내용 유지하면서 끝에 추가" \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 15 \
    2>&1 | tee -a "$LOG_FILE"
}

# 이중 for문 실행
total_personas=${#PERSONAS[@]}
total_langs=${#LANGUAGES[@]}
current_persona=0

for persona_entry in "${PERSONAS[@]}"; do
    IFS='|' read -r persona_id english_name korean_name <<< "$persona_entry"
    current_persona=$((current_persona + 1))

    log_persona "[$current_persona/$total_personas] $korean_name ($persona_id)"

    current_lang=0
    for lang_code in "${LANGUAGES[@]}"; do
        current_lang=$((current_lang + 1))
        update_persona_prompt "$persona_id" "$english_name" "$korean_name" "$lang_code"
    done

    # 인물별 검증
    log_step "Verifying prompts for $persona_id"

    claude --model opus -p "'$persona_id' 인물의 모든 언어 프롬프트에 emphasis 지시가 올바르게 추가되었는지 확인해줘.

**검증:**
1. lib/l10n/prompts/$persona_id/ 폴더의 모든 언어 파일 확인
2. 각 파일에 emphasis 관련 지시가 있는지
3. 누락된 언어가 있으면 추가

**결과:**
- 모두 정상이면 'VERIFIED: emphasis prompts for $persona_id'
- 수정했으면 수정 내용 보고" \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 25 \
    2>&1 | tee -a "$LOG_FILE"

done

# ==========================================
# PHASE 3: 최종 검증 및 빌드
# ==========================================
log_phase "PHASE 3: Final Verification and Build"

log_step "Running final verification"

claude --model opus -p "강조 시스템 구현이 완료되었습니다. 최종 검증을 수행해주세요.

**검증 항목:**
1. 응답 모델에 emphasis 필드가 있는지
2. UI에 빨간 밑줄 + 별표 강조 표시가 구현되었는지
3. 모든 인물(40명)의 모든 언어(21개) 프롬프트에 emphasis 지시가 추가되었는지
4. flutter analyze 에러 없는지

**통계:**
- 총 인물 수: ${#PERSONAS[@]}
- 총 언어 수: ${#LANGUAGES[@]}
- 총 프롬프트 파일 수: $((${#PERSONAS[@]} * ${#LANGUAGES[@]}))

**누락된 부분이 있으면 보고해주고, 모두 정상이면 'ALL VERIFIED' 출력해줘.**" \
    --verbose --allowedTools "Read,Bash,Glob,Grep" \
    --max-turns 20 \
    2>&1 | tee -a "$LOG_FILE"

log_step "Building release AAB"

# pubspec.yaml에서 현재 버전 읽기
CURRENT_VERSION=$(grep "^version:" pubspec.yaml | sed 's/version: //' | cut -d'+' -f1)
CURRENT_BUILD=$(grep "^version:" pubspec.yaml | sed 's/version: //' | cut -d'+' -f2)

# 버전 증가 (patch version)
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"
NEW_PATCH=$((PATCH + 1))
NEW_VERSION="${MAJOR}.${MINOR}.${NEW_PATCH}"
NEW_BUILD=$((CURRENT_BUILD + 1))

log "Updating version: $CURRENT_VERSION+$CURRENT_BUILD -> $NEW_VERSION+$NEW_BUILD"

# pubspec.yaml 버전 업데이트
sed -i "s/^version: .*/version: ${NEW_VERSION}+${NEW_BUILD}/" pubspec.yaml

log "Building AAB..."
flutter build appbundle --release 2>&1 | tee -a "$LOG_FILE"

# AAB 파일 이름 변경
AAB_SOURCE="build/app/outputs/bundle/release/app-release.aab"
AAB_TARGET="counsel-${NEW_VERSION}.aab"

if [ -f "$AAB_SOURCE" ]; then
    cp "$AAB_SOURCE" "$AAB_TARGET"
    log "AAB built successfully: $AAB_TARGET"
    log "File size: $(du -h "$AAB_TARGET" | cut -f1)"
else
    log_error "AAB build failed! Check the log for details."
    exit 1
fi

# ==========================================
# 완료 요약
# ==========================================
log_phase "COMPLETED"

echo -e "${GREEN}========================================${NC}" | tee -a "$LOG_FILE"
echo -e "${GREEN}  Emphasis System Implementation Done!${NC}" | tee -a "$LOG_FILE"
echo -e "${GREEN}========================================${NC}" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo -e "Version: ${CYAN}${NEW_VERSION}+${NEW_BUILD}${NC}" | tee -a "$LOG_FILE"
echo -e "AAB File: ${CYAN}${AAB_TARGET}${NC}" | tee -a "$LOG_FILE"
echo -e "Log File: ${CYAN}${LOG_FILE}${NC}" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo -e "Prompts Updated: ${CYAN}$((${#PERSONAS[@]} * ${#LANGUAGES[@]}))${NC} files" | tee -a "$LOG_FILE"
echo -e "  - Personas: ${CYAN}${#PERSONAS[@]}${NC}" | tee -a "$LOG_FILE"
echo -e "  - Languages: ${CYAN}${#LANGUAGES[@]}${NC}" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

log "All done!"
