// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '별들의 목소리';

  @override
  String get onboardingTitle => '역사 속 멘토를\n지금 만나보세요';

  @override
  String get onboardingSubtitle =>
      '예수, 소크라테스, 이순신 장군부터 스티브 잡스까지.\n당신의 고민에 시대를 초월한 지혜를 빌려드립니다.';

  @override
  String get getStarted => '지금 시작하기';

  @override
  String get homeTitle => '오늘은 누구에게 조언을 구하시겠어요?';

  @override
  String get searchPlaceholder => '플라톤, 링컨, 햄릿 검색...';

  @override
  String get featuredMentors => '추천 멘토';

  @override
  String get exploreWisdom => '지혜 탐험하기';

  @override
  String get seeAll => '전체 보기';

  @override
  String get trending => '인기';

  @override
  String get new_ => '신규';

  @override
  String get categoryAll => '전체';

  @override
  String get categoryHistory => '역사';

  @override
  String get categoryPhilosophy => '철학';

  @override
  String get categoryReligion => '종교';

  @override
  String get categoryLiterature => '문학';

  @override
  String get categoryFavorites => '즐겨찾기';

  @override
  String get inputTitle => '무엇이 마음에 걸리시나요?';

  @override
  String get inputSubtitle => '솔직하게 말씀해주세요. 구체적일수록 명확한 답을 드릴 수 있습니다.';

  @override
  String get inputPlaceholder =>
      '저는 이런 어려움을 겪고 있어요...\n이것은 이렇게 시작되었어요...\n저는 이것이 두려워요...';

  @override
  String get inputHelperDilemma => '현재 고민';

  @override
  String get inputHelperEmotion => '감정 상태';

  @override
  String get inputHelperOutcome => '원하는 결과';

  @override
  String get seekWisdom => '지혜 구하기';

  @override
  String get privacyNote => '당신의 고민은 비공개이며 익명으로 처리됩니다.';

  @override
  String characterCount(int count, int max) {
    return '$count / $max';
  }

  @override
  String get loadingConnecting => '연결 중';

  @override
  String get loadingConsulting => '고대의 지혜 서고를 탐색하고 있습니다';

  @override
  String get loadingAnalyzing => '질문 분석 중';

  @override
  String get loadingRecalling => '역사적 맥락을 떠올리는 중...';

  @override
  String get loadingOnline => '온라인';

  @override
  String get cancelRequest => '요청 취소';

  @override
  String get loadingNote => '페르소나를 불러오는 데 잠시 시간이 걸릴 수 있습니다.';

  @override
  String get resultWisdom => '지혜';

  @override
  String get resultAiPersona => 'AI 페르소나 조언';

  @override
  String get resultGeneratedBy => 'AI 페르소나가 생성함';

  @override
  String get resultScrollOfWisdom => '지혜의 두루마리';

  @override
  String get resultHistoricalRecords => '역사적 기록';

  @override
  String get resultInHisOwnWords => '그의 말로';

  @override
  String get resultKeyDecision => '핵심 결정';

  @override
  String get resultCopy => '복사';

  @override
  String get resultShare => '공유';

  @override
  String get askAnotherSage => '다른 현자에게 물어보기';

  @override
  String get resultActionSteps => '실천 단계';

  @override
  String get historyTitle => '나의 조언 기록';

  @override
  String get historySearch => '어떤 고민을 검색할까요?';

  @override
  String get historyEmpty => '아직 조언 기록이 없습니다';

  @override
  String get historyEmptySubtitle => '멘토와 대화를 시작해보세요';

  @override
  String get navSelect => '선택';

  @override
  String get navChat => '채팅';

  @override
  String get navSaved => '저장됨';

  @override
  String get navHistory => '기록';

  @override
  String get navProfile => '프로필';

  @override
  String get navSettings => '설정';

  @override
  String get settingsLanguage => '언어';

  @override
  String get settingsAbout => '앱 정보';

  @override
  String get settingsPrivacy => '개인정보 처리방침';

  @override
  String get settingsTerms => '이용약관';

  @override
  String get settingsVersion => '버전';

  @override
  String get errorGeneric => '문제가 발생했습니다. 다시 시도해주세요.';

  @override
  String get errorNetwork => '인터넷 연결을 확인해주세요.';

  @override
  String get errorTimeout => '요청 시간이 초과되었습니다. 다시 시도해주세요.';

  @override
  String get retry => '다시 시도';

  @override
  String get ok => '확인';

  @override
  String get cancel => '취소';

  @override
  String get close => '닫기';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get confirm => '확인';

  @override
  String get personaSocrates => '소크라테스';

  @override
  String get personaSocratesTitle => '서양 철학의 아버지';

  @override
  String get personaSocratesQuote => '성찰하지 않는 삶은 살 가치가 없다.';

  @override
  String get personaPlato => '플라톤';

  @override
  String get personaPlatoTitle => '이데아의 철학자';

  @override
  String get personaPlatoQuote => '친절하라, 당신이 만나는 모든 사람은 힘든 싸움을 하고 있다.';

  @override
  String get personaAristotle => '아리스토텔레스';

  @override
  String get personaAristotleTitle => '최초의 스승';

  @override
  String get personaAristotleQuote =>
      '우리는 반복적으로 하는 것이 곧 우리 자신이다. 탁월함은 행동이 아니라 습관이다.';

  @override
  String get personaSeneca => '세네카';

  @override
  String get personaSenecaTitle => '스토아 철학자';

  @override
  String get personaSenecaQuote => '우리에게 시간이 부족한 것이 아니라, 우리가 많은 시간을 낭비하는 것이다.';

  @override
  String get personaConfucius => '공자';

  @override
  String get personaConfuciusTitle => '위대한 성인';

  @override
  String get personaConfuciusQuote => '멈추지 않는 한 얼마나 천천히 가는지는 중요하지 않다.';

  @override
  String get personaLaozi => '노자';

  @override
  String get personaLaoziTitle => '도교의 창시자';

  @override
  String get personaLaoziQuote => '천 리 길도 한 걸음부터 시작된다.';

  @override
  String get personaJesus => '예수';

  @override
  String get personaJesusTitle => '영적 스승';

  @override
  String get personaJesusQuote => '네 이웃을 네 몸과 같이 사랑하라.';

  @override
  String get personaBuddha => '석가모니';

  @override
  String get personaBuddhaTitle => '깨달은 자';

  @override
  String get personaBuddhaQuote => '평화는 내면에서 온다. 밖에서 찾지 말라.';

  @override
  String get personaMuhammad => '무함마드';

  @override
  String get personaMuhammadTitle => '이슬람의 예언자';

  @override
  String get personaMuhammadQuote => '가장 훌륭한 사람은 가장 좋은 품성을 가진 사람이다.';

  @override
  String get personaLincoln => '에이브러햄 링컨';

  @override
  String get personaLincolnTitle => '미국 제16대 대통령';

  @override
  String get personaLincolnQuote => '결국 중요한 것은 인생의 햇수가 아니라, 그 햇수 속의 삶이다.';

  @override
  String get personaNapoleon => '나폴레옹';

  @override
  String get personaNapoleonTitle => '프랑스의 황제';

  @override
  String get personaNapoleonQuote => '불가능이란 어리석은 자의 사전에만 있는 단어다.';

  @override
  String get personaSteveJobs => '스티브 잡스';

  @override
  String get personaSteveJobsTitle => '비전있는 기업가';

  @override
  String get personaSteveJobsQuote => '배고파라. 우직해라.';

  @override
  String get personaSherlockHolmes => '셜록 홈즈';

  @override
  String get personaSherlockHolmesTitle => '추리의 대가';

  @override
  String get personaSherlockHolmesQuote =>
      '불가능한 것을 제거하면, 남은 것이 아무리 불가능해 보여도 그것이 진실이다.';

  @override
  String get personaDumbledore => '알버스 덤블도어';

  @override
  String get personaDumbledoreTitle => '호그와트 교장';

  @override
  String get personaDumbledoreQuote =>
      '가장 어두운 시간에도 행복을 찾을 수 있다. 단지 불을 켜야 한다는 것을 기억한다면.';

  @override
  String get personaGandhi => '마하트마 간디';

  @override
  String get personaGandhiTitle => '인도의 국부';

  @override
  String get personaGandhiQuote => '세상에서 보고 싶은 변화가 되어라.';

  @override
  String get personaRumi => '루미';

  @override
  String get personaRumiTitle => '수피 시인 & 신비주의자';

  @override
  String get personaRumiQuote => '상처는 빛이 당신에게 들어오는 곳이다.';

  @override
  String get personaKrishna => '크리슈나';

  @override
  String get personaKrishnaTitle => '바가바드 기타의 신성한 안내자';

  @override
  String get personaKrishnaQuote => '행동할 권리는 있으나, 그 결과에 대한 권리는 없다.';

  @override
  String get personaBrahma => '브라흐마';

  @override
  String get personaBrahmaTitle => '창조의 신';

  @override
  String get personaBrahmaQuote => '허상에서 진실로, 어둠에서 빛으로 인도하소서.';

  @override
  String get personaVishnu => '비슈누';

  @override
  String get personaVishnuTitle => '유지의 신';

  @override
  String get personaVishnuQuote => '다르마가 쇠퇴할 때마다, 나는 의로운 자를 보호하기 위해 현현한다.';

  @override
  String get personaTolstoy => '레프 톨스토이';

  @override
  String get personaTolstoyTitle => '러시아 문학의 거장';

  @override
  String get personaTolstoyQuote => '누구나 세상을 바꾸려 하지만, 자신을 바꾸려는 사람은 없다.';

  @override
  String get adviceYourQuestion => '당신의 질문';

  @override
  String get adviceCitation => '인용';

  @override
  String get adviceRelevance => '왜 중요한가';

  @override
  String get adviceSourceType => '출처 유형';

  @override
  String get adviceSourceName => '출처';

  @override
  String get adviceSourceLocation => '위치';

  @override
  String get adviceSourceYear => '연도';

  @override
  String get adviceSourceContext => '맥락';

  @override
  String get adviceMainCounsel => '조언';

  @override
  String get adviceActionSteps => '실천 단계';

  @override
  String get adviceClosingWords => '마무리 말씀';

  @override
  String get adviceCopy => '복사';

  @override
  String get adviceShare => '공유';

  @override
  String get adviceAddedToFavorites => '즐겨찾기에 추가됨';

  @override
  String get adviceRemovedFromFavorites => '즐겨찾기에서 삭제됨';

  @override
  String get adviceCopied => '클립보드에 복사됨';

  @override
  String get adviceShareError => '공유할 수 없습니다. 다시 시도해주세요.';

  @override
  String get sourceTypeScripture => '경전';

  @override
  String get sourceTypeBook => '책';

  @override
  String get sourceTypeSpeech => '연설';

  @override
  String get sourceTypeBattle => '전투';

  @override
  String get sourceTypeLetter => '서신';

  @override
  String get sourceTypeDialogue => '대화';

  @override
  String get sourceTypeMoment => '순간';

  @override
  String get sourceTypeTeaching => '가르침';

  @override
  String get sourceTypeNovel => '소설';

  @override
  String get chatSuggestionsTitle => '추천 주제';

  @override
  String get chatIntroMessage => '마음에 담긴 것을 나누어 주시면, 제가 할 수 있는 지혜를 드리겠습니다.';

  @override
  String get chatSuggestion1 => '어떻게 하면 제 목적을 찾을 수 있을까요?';

  @override
  String get chatSuggestion2 => '어려운 결정을 해야 하는 상황입니다...';

  @override
  String get chatSuggestion3 => '어떻게 하면 두려움을 극복할 수 있을까요?';

  @override
  String get chatLoading => '깊이 생각하는 중...';

  @override
  String get chatViewFullAdvice => '전체 조언 보기';

  @override
  String get chatInputPlaceholder => '당신의 고민을 나누세요...';

  @override
  String get chatInputHint => '메시지를 입력하세요...';

  @override
  String get chatSend => '보내기';

  @override
  String get favoritesTitle => '저장된 조언';

  @override
  String get favoritesEmpty => '저장된 조언이 없습니다';

  @override
  String get favoritesEmptySubtitle => '북마크 아이콘을 눌러 지혜를 저장하세요';

  @override
  String get favoritesViewFull => '전체 보기';

  @override
  String get favoritesRemoveTitle => '저장됨에서 삭제';

  @override
  String get favoritesRemoveMessage => '이 조언을 저장된 항목에서 삭제하시겠습니까?';

  @override
  String get favoritesRemoved => '저장됨에서 삭제됨';

  @override
  String get remove => '삭제';

  @override
  String get historyDeleted => '기록에서 삭제됨';

  @override
  String get historyToday => '오늘';

  @override
  String get historyYesterday => '어제';

  @override
  String get historyDeleteTitle => '조언 삭제';

  @override
  String get historyDeleteMessage => '이 조언을 삭제하시겠습니까?';

  @override
  String get historyClearTitle => '기록 지우기';

  @override
  String get historyClearMessage => '모든 기록을 지우시겠습니까? 이 작업은 되돌릴 수 없습니다.';

  @override
  String get historyCleared => '기록이 지워졌습니다';

  @override
  String get clear => '지우기';

  @override
  String get navHome => '홈';

  @override
  String get navFavorites => '저장됨';

  @override
  String get appTitle => '별들의 목소리';

  @override
  String get homeWelcome => '오늘은 누구에게 지혜를 구하시겠어요?';

  @override
  String get homeSubtitle => '당신을 인도할 멘토를 선택하세요';

  @override
  String get languageTitle => '언어 선택';

  @override
  String get languageSelectPrompt => '원하는 언어를 선택하세요';

  @override
  String get languageSelectSubtitle => '설정에서 언제든지 변경할 수 있습니다';

  @override
  String get personaFeatured => '추천';

  @override
  String get personaSignatureQuote => '대표 명언';

  @override
  String get personaAbout => '소개';

  @override
  String get personaStartChat => '대화 시작';

  @override
  String get personaCategory => '카테고리';

  @override
  String get personaEra => '시대';

  @override
  String get personaExpertise => '지혜의 영역';

  @override
  String get personaAskQuestion => '질문하기';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsData => '데이터';

  @override
  String get settingsClearHistory => '기록 지우기';

  @override
  String get settingsClearHistorySubtitle => '저장된 모든 대화 삭제';

  @override
  String get settingsAboutApp => '별들의 목소리 소개';

  @override
  String get settingsAboutAppSubtitle => '버전 및 앱 정보';

  @override
  String get settingsPrivacyPolicy => '개인정보 처리방침';

  @override
  String get settingsPrivacyPolicySubtitle => '데이터 처리 방법';

  @override
  String get settingsTermsSubtitle => '이용약관 읽기';

  @override
  String get settingsAppDescription => '역사상 가장 위대한 지성들의 지혜를 얻으세요';

  @override
  String get settingsClearHistoryDialogTitle => '모든 기록을 지울까요?';

  @override
  String get settingsClearHistoryDialogMessage =>
      '모든 대화 기록이 영구적으로 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get settingsHistoryCleared => '기록이 성공적으로 지워졌습니다';

  @override
  String get settingsAboutContent =>
      '별들의 목소리는 AI 기반 대화를 통해 역사상 가장 위대한 철학자, 지도자, 사상가들의 지혜와 연결해 드립니다.';

  @override
  String get category_anime => '애니메이션';

  @override
  String get persona_luffy => '몽키 D. 루피';

  @override
  String get persona_luffy_title => '미래의 해적왕';

  @override
  String get persona_luffy_quote => '난 해적왕이 될 거야!';

  @override
  String get persona_gon_freecss => '곤 프릭스';

  @override
  String get persona_gon_freecss_title => '젊은 헌터';

  @override
  String get persona_gon_freecss_quote => '난 아빠를 찾을 거야!';

  @override
  String get persona_natsu_dragneel => '나츠 드래그닐';

  @override
  String get persona_natsu_dragneel_title => '불의 드래곤 슬레이어';

  @override
  String get persona_natsu_dragneel_quote => '나 엄청 불탄다!';

  @override
  String get persona_izuku_midoriya => '미도리야 이즈쿠';

  @override
  String get persona_izuku_midoriya_title => '원포올의 계승자';

  @override
  String get persona_izuku_midoriya_quote => '구해야 해! 그게 히어로잖아!';

  @override
  String get persona_son_goku => '손오공';

  @override
  String get persona_son_goku_title => '전설의 사이어인 전사';

  @override
  String get persona_son_goku_quote => '신난다!';

  @override
  String get persona_edward_elric => '에드워드 엘릭';

  @override
  String get persona_edward_elric_title => '강철의 연금술사';

  @override
  String get persona_edward_elric_quote => '등가교환 - 그게 연금술의 기본이야!';

  @override
  String get persona_eren_yeager => '엘런 예거';

  @override
  String get persona_eren_yeager_title => '진격의 거인';

  @override
  String get persona_eren_yeager_quote => '계속 나아갈 거야... 적을 모두 쓰러뜨릴 때까지.';

  @override
  String get persona_naruto_uzumaki => '우즈마키 나루토';

  @override
  String get persona_naruto_uzumaki_title => '7대 호카게';

  @override
  String get persona_naruto_uzumaki_quote =>
      '난 도망치지 않아. 내 말은 절대 번복하지 않아. 그게 내 닌자도야!';

  @override
  String get persona_tsunayoshi_sawada => '사와다 츠나요시';

  @override
  String get persona_tsunayoshi_sawada_title => '본고레 10대 보스';

  @override
  String get persona_tsunayoshi_sawada_quote => '죽기살기로 모두를 지킬 거야!';

  @override
  String get persona_tanjiro_kamado => '카마도 탄지로';

  @override
  String get persona_tanjiro_kamado_title => '귀살대 검사';

  @override
  String get persona_tanjiro_kamado_quote => '아무리 자신의 약함에 절망해도, 마음을 불태워라.';

  @override
  String get persona_ichigo_kurosaki => '쿠로사키 이치고';

  @override
  String get persona_ichigo_kurosaki_title => '대행 사신';

  @override
  String get persona_ichigo_kurosaki_quote =>
      '이기고 싶어서 싸우는 게 아니야. 이겨야 하니까 싸우는 거야!';

  @override
  String get persona_martin_luther_king => '마틴 루터 킹 주니어';

  @override
  String get persona_martin_luther_king_title => '민권운동 지도자';

  @override
  String get persona_martin_luther_king_quote =>
      '나에게는 꿈이 있습니다. 언젠가 나의 네 아이들이 피부색이 아닌 인격으로 평가받는 나라에서 살게 되는 꿈이.';

  @override
  String get persona_albert_einstein => '알버트 아인슈타인';

  @override
  String get persona_albert_einstein_title => '이론 물리학자';

  @override
  String get persona_albert_einstein_quote =>
      '상상력은 지식보다 중요하다. 지식은 한계가 있지만, 상상력은 세상을 감싼다.';

  @override
  String get persona_julius_caesar => '율리우스 카이사르';

  @override
  String get persona_julius_caesar_title => '로마의 독재관이자 정복자';

  @override
  String get persona_julius_caesar_quote => '왔노라, 보았노라, 이겼노라.';

  @override
  String get persona_david => '다윗 왕';

  @override
  String get persona_david_title => '시편 저자이자 이스라엘의 왕';

  @override
  String get persona_david_quote => '여호와는 나의 목자시니 내게 부족함이 없으리로다.';

  @override
  String get persona_aslan => '아슬란';

  @override
  String get persona_aslan_title => '나니아의 위대한 사자';

  @override
  String get persona_aslan_quote => '나는 길들여진 사자가 아니다.';

  @override
  String get persona_jean_valjean => '장발장';

  @override
  String get persona_jean_valjean_title => '레 미제라블의 구원받은 영혼';

  @override
  String get persona_jean_valjean_quote => '다른 사람을 사랑하는 것은 신의 얼굴을 보는 것이다.';

  @override
  String get persona_liu_bei => '유비';

  @override
  String get persona_liu_bei_title => '촉한의 건국 황제';

  @override
  String get persona_liu_bei_quote => '차라리 내가 천하를 저버릴지언정, 천하가 나를 저버리게 하지 않으리라.';

  @override
  String get persona_zhuge_liang => '제갈량';

  @override
  String get persona_zhuge_liang_title => '촉한의 승상';

  @override
  String get persona_zhuge_liang_quote => '고요하기는 산과 같고, 움직이면 바람과 번개 같으리.';

  @override
  String get persona_cao_cao => '조조';

  @override
  String get persona_cao_cao_title => '한나라의 승상이자 위나라의 건국자';

  @override
  String get persona_cao_cao_quote => '차라리 내가 천하를 저버릴지언정, 천하가 나를 저버리게 하지 않으리라.';
}
