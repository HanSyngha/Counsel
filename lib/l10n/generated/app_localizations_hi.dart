// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'ज्ञानियों की आवाज़';

  @override
  String get onboardingTitle => 'इतिहास के गुरुओं से\nआज ही मिलें';

  @override
  String get onboardingSubtitle =>
      'ईसा मसीह, सुकरात, शिवाजी महाराज से लेकर स्टीव जॉब्स तक।\nआपकी समस्याओं के लिए युगों का ज्ञान उपलब्ध है।';

  @override
  String get getStarted => 'अभी शुरू करें';

  @override
  String get homeTitle => 'आज किससे सलाह लेना चाहेंगे?';

  @override
  String get searchPlaceholder => 'प्लेटो, लिंकन, हैमलेट खोजें...';

  @override
  String get featuredMentors => 'विशेष गुरु';

  @override
  String get exploreWisdom => 'ज्ञान की खोज करें';

  @override
  String get seeAll => 'सभी देखें';

  @override
  String get trending => 'लोकप्रिय';

  @override
  String get new_ => 'नया';

  @override
  String get categoryAll => 'सभी';

  @override
  String get categoryHistory => 'इतिहास';

  @override
  String get categoryPhilosophy => 'दर्शन';

  @override
  String get categoryReligion => 'धर्म';

  @override
  String get categoryLiterature => 'साहित्य';

  @override
  String get categoryFavorites => 'पसंदीदा';

  @override
  String get inputTitle => 'आपके मन में क्या चल रहा है?';

  @override
  String get inputSubtitle =>
      'खुलकर बताइए। जितना विस्तार से बताएंगे, उतना स्पष्ट उत्तर मिलेगा।';

  @override
  String get inputPlaceholder =>
      'मैं इस समस्या से जूझ रहा/रही हूं...\nयह इस तरह शुरू हुआ...\nमुझे इसका डर है...';

  @override
  String get inputHelperDilemma => 'वर्तमान समस्या';

  @override
  String get inputHelperEmotion => 'भावनात्मक स्थिति';

  @override
  String get inputHelperOutcome => 'अपेक्षित परिणाम';

  @override
  String get seekWisdom => 'ज्ञान प्राप्त करें';

  @override
  String get privacyNote =>
      'आपकी समस्या गोपनीय है और गुमनाम रूप से संसाधित की जाती है।';

  @override
  String characterCount(int count, int max) {
    return '$count / $max';
  }

  @override
  String get loadingConnecting => 'जुड़ रहा है';

  @override
  String get loadingConsulting => 'प्राचीन ज्ञान के भंडार की खोज हो रही है';

  @override
  String get loadingAnalyzing => 'प्रश्न का विश्लेषण हो रहा है';

  @override
  String get loadingRecalling => 'ऐतिहासिक संदर्भ याद किया जा रहा है...';

  @override
  String get loadingOnline => 'ऑनलाइन';

  @override
  String get cancelRequest => 'अनुरोध रद्द करें';

  @override
  String get loadingNote => 'गुरु को बुलाने में कुछ समय लग सकता है।';

  @override
  String get resultWisdom => 'ज्ञान';

  @override
  String get resultAiPersona => 'AI गुरु की सलाह';

  @override
  String get resultGeneratedBy => 'AI गुरु द्वारा निर्मित';

  @override
  String get resultScrollOfWisdom => 'ज्ञान का पत्र';

  @override
  String get resultHistoricalRecords => 'ऐतिहासिक अभिलेख';

  @override
  String get resultInHisOwnWords => 'उनके अपने शब्दों में';

  @override
  String get resultKeyDecision => 'मुख्य निर्णय';

  @override
  String get resultCopy => 'कॉपी करें';

  @override
  String get resultShare => 'साझा करें';

  @override
  String get askAnotherSage => 'किसी अन्य ज्ञानी से पूछें';

  @override
  String get resultActionSteps => 'कार्य योजना';

  @override
  String get historyTitle => 'मेरी सलाह का इतिहास';

  @override
  String get historySearch => 'कौन सी समस्या खोजें?';

  @override
  String get historyEmpty => 'अभी तक कोई सलाह का इतिहास नहीं है';

  @override
  String get historyEmptySubtitle => 'किसी गुरु से बातचीत शुरू करें';

  @override
  String get navSelect => 'चुनें';

  @override
  String get navChat => 'चैट';

  @override
  String get navSaved => 'सहेजा गया';

  @override
  String get navHistory => 'इतिहास';

  @override
  String get navProfile => 'प्रोफ़ाइल';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsAbout => 'ऐप के बारे में';

  @override
  String get settingsPrivacy => 'गोपनीयता नीति';

  @override
  String get settingsTerms => 'उपयोग की शर्तें';

  @override
  String get settingsVersion => 'संस्करण';

  @override
  String get errorGeneric => 'कुछ गड़बड़ हो गई। कृपया पुनः प्रयास करें।';

  @override
  String get errorNetwork => 'कृपया अपना इंटरनेट कनेक्शन जांचें।';

  @override
  String get errorTimeout =>
      'अनुरोध का समय समाप्त हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get ok => 'ठीक है';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get close => 'बंद करें';

  @override
  String get save => 'सहेजें';

  @override
  String get delete => 'हटाएं';

  @override
  String get confirm => 'पुष्टि करें';

  @override
  String get personaSocrates => 'सुकरात';

  @override
  String get personaSocratesTitle => 'पश्चिमी दर्शन के जनक';

  @override
  String get personaSocratesQuote => 'बिना जांचा जीवन जीने योग्य नहीं है।';

  @override
  String get personaPlato => 'प्लेटो';

  @override
  String get personaPlatoTitle => 'आदर्शों के दार्शनिक';

  @override
  String get personaPlatoQuote =>
      'दयालु बनो, क्योंकि हर व्यक्ति जिससे तुम मिलते हो वह एक कठिन लड़ाई लड़ रहा है।';

  @override
  String get personaAristotle => 'अरस्तू';

  @override
  String get personaAristotleTitle => 'प्रथम गुरु';

  @override
  String get personaAristotleQuote =>
      'हम वही हैं जो हम बार-बार करते हैं। उत्कृष्टता कोई कार्य नहीं, बल्कि आदत है।';

  @override
  String get personaSeneca => 'सेनेका';

  @override
  String get personaSenecaTitle => 'स्टोइक दार्शनिक';

  @override
  String get personaSenecaQuote =>
      'हमारे पास समय कम नहीं है, बल्कि हम बहुत समय बर्बाद करते हैं।';

  @override
  String get personaConfucius => 'कन्फ्यूशियस';

  @override
  String get personaConfuciusTitle => 'महान संत';

  @override
  String get personaConfuciusQuote =>
      'इससे कोई फर्क नहीं पड़ता कि तुम कितनी धीरे चलते हो, बस रुको मत।';

  @override
  String get personaLaozi => 'लाओ त्ज़ु';

  @override
  String get personaLaoziTitle => 'ताओवाद के संस्थापक';

  @override
  String get personaLaoziQuote => 'हजार मील की यात्रा एक कदम से शुरू होती है।';

  @override
  String get personaJesus => 'ईसा मसीह';

  @override
  String get personaJesusTitle => 'आध्यात्मिक गुरु';

  @override
  String get personaJesusQuote => 'अपने पड़ोसी से अपने समान प्रेम करो।';

  @override
  String get personaBuddha => 'गौतम बुद्ध';

  @override
  String get personaBuddhaTitle => 'प्रबुद्ध';

  @override
  String get personaBuddhaQuote => 'शांति भीतर से आती है। इसे बाहर मत खोजो।';

  @override
  String get personaMuhammad => 'पैगंबर मुहम्मद';

  @override
  String get personaMuhammadTitle => 'इस्लाम के पैगंबर';

  @override
  String get personaMuhammadQuote =>
      'सर्वश्रेष्ठ व्यक्ति वह है जिसका आचरण सबसे अच्छा हो।';

  @override
  String get personaLincoln => 'अब्राहम लिंकन';

  @override
  String get personaLincolnTitle => 'अमेरिका के 16वें राष्ट्रपति';

  @override
  String get personaLincolnQuote =>
      'अंत में महत्वपूर्ण यह नहीं कि जीवन में कितने वर्ष थे, बल्कि उन वर्षों में कितना जीवन था।';

  @override
  String get personaNapoleon => 'नेपोलियन';

  @override
  String get personaNapoleonTitle => 'फ्रांस के सम्राट';

  @override
  String get personaNapoleonQuote =>
      'असंभव शब्द केवल मूर्खों के शब्दकोश में होता है।';

  @override
  String get personaSteveJobs => 'स्टीव जॉब्स';

  @override
  String get personaSteveJobsTitle => 'दूरदर्शी उद्यमी';

  @override
  String get personaSteveJobsQuote => 'भूखे रहो। मूर्ख बने रहो।';

  @override
  String get personaSherlockHolmes => 'शर्लक होम्स';

  @override
  String get personaSherlockHolmesTitle => 'तर्क के स्वामी';

  @override
  String get personaSherlockHolmesQuote =>
      'जब तुम असंभव को हटा दो, तो जो बचे, चाहे कितना भी अविश्वसनीय हो, वही सत्य है।';

  @override
  String get personaDumbledore => 'एल्बस डंबलडोर';

  @override
  String get personaDumbledoreTitle => 'हॉगवर्ट्स के प्रधानाचार्य';

  @override
  String get personaDumbledoreQuote =>
      'सबसे अंधेरे समय में भी खुशी मिल सकती है, बस याद रखो कि दीपक जलाना है।';

  @override
  String get personaGandhi => 'महात्मा गांधी';

  @override
  String get personaGandhiTitle => 'भारत के राष्ट्रपिता';

  @override
  String get personaGandhiQuote =>
      'वह बदलाव बनो जो तुम दुनिया में देखना चाहते हो।';

  @override
  String get personaRumi => 'रूमी';

  @override
  String get personaRumiTitle => 'सूफी कवि और रहस्यवादी';

  @override
  String get personaRumiQuote =>
      'घाव वह जगह है जहां से प्रकाश तुम्हारे भीतर प्रवेश करता है।';

  @override
  String get personaKrishna => 'श्री कृष्ण';

  @override
  String get personaKrishnaTitle => 'भगवद्गीता के दिव्य मार्गदर्शक';

  @override
  String get personaKrishnaQuote =>
      'कर्म करने का अधिकार है, फल की चिंता मत करो।';

  @override
  String get personaBrahma => 'ब्रह्मा';

  @override
  String get personaBrahmaTitle => 'सृष्टि के देवता';

  @override
  String get personaBrahmaQuote =>
      'असत्य से सत्य की ओर, अंधकार से प्रकाश की ओर ले चलो।';

  @override
  String get personaVishnu => 'विष्णु';

  @override
  String get personaVishnuTitle => 'पालनकर्ता देव';

  @override
  String get personaVishnuQuote =>
      'जब भी धर्म का पतन होता है, मैं धर्मियों की रक्षा के लिए प्रकट होता हूं।';

  @override
  String get personaTolstoy => 'लियो टॉल्स्टॉय';

  @override
  String get personaTolstoyTitle => 'रूसी साहित्य के महान लेखक';

  @override
  String get personaTolstoyQuote =>
      'हर कोई दुनिया बदलना चाहता है, लेकिन कोई खुद को बदलना नहीं चाहता।';

  @override
  String get adviceYourQuestion => 'आपका प्रश्न';

  @override
  String get adviceCitation => 'उद्धरण';

  @override
  String get adviceRelevance => 'यह महत्वपूर्ण क्यों है';

  @override
  String get adviceSourceType => 'स्रोत का प्रकार';

  @override
  String get adviceSourceName => 'स्रोत';

  @override
  String get adviceSourceLocation => 'स्थान';

  @override
  String get adviceSourceYear => 'वर्ष';

  @override
  String get adviceSourceContext => 'संदर्भ';

  @override
  String get adviceMainCounsel => 'मुख्य सलाह';

  @override
  String get adviceActionSteps => 'कार्य योजना';

  @override
  String get adviceClosingWords => 'समापन वचन';

  @override
  String get adviceCopy => 'कॉपी करें';

  @override
  String get adviceShare => 'साझा करें';

  @override
  String get adviceAddedToFavorites => 'पसंदीदा में जोड़ा गया';

  @override
  String get adviceRemovedFromFavorites => 'पसंदीदा से हटाया गया';

  @override
  String get adviceCopied => 'क्लिपबोर्ड में कॉपी किया गया';

  @override
  String get adviceShareError =>
      'साझा नहीं किया जा सका। कृपया पुनः प्रयास करें।';

  @override
  String get sourceTypeScripture => 'धर्मग्रंथ';

  @override
  String get sourceTypeBook => 'पुस्तक';

  @override
  String get sourceTypeSpeech => 'भाषण';

  @override
  String get sourceTypeBattle => 'युद्ध';

  @override
  String get sourceTypeLetter => 'पत्र';

  @override
  String get sourceTypeDialogue => 'संवाद';

  @override
  String get sourceTypeMoment => 'क्षण';

  @override
  String get sourceTypeTeaching => 'शिक्षा';

  @override
  String get sourceTypeNovel => 'उपन्यास';

  @override
  String get chatSuggestionsTitle => 'सुझाए गए विषय';

  @override
  String get chatIntroMessage =>
      'अपने मन की बात साझा करें, मैं अपना ज्ञान आपको दूंगा।';

  @override
  String get chatSuggestion1 => 'मैं अपने जीवन का उद्देश्य कैसे खोजूं?';

  @override
  String get chatSuggestion2 => 'मुझे एक कठिन निर्णय लेना है...';

  @override
  String get chatSuggestion3 => 'मैं अपने डर को कैसे जीतूं?';

  @override
  String get chatLoading => 'गहन चिंतन में...';

  @override
  String get chatViewFullAdvice => 'पूरी सलाह देखें';

  @override
  String get chatInputPlaceholder => 'अपनी समस्या साझा करें...';

  @override
  String get chatInputHint => 'संदेश लिखें...';

  @override
  String get chatSend => 'भेजें';

  @override
  String get favoritesTitle => 'सहेजी गई सलाह';

  @override
  String get favoritesEmpty => 'कोई सहेजी गई सलाह नहीं है';

  @override
  String get favoritesEmptySubtitle =>
      'ज्ञान को सहेजने के लिए बुकमार्क आइकन दबाएं';

  @override
  String get favoritesViewFull => 'पूरा देखें';

  @override
  String get favoritesRemoveTitle => 'सहेजे गए से हटाएं';

  @override
  String get favoritesRemoveMessage =>
      'क्या आप इस सलाह को सहेजे गए से हटाना चाहते हैं?';

  @override
  String get favoritesRemoved => 'सहेजे गए से हटाया गया';

  @override
  String get remove => 'हटाएं';

  @override
  String get historyDeleted => 'इतिहास से हटाया गया';

  @override
  String get historyToday => 'आज';

  @override
  String get historyYesterday => 'कल';

  @override
  String get historyDeleteTitle => 'सलाह हटाएं';

  @override
  String get historyDeleteMessage => 'क्या आप इस सलाह को हटाना चाहते हैं?';

  @override
  String get historyClearTitle => 'इतिहास मिटाएं';

  @override
  String get historyClearMessage =>
      'क्या आप सारा इतिहास मिटाना चाहते हैं? यह क्रिया पूर्ववत नहीं की जा सकती।';

  @override
  String get historyCleared => 'इतिहास मिटा दिया गया';

  @override
  String get clear => 'मिटाएं';

  @override
  String get navHome => 'होम';

  @override
  String get navFavorites => 'सहेजा गया';

  @override
  String get appTitle => 'ज्ञानियों की आवाज़';

  @override
  String get homeWelcome => 'आज किससे ज्ञान प्राप्त करना चाहेंगे?';

  @override
  String get homeSubtitle => 'अपना मार्गदर्शक चुनें';

  @override
  String get languageTitle => 'भाषा चुनें';

  @override
  String get languageSelectPrompt => 'अपनी पसंदीदा भाषा चुनें';

  @override
  String get languageSelectSubtitle =>
      'आप इसे सेटिंग्स में कभी भी बदल सकते हैं';

  @override
  String get personaFeatured => 'विशेष';

  @override
  String get personaSignatureQuote => 'प्रसिद्ध उक्ति';

  @override
  String get personaAbout => 'परिचय';

  @override
  String get personaStartChat => 'बातचीत शुरू करें';

  @override
  String get personaCategory => 'श्रेणी';

  @override
  String get personaEra => 'युग';

  @override
  String get personaExpertise => 'ज्ञान का क्षेत्र';

  @override
  String get personaAskQuestion => 'प्रश्न पूछें';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsData => 'डेटा';

  @override
  String get settingsClearHistory => 'इतिहास मिटाएं';

  @override
  String get settingsClearHistorySubtitle => 'सभी सहेजी गई बातचीत हटाएं';

  @override
  String get settingsAboutApp => 'ज्ञानियों की आवाज़ के बारे में';

  @override
  String get settingsAboutAppSubtitle => 'संस्करण और ऐप जानकारी';

  @override
  String get settingsPrivacyPolicy => 'गोपनीयता नीति';

  @override
  String get settingsPrivacyPolicySubtitle => 'डेटा कैसे संसाधित होता है';

  @override
  String get settingsTermsSubtitle => 'उपयोग की शर्तें पढ़ें';

  @override
  String get settingsAppDescription =>
      'इतिहास की महानतम बुद्धियों का ज्ञान प्राप्त करें';

  @override
  String get settingsClearHistoryDialogTitle => 'क्या सारा इतिहास मिटाना है?';

  @override
  String get settingsClearHistoryDialogMessage =>
      'सभी बातचीत का इतिहास स्थायी रूप से हटा दिया जाएगा। यह क्रिया पूर्ववत नहीं की जा सकती।';

  @override
  String get settingsHistoryCleared => 'इतिहास सफलतापूर्वक मिटा दिया गया';

  @override
  String get settingsAboutContent =>
      'ज्ञानियों की आवाज़ AI-संचालित संवाद के माध्यम से इतिहास के महानतम दार्शनिकों, नेताओं और विचारकों के ज्ञान से आपको जोड़ता है।';
}
