#!/bin/bash

# Counsel - Batch Persona Addition Script
# 각 인물을 순차적으로 추가하는 자동화 스크립트
# Usage: ./add_personas.sh

set -e

# 색상 설정
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 로그 파일
LOG_FILE="add_personas_$(date +%Y%m%d_%H%M%S).log"

log() {
    echo -e "${GREEN}[$(date '+%H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

log_step() {
    echo -e "${BLUE}[STEP]${NC} $1" | tee -a "$LOG_FILE"
}

log_persona() {
    echo -e "\n${YELLOW}========================================${NC}" | tee -a "$LOG_FILE"
    echo -e "${YELLOW}  Processing: $1${NC}" | tee -a "$LOG_FILE"
    echo -e "${YELLOW}========================================${NC}\n" | tee -a "$LOG_FILE"
}

# 인물 추가 함수
add_persona() {
    local korean_file="$1"
    local persona_id="$2"
    local english_name="$3"
    local korean_display="$4"
    local category="$5"
    local source="$6"

    log_persona "$korean_display ($english_name)"

    # Step 1: 페르소나 완벽하게 추가
    log_step "Step 1/3: Adding persona '$persona_id'"

    claude -p "PERSONA_ADDITION_GUIDE.md를 참고해서 다음 인물을 완벽하게 추가해줘. agent는 사용하지 말고 직접 작업해줘.

인물 정보:
- 영문 ID: $persona_id
- 영문 이름: $english_name
- 한글 이름: $korean_display
- 카테고리: $category
- 출처/작품: $source
- 현재 이미지 파일 (한글): assets/images/personas/$korean_file (확장자 포함된 전체 파일명)

해야 할 작업 (순서대로):

**[가장 먼저] 이미지 파일명 영어로 변경:**
- 현재 파일: assets/images/personas/$korean_file
- 변경할 파일: assets/images/personas/${persona_id}.확장자
- ls로 현재 파일 확장자 확인 후 mv 명령어로 변경

**그 다음 작업:**
1. lib/l10n/prompts/$persona_id/ 폴더 생성
2. 21개 언어별 prompt 파일 생성 (각 언어로 네이티브하게 작성, 영어 기반 금지)
3. prompts.dart barrel file 생성
4. lib/l10n/prompts/prompt_loader.dart 업데이트
5. lib/models/persona.dart에 Persona 추가
6. lib/config/constants.dart에 asset 경로 추가
7. 21개 ARB 파일에 persona 번역 추가 (persona_${persona_id}, persona_${persona_id}_title, persona_${persona_id}_quote)

중요:
- 이미지 파일명 변경을 가장 먼저 수행할 것!
- 모든 언어 파일을 빠짐없이 생성할 것
- 영어로 'respond in Korean' 같은 방식 금지, 각 언어로 프롬프트 자체를 작성
- agent 사용 금지, 직접 파일 생성/수정" \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 50 \
    2>&1 | tee -a "$LOG_FILE"

    # Step 2: 에러 없이 잘 추가되었는지 검토
    log_step "Step 2/3: Verifying persona '$persona_id'"

    claude -p "방금 추가한 페르소나 '$persona_id' ($korean_display)가 에러 없이 완벽하게 추가되었는지 검토해줘.

검토 항목:
1. lib/l10n/prompts/$persona_id/ 폴더에 22개 파일이 있는지 (21개 언어 + prompts.dart)
2. prompt_loader.dart에 import와 _personaPrompts 매핑이 추가되었는지
3. persona.dart에 Persona 정의가 추가되었는지
4. PersonaData.all 리스트에 추가되었는지
5. constants.dart에 asset 경로가 추가되었는지
6. 21개 ARB 파일 모두에 번역이 추가되었는지
7. 이미지 파일이 올바른 경로에 있는지
8. flutter analyze로 에러가 없는지

누락된 부분이 있으면 즉시 수정해줘." \
    --continue \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 30 \
    2>&1 | tee -a "$LOG_FILE"

    # Step 3: 확장 페르소나 검토
    log_step "Step 3/3: Checking extended persona for '$persona_id'"

    claude -p "페르소나 '$persona_id' ($korean_display)가 확장이 필요한 인물인지 검토해줘.

확장이 필요한 경우:
- 종교적 인물 (성경, 꾸란, 경전 등의 출처가 있는 경우)
- 철학자 (제자나 후학의 기록이 있는 경우)
- 허구 캐릭터 (작품 내 동료/관계자가 있는 경우)

확장 기준:
1. 본인의 직접적인 말/기록 외에 인용할 수 있는 2차, 3차 출처가 있는가?
2. 제자, 동료, 가족 등 관련 인물의 관찰/기록이 있는가?

만약 확장이 필요하다면:
1. persona.dart에 sourceTag 추가
2. 모든 21개 언어 프롬프트를 3단계 우선순위 인용 시스템으로 업데이트:
   - 1순위: 본인 직접 발언/기록
   - 2순위: 가까운 관계자 (제자, 동료, 크루 등)
   - 3순위: 관련 인물/문헌

확장이 필요 없다면 그대로 두고, 필요하다면 모든 언어 파일을 업데이트해줘." \
    --continue \
    --verbose --allowedTools "Read,Write,Edit,Bash,Glob,Grep" \
    --max-turns 40 \
    2>&1 | tee -a "$LOG_FILE"

    log "Completed: $korean_display ($persona_id)"
}

# 메인 실행
log "Starting batch persona addition..."
log "Log file: $LOG_FILE"

# 애니메이션 캐릭터
add_persona "곤프릭스(헌터x헌터).jpeg" "gon_freecss" "Gon Freecss" "곤 프릭스" "anime" "Hunter x Hunter"
add_persona "나츠드래그닐(페어리테일).jpeg" "natsu_dragneel" "Natsu Dragneel" "나츠 드래그닐" "anime" "Fairy Tail"
add_persona "미도리야이즈쿠(나의 히어로 아카데미아).jpeg" "izuku_midoriya" "Izuku Midoriya" "미도리야 이즈쿠" "anime" "My Hero Academia"
add_persona "손오공(드래곤볼).jpeg" "son_goku" "Son Goku" "손오공" "anime" "Dragon Ball"
add_persona "에드워드엘릭(강철의연금술사).jpeg" "edward_elric" "Edward Elric" "에드워드 엘릭" "anime" "Fullmetal Alchemist"
add_persona "엘런예거(진격의거인).jpeg" "eren_yeager" "Eren Yeager" "엘런 예거" "anime" "Attack on Titan"
add_persona "우즈마키나루토(나루토).jpeg" "naruto_uzumaki" "Naruto Uzumaki" "우즈마키 나루토" "anime" "Naruto"
add_persona "츠나(가정교사히트맨리본).jpeg" "tsunayoshi_sawada" "Tsunayoshi Sawada" "사와다 츠나요시" "anime" "Katekyo Hitman Reborn"
add_persona "카마도탄지로(귀멸의칼날).jpeg" "tanjiro_kamado" "Tanjiro Kamado" "카마도 탄지로" "anime" "Demon Slayer"
add_persona "쿠로사키이치고(블리치).png" "ichigo_kurosaki" "Ichigo Kurosaki" "쿠로사키 이치고" "anime" "Bleach"

# 역사적 인물
add_persona "마틴루터킹주니어.jpeg" "martin_luther_king" "Martin Luther King Jr." "마틴 루터 킹 주니어" "history" "none"
add_persona "알버트아인슈타인.jpg" "albert_einstein" "Albert Einstein" "알버트 아인슈타인" "history" "none"
add_persona "율리우스카이사르.jpg" "julius_caesar" "Julius Caesar" "율리우스 카이사르" "history" "none"

# 종교/문학 인물
add_persona "다윗.jpeg" "david" "King David" "다윗 왕" "religion" "Old Testament"
add_persona "아슬란(나니아연대기).jpg" "aslan" "Aslan" "아슬란" "literature" "The Chronicles of Narnia"
add_persona "장발장.jpeg" "jean_valjean" "Jean Valjean" "장발장" "literature" "Les Miserables"

# 삼국지 인물
add_persona "유비[삼국지].jpeg" "liu_bei" "Liu Bei" "유비" "history" "Romance of the Three Kingdoms"
add_persona "제갈공명[삼국지].jpeg" "zhuge_liang" "Zhuge Liang" "제갈공명" "history" "Romance of the Three Kingdoms"
add_persona "조조[삼국지].jpeg" "cao_cao" "Cao Cao" "조조" "history" "Romance of the Three Kingdoms"

# 최종 검증
log "Running final verification..."

claude -p "모든 페르소나 추가가 완료되었습니다. 최종 검증을 수행해주세요:

1. 모든 페르소나 폴더에 22개 파일이 있는지 확인
2. flutter analyze 실행하여 에러 확인
3. 누락된 부분이 있으면 보고" \
    --verbose --allowedTools "Read,Bash,Glob,Grep" \
    --max-turns 10 \
    2>&1 | tee -a "$LOG_FILE"

log "Batch persona addition completed!"
log "Check $LOG_FILE for full details."
