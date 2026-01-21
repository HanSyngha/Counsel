#!/bin/bash

# Counsel - Persona UI Personalization Script
# 각 인물별 UI 개인화 작업 자동화 스크립트
# - 지혜구하기 버튼 텍스트를 인물별 표현으로 변경
# - 채팅창/로딩창/결과창 색상 및 디자인 인물별 커스터마이징
# Usage: ./personalize_ui.sh

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
LOG_FILE="personalize_ui_$(date +%Y%m%d_%H%M%S).log"

log() {
    echo -e "${GREEN}[$(date '+%H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

log_step() {
    echo -e "${BLUE}[STEP]${NC} $1" | tee -a "$LOG_FILE"
}

log_substep() {
    echo -e "${CYAN}  [SUB]${NC} $1" | tee -a "$LOG_FILE"
}

log_persona() {
    echo -e "\n${YELLOW}========================================${NC}" | tee -a "$LOG_FILE"
    echo -e "${YELLOW}  Processing: $1${NC}" | tee -a "$LOG_FILE"
    echo -e "${YELLOW}========================================${NC}\n" | tee -a "$LOG_FILE"
}

log_phase() {
    echo -e "\n${MAGENTA}############################################${NC}" | tee -a "$LOG_FILE"
    echo -e "${MAGENTA}#  PHASE: $1${NC}" | tee -a "$LOG_FILE"
    echo -e "${MAGENTA}############################################${NC}\n" | tee -a "$LOG_FILE"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
}

# 인물별 UI 개인화 함수
personalize_persona() {
    local persona_id="$1"
    local english_name="$2"
    local korean_name="$3"
    local category="$4"
    local source="$5"

    log_persona "$korean_name ($english_name)"

    # Step 1: 지혜구하기 버튼 텍스트를 인물별 표현으로 변경
    log_step "Step 1/4: Creating persona-specific 'Seek Wisdom' button texts for '$persona_id'"

    claude --model opus -p "Counsel 앱에서 '$persona_id' ($korean_name) 인물의 '지혜구하기' 버튼 텍스트를 개인화해줘.

**인물 정보:**
- ID: $persona_id
- 영문 이름: $english_name
- 한글 이름: $korean_name
- 카테고리: $category
- 출처/작품: $source

**핵심 원칙 (매우 중요!):**
버튼 텍스트는 반드시 '조언을 구하다/가르침을 청하다/지혜를 얻다'의 기본 의미를 유지해야 합니다!
단순히 캐릭터 대사나 구호가 아니라, '이 인물에게 조언을 구한다'는 행위를 표현해야 합니다.

**허용되는 표현 유형:**
1. 직접 질문형: '~에게 묻기', '~께 여쭙기', '~와 상담하기'
2. 가르침 요청형: '~의 가르침을 청하다', '~의 지혜를 구하다'
3. 행적/경험 참고형: '~의 행적에서 배우기', '~의 경험을 듣다'
4. 경어체/공손형: '~님께 여쭤보기', '~의 말씀을 청하다'

**올바른 예시:**
- 카이사르: '황제께 아뢰기', '카이사르의 지혜를 구하다', '로마 황제의 행적에서 배우기'
- 소크라테스: '현자에게 묻기', '철학자의 가르침을 청하다', '소크라테스의 질문법 배우기'
- 루피: '선장에게 물어보기', '루피의 모험에서 배우기', '해적왕의 지혜를 구하다'
- 덤블도어: '교장 선생님께 여쭙기', '위대한 마법사의 가르침을 청하다'
- 부처: '부처님께 여쭙기', '부처님의 가르침을 청하다', '깨달음의 길을 묻다'
- 공자: '성인의 말씀을 청하다', '공자님의 가르침을 구하다', '논어의 지혜를 얻다'
- 간디: '마하트마께 여쭙기', '비폭력의 길을 묻다', '간디의 행적에서 배우기'

**잘못된 예시 (이렇게 하면 안됨!):**
- 루피: '고무고무!' (단순 구호, 조언 구하는 의미 없음)
- 나루토: '다테바요!' (말버릇, 조언 구하는 의미 없음)
- 카이사르: 'Veni Vidi Vici' (명언, 조언 구하는 의미 없음)
- 손오공: '카메하메하!' (기술명, 조언 구하는 의미 없음)

**해야 할 작업:**

1. 먼저 현재 앱 구조를 파악해줘:
   - '지혜구하기' 버튼이 어디에 정의되어 있는지 확인 (ARB 파일의 seekWisdom 키)
   - 현재 버튼 텍스트가 어떻게 처리되는지 확인

2. 인물별 버튼 텍스트 시스템 구축 (첫 인물이면):
   - lib/models/seek_wisdom_buttons.dart 파일 생성
   - 21개 언어 지원 (en, ko, ja, zh, zh_TW, es, fr, de, pt, ru, ar, hi, th, vi, id, ms, tr, it, pl, nl, uk)
   - 구조: Map<String, Map<String, List<String>>> (언어코드 -> 인물ID -> 버튼텍스트 리스트)
   - 기본 폴백: 인물 ID가 없으면 기존 'seekWisdom' 번역 사용

3. '$persona_id' 인물에 맞는 버튼 텍스트 3-4개 작성:
   - **반드시 '질문/요청/여쭙다' 의미 포함!**
   - 캐릭터의 호칭, 직함, 특성을 반영하되 기본 구조는 '~에게 묻기/~께 여쭙기/~와 상담하기'
   - 각 언어별로 해당 언어 네이티브하게 작성 (영어 번역체 금지)
   - 버튼으로서 자연스러운 짧은 문구 (너무 길면 안됨)

4. 버튼 위젯 수정:
   - 랜덤하게 버튼 텍스트를 선택하도록 수정
   - 인물별로 다른 텍스트가 표시되도록 구현

**중요:**
- Agent 사용 금지, 직접 파일 생성/수정
- 모든 21개 언어 파일 빠짐없이 작성
- **버튼 텍스트에 반드시 '질문/요청/상담/여쭙다' 의미가 포함되어야 함!**" \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 60 \
    2>&1 | tee -a "$LOG_FILE"

    # Step 2: Step 1 검증
    log_step "Step 2/4: Verifying 'Seek Wisdom' button implementation for '$persona_id'"

    claude --model opus -p "방금 구현한 '$persona_id' ($korean_name) 인물의 '지혜구하기' 버튼 개인화가 올바르게 되었는지 검증해줘.

**검증 항목:**
1. seek_wisdom_buttons.dart 파일이 존재하고 문법 에러가 없는지
2. '$persona_id' 인물에 대해 21개 언어 모두 버튼 텍스트가 추가되었는지
3. 버튼 위젯에서 랜덤 선택 로직이 올바르게 구현되었는지
4. flutter analyze로 에러가 없는지 확인
5. **[핵심 검증]** 모든 버튼 텍스트가 아래 유형 중 하나에 해당하는지 확인!
   - 직접 질문형: '~에게 묻기', '~께 여쭙기', '~와 상담하기'
   - 가르침 요청형: '~의 가르침을 청하다', '~의 지혜를 구하다'
   - 행적/경험 참고형: '~의 행적에서 배우기', '~의 경험을 듣다'
   - 경어체/공손형: '~님께 여쭤보기', '~의 말씀을 청하다'

   **반드시 거부해야 할 유형:**
   - 단순 구호: '고무고무!', '카메하메하!'
   - 단순 명언: 'Veni Vidi Vici', '다테바요!'
   - 캐릭터 대사만: 기술명, 말버릇 등

**문제 발견시:**
- 즉시 수정하고 수정 내용 보고
- 누락된 언어가 있으면 추가
- **조언/가르침/지혜를 구하는 의미가 없는 버튼 텍스트는 반드시 수정!**

**검증 완료 후:**
- 정상이면 'VERIFIED: seek_wisdom_buttons for $persona_id' 출력
- 수정했으면 수정 내용과 함께 출력" \
    --continue \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 30 \
    2>&1 | tee -a "$LOG_FILE"

    # Step 3: 채팅창/로딩창/결과창 색상 및 디자인 개인화
    log_step "Step 3/4: Customizing chat/loading/result screen design for '$persona_id'"

    claude --model opus -p "'$persona_id' ($korean_name) 인물의 채팅창, 로딩창, 결과창을 인물 분위기에 맞게 커스터마이징해줘.

**인물 정보:**
- ID: $persona_id
- 영문 이름: $english_name
- 한글 이름: $korean_name
- 카테고리: $category
- 출처/작품: $source

**해야 할 작업:**

1. 먼저 현재 UI 구조 파악:
   - 채팅 화면 (chat_screen.dart 또는 유사)
   - 로딩 화면/인디케이터
   - 결과/응답 화면
   - 현재 테마/색상 시스템

2. 인물별 테마 시스템 구축 (첫 인물이면):
   - lib/config/persona_themes.dart 파일 생성
   - 구조: 인물ID별 테마 데이터 (primaryColor, secondaryColor, backgroundColor, accentColor, gradientColors 등)

3. '$persona_id' 인물의 테마 정의:
   - 캐릭터 분위기에 맞는 색상 팔레트 선정
   - 예시 (루피): 빨강+노랑 (해적깃발), 밝고 활기찬 톤
   - 예시 (간디): 흰색+오렌지 (카디), 평화로운 톤
   - 예시 (덤블도어): 보라+금색, 마법적이고 신비로운 톤

4. 배경 이미지/패턴 (필요시):
   - 인물에 어울리는 배경 이미지나 패턴이 필요하면
   - 직접 다운로드 가능: curl/wget으로 다운로드
   - 사용자 다운로드 필요: assets/images/backgrounds/placeholder_${persona_id}.txt 생성하고
     download_requests.md 파일에 다운로드 요청 추가

5. UI 컴포넌트 수정:
   - 선택된 인물에 따라 테마가 적용되도록 수정
   - 채팅 버블 색상, 로딩 인디케이터 색상, 배경 등

**중요:**
- Agent 사용 금지
- 기존 UI 깨지지 않도록 주의
- 테마 미적용시 기본 테마 폴백 구현" \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 60 \
    2>&1 | tee -a "$LOG_FILE"

    # Step 4: Step 3 검증
    log_step "Step 4/4: Verifying UI customization for '$persona_id'"

    claude --model opus -p "방금 구현한 '$persona_id' ($korean_name) 인물의 UI 커스터마이징이 올바르게 되었는지 검증해줘.

**검증 항목:**
1. persona_themes.dart 파일이 존재하고 문법 에러가 없는지
2. '$persona_id' 인물의 테마가 정의되어 있는지
3. UI 컴포넌트에서 인물별 테마가 올바르게 적용되는지
4. 배경 이미지 필요시 download_requests.md에 기록되어 있는지
5. flutter analyze로 에러가 없는지 확인

**문제 발견시:**
- 즉시 수정하고 수정 내용 보고

**검증 완료 후:**
- 정상이면 'VERIFIED: persona_theme for $persona_id' 출력
- 수정했으면 수정 내용과 함께 출력" \
    --continue \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 30 \
    2>&1 | tee -a "$LOG_FILE"

    log "Completed UI personalization for: $korean_name ($persona_id)"
}

# 메인 실행
log "Starting Counsel UI Personalization Script..."
log "Log file: $LOG_FILE"
log ""

# download_requests.md 초기화
log "Initializing download_requests.md..."
cat > download_requests.md << 'EOF'
# Download Requests for Counsel App

This file contains a list of assets that need to be manually downloaded by the user.

## Background Images

| Persona | Description | Suggested Search | Target Path |
|---------|-------------|------------------|-------------|
EOF

log "download_requests.md initialized."

# ==========================================
# PHASE 1: 모든 인물 UI 개인화
# ==========================================
log_phase "PHASE 1: Persona UI Personalization"

# 기존 인물들 (20개)
personalize_persona "socrates" "Socrates" "소크라테스" "philosophy" "Ancient Greece"
personalize_persona "plato" "Plato" "플라톤" "philosophy" "Ancient Greece"
personalize_persona "aristotle" "Aristotle" "아리스토텔레스" "philosophy" "Ancient Greece"
personalize_persona "seneca" "Seneca" "세네카" "philosophy" "Roman Empire"
personalize_persona "confucius" "Confucius" "공자" "philosophy" "Ancient China"
personalize_persona "laozi" "Laozi" "노자" "philosophy" "Ancient China"
personalize_persona "jesus" "Jesus Christ" "예수 그리스도" "religion" "New Testament"
personalize_persona "buddha" "Buddha" "붓다" "religion" "Buddhism"
personalize_persona "muhammad" "Prophet Muhammad" "무함마드" "religion" "Islam"
personalize_persona "lincoln" "Abraham Lincoln" "에이브러햄 링컨" "history" "American History"
personalize_persona "napoleon" "Napoleon Bonaparte" "나폴레옹 보나파르트" "history" "French History"
personalize_persona "steve_jobs" "Steve Jobs" "스티브 잡스" "history" "Apple Inc."
personalize_persona "sherlock_holmes" "Sherlock Holmes" "셜록 홈즈" "literature" "Arthur Conan Doyle"
personalize_persona "dumbledore" "Albus Dumbledore" "덤블도어" "literature" "Harry Potter"
personalize_persona "gandhi" "Mahatma Gandhi" "마하트마 간디" "history" "Indian Independence"
personalize_persona "rumi" "Rumi" "루미" "philosophy" "Sufism"
personalize_persona "krishna" "Lord Krishna" "크리슈나" "religion" "Hinduism"
personalize_persona "brahma" "Lord Brahma" "브라흐마" "religion" "Hinduism"
personalize_persona "tolstoy" "Leo Tolstoy" "레프 톨스토이" "literature" "Russian Literature"
personalize_persona "vishnu" "Lord Vishnu" "비슈누" "religion" "Hinduism"

# 신규 추가 인물들 (20개)
personalize_persona "luffy" "Monkey D. Luffy" "몽키 D. 루피" "anime" "One Piece"
personalize_persona "gon_freecss" "Gon Freecss" "곤 프릭스" "anime" "Hunter x Hunter"
personalize_persona "natsu_dragneel" "Natsu Dragneel" "나츠 드래그닐" "anime" "Fairy Tail"
personalize_persona "izuku_midoriya" "Izuku Midoriya" "미도리야 이즈쿠" "anime" "My Hero Academia"
personalize_persona "son_goku" "Son Goku" "손오공" "anime" "Dragon Ball"
personalize_persona "edward_elric" "Edward Elric" "에드워드 엘릭" "anime" "Fullmetal Alchemist"
personalize_persona "eren_yeager" "Eren Yeager" "엘런 예거" "anime" "Attack on Titan"
personalize_persona "naruto_uzumaki" "Naruto Uzumaki" "우즈마키 나루토" "anime" "Naruto"
personalize_persona "tsunayoshi_sawada" "Tsunayoshi Sawada" "사와다 츠나요시" "anime" "Katekyo Hitman Reborn"
personalize_persona "tanjiro_kamado" "Tanjiro Kamado" "카마도 탄지로" "anime" "Demon Slayer"
personalize_persona "ichigo_kurosaki" "Ichigo Kurosaki" "쿠로사키 이치고" "anime" "Bleach"
personalize_persona "martin_luther_king" "Martin Luther King Jr." "마틴 루터 킹 주니어" "history" "Civil Rights Movement"
personalize_persona "albert_einstein" "Albert Einstein" "알버트 아인슈타인" "history" "Physics"
personalize_persona "julius_caesar" "Julius Caesar" "율리우스 카이사르" "history" "Roman Empire"
personalize_persona "david" "King David" "다윗 왕" "religion" "Old Testament"
personalize_persona "aslan" "Aslan" "아슬란" "literature" "The Chronicles of Narnia"
personalize_persona "jean_valjean" "Jean Valjean" "장발장" "literature" "Les Miserables"
personalize_persona "liu_bei" "Liu Bei" "유비" "history" "Romance of the Three Kingdoms"
personalize_persona "zhuge_liang" "Zhuge Liang" "제갈공명" "history" "Romance of the Three Kingdoms"
personalize_persona "cao_cao" "Cao Cao" "조조" "history" "Romance of the Three Kingdoms"

# ==========================================
# PHASE 2: 마크다운 지원 추가
# ==========================================
log_phase "PHASE 2: Adding Markdown Support"

log_step "Implementing markdown rendering in response display and share images"

claude --model opus -p "Counsel 앱의 응답 화면과 공유 이미지에 기본적인 마크다운 렌더링을 추가해줘.

**해야 할 작업:**

1. 현재 응답 표시 방식 파악:
   - 채팅/결과 화면에서 LLM 응답이 어떻게 표시되는지 확인
   - 공유 이미지 생성 로직 확인

2. 마크다운 렌더링 구현:
   - flutter_markdown 패키지가 이미 pubspec.yaml에 있는지 확인 (없으면 추가)
   - 응답 텍스트에 마크다운 렌더링 적용
   - 지원할 마크다운 요소:
     * **굵은 글씨** (bold)
     * *기울임* (italic)
     * # 제목 (headers - h1~h3)
     * - 목록 (bullet lists)
     * 1. 번호 목록 (numbered lists)
     * > 인용 (blockquotes)
     * \`인라인 코드\` (inline code)

3. 공유 이미지에 마크다운 반영:
   - 이미지로 변환할 때 마크다운이 렌더링된 상태로 캡처
   - 또는 마크다운을 스타일이 적용된 텍스트로 변환

4. 스타일링:
   - 마크다운 요소들이 앱 테마와 어울리도록 스타일 설정
   - 인물별 테마 색상이 마크다운에도 적용되도록

**중요:**
- Agent 사용 금지
- 기존 기능 깨지지 않도록 주의
- 마크다운 없는 일반 텍스트도 정상 표시되어야 함" \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 50 \
    2>&1 | tee -a "$LOG_FILE"

log_step "Verifying markdown implementation"

claude --model opus -p "마크다운 렌더링 구현이 올바르게 되었는지 검증해줘.

**검증 항목:**
1. flutter_markdown 패키지가 pubspec.yaml에 있는지
2. 응답 화면에서 마크다운이 렌더링되는지
3. 공유 이미지 생성시 마크다운이 반영되는지
4. flutter analyze로 에러가 없는지

**문제 발견시 즉시 수정하고 보고해줘.**" \
    --continue \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 20 \
    2>&1 | tee -a "$LOG_FILE"

# ==========================================
# PHASE 3: 최종 검증 및 빌드
# ==========================================
log_phase "PHASE 3: Final Verification and Build"

log_step "Running final verification"

claude --model opus -p "모든 UI 개인화 작업이 완료되었습니다. 최종 검증을 수행해주세요.

**검증 항목:**
1. seek_wisdom_buttons.dart에 40개 인물 모두 21개 언어로 버튼 텍스트가 있는지
2. persona_themes.dart에 40개 인물 모두 테마가 정의되어 있는지
3. 마크다운 렌더링이 정상 작동하는지
4. flutter analyze로 에러가 없는지
5. download_requests.md에 사용자가 다운받아야 할 이미지가 기록되어 있는지

**누락된 부분이 있으면 보고해주고, 모두 정상이면 'ALL VERIFIED' 출력해줘.**" \
    --verbose --allowedTools "Read,Bash,Glob,Grep" \
    --max-turns 15 \
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
echo -e "${GREEN}  UI Personalization Complete!${NC}" | tee -a "$LOG_FILE"
echo -e "${GREEN}========================================${NC}" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo -e "Version: ${CYAN}${NEW_VERSION}+${NEW_BUILD}${NC}" | tee -a "$LOG_FILE"
echo -e "AAB File: ${CYAN}${AAB_TARGET}${NC}" | tee -a "$LOG_FILE"
echo -e "Log File: ${CYAN}${LOG_FILE}${NC}" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo -e "${YELLOW}Don't forget to check download_requests.md for any assets that need to be downloaded manually!${NC}" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

log "All done!"
