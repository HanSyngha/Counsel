// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '위인의 목소리';

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
  String get personaTolstoy => '레프 톨스토이';

  @override
  String get personaTolstoyTitle => '러시아 문학의 거장';

  @override
  String get personaTolstoyQuote => '누구나 세상을 바꾸려 하지만, 자신을 바꾸려는 사람은 없다.';
}
