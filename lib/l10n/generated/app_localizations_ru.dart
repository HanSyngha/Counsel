// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Голос Мудрецов';

  @override
  String get onboardingTitle => 'Встретьте Своих\nНаставников Из Истории';

  @override
  String get onboardingSubtitle =>
      'От Иисуса до Сократа, от Наполеона до Стива Джобса.\nОдолжите вечную мудрость для ваших забот.';

  @override
  String get getStarted => 'Начать';

  @override
  String get homeTitle => 'У кого вы хотите попросить совета сегодня?';

  @override
  String get searchPlaceholder => 'Искать Платона, Линкольна, Гамлета...';

  @override
  String get featuredMentors => 'Рекомендуемые Наставники';

  @override
  String get exploreWisdom => 'Исследовать Мудрость';

  @override
  String get seeAll => 'Смотреть все';

  @override
  String get trending => 'В тренде';

  @override
  String get new_ => 'Новое';

  @override
  String get categoryAll => 'Все';

  @override
  String get categoryHistory => 'История';

  @override
  String get categoryPhilosophy => 'Философия';

  @override
  String get categoryReligion => 'Религия';

  @override
  String get categoryLiterature => 'Литература';

  @override
  String get categoryFavorites => 'Избранное';

  @override
  String get inputTitle => 'Что тяготит ваш разум?';

  @override
  String get inputSubtitle => 'Будьте честны. Детали — путь к ясности.';

  @override
  String get inputPlaceholder =>
      'Я борюсь с...\nЭто началось когда...\nЯ боюсь, что...';

  @override
  String get inputHelperDilemma => 'Текущая Дилемма';

  @override
  String get inputHelperEmotion => 'Эмоциональное Состояние';

  @override
  String get inputHelperOutcome => 'Желаемый Результат';

  @override
  String get seekWisdom => 'Искать Мудрость';

  @override
  String get privacyNote => 'Ваше признание конфиденциально и анонимно.';

  @override
  String characterCount(int count, int max) {
    return '$count / $max';
  }

  @override
  String get loadingConnecting => 'Подключение к';

  @override
  String get loadingConsulting => 'Обращение к древним архивам мудрости';

  @override
  String get loadingAnalyzing => 'Анализ Запроса';

  @override
  String get loadingRecalling => 'ВСПОМИНАЕМ ИСТОРИЧЕСКИЙ КОНТЕКСТ...';

  @override
  String get loadingOnline => 'Онлайн';

  @override
  String get cancelRequest => 'Отменить Запрос';

  @override
  String get loadingNote =>
      'Это может занять некоторое время, пока мы связываемся с персоной.';

  @override
  String get resultWisdom => 'Мудрость';

  @override
  String get resultAiPersona => 'Совет AI Персоны';

  @override
  String get resultGeneratedBy => 'Создано AI Персоной';

  @override
  String get resultScrollOfWisdom => 'Свиток Мудрости';

  @override
  String get resultHistoricalRecords => 'Исторические Записи';

  @override
  String get resultInHisOwnWords => 'Его Собственными Словами';

  @override
  String get resultKeyDecision => 'Ключевое Решение';

  @override
  String get resultCopy => 'Копировать';

  @override
  String get resultShare => 'Поделиться';

  @override
  String get askAnotherSage => 'Спросить Другого Мудреца';

  @override
  String get resultActionSteps => 'Шаги К Действию';

  @override
  String get historyTitle => 'История Моих Советов';

  @override
  String get historySearch => 'Какую проблему вы ищете?';

  @override
  String get historyEmpty => 'История советов пуста';

  @override
  String get historyEmptySubtitle => 'Начните разговор с наставником';

  @override
  String get navSelect => 'Выбрать';

  @override
  String get navChat => 'Чат';

  @override
  String get navSaved => 'Сохранённое';

  @override
  String get navHistory => 'История';

  @override
  String get navProfile => 'Профиль';

  @override
  String get navSettings => 'Настройки';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsAbout => 'О приложении';

  @override
  String get settingsPrivacy => 'Политика Конфиденциальности';

  @override
  String get settingsTerms => 'Условия Использования';

  @override
  String get settingsVersion => 'Версия';

  @override
  String get errorGeneric =>
      'Что-то пошло не так. Пожалуйста, попробуйте снова.';

  @override
  String get errorNetwork => 'Пожалуйста, проверьте подключение к интернету.';

  @override
  String get errorTimeout =>
      'Время запроса истекло. Пожалуйста, попробуйте снова.';

  @override
  String get retry => 'Повторить';

  @override
  String get ok => 'ОК';

  @override
  String get cancel => 'Отмена';

  @override
  String get close => 'Закрыть';

  @override
  String get save => 'Сохранить';

  @override
  String get delete => 'Удалить';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get personaSocrates => 'Сократ';

  @override
  String get personaSocratesTitle => 'Отец Западной Философии';

  @override
  String get personaSocratesQuote =>
      'Неисследованная жизнь не стоит того, чтобы жить.';

  @override
  String get personaPlato => 'Платон';

  @override
  String get personaPlatoTitle => 'Философ Идей';

  @override
  String get personaPlatoQuote =>
      'Будьте добры, ибо каждый, кого вы встречаете, ведёт тяжёлую битву.';

  @override
  String get personaAristotle => 'Аристотель';

  @override
  String get personaAristotleTitle => 'Первый Учитель';

  @override
  String get personaAristotleQuote =>
      'Мы — то, что мы делаем постоянно. Совершенство — не действие, а привычка.';

  @override
  String get personaSeneca => 'Сенека';

  @override
  String get personaSenecaTitle => 'Философ-Стоик';

  @override
  String get personaSenecaQuote =>
      'Дело не в том, что у нас мало времени, а в том, что мы много теряем.';

  @override
  String get personaConfucius => 'Конфуций';

  @override
  String get personaConfuciusTitle => 'Великий Мудрец';

  @override
  String get personaConfuciusQuote =>
      'Неважно, как медленно ты идёшь, главное — не останавливайся.';

  @override
  String get personaLaozi => 'Лао-цзы';

  @override
  String get personaLaoziTitle => 'Основатель Даосизма';

  @override
  String get personaLaoziQuote => 'Путь в тысячу ли начинается с одного шага.';

  @override
  String get personaJesus => 'Иисус';

  @override
  String get personaJesusTitle => 'Духовный Учитель';

  @override
  String get personaJesusQuote => 'Возлюби ближнего своего, как самого себя.';

  @override
  String get personaBuddha => 'Будда';

  @override
  String get personaBuddhaTitle => 'Просветлённый';

  @override
  String get personaBuddhaQuote => 'Мир приходит изнутри. Не ищи его снаружи.';

  @override
  String get personaMuhammad => 'Мухаммад';

  @override
  String get personaMuhammadTitle => 'Пророк Ислама';

  @override
  String get personaMuhammadQuote =>
      'Лучшие из вас — те, у кого лучший характер.';

  @override
  String get personaLincoln => 'Авраам Линкольн';

  @override
  String get personaLincolnTitle => '16-й Президент США';

  @override
  String get personaLincolnQuote =>
      'В конце концов, важны не годы в вашей жизни, а жизнь в ваших годах.';

  @override
  String get personaNapoleon => 'Наполеон';

  @override
  String get personaNapoleonTitle => 'Император Франции';

  @override
  String get personaNapoleonQuote => 'Невозможно — слово из словаря глупцов.';

  @override
  String get personaSteveJobs => 'Стив Джобс';

  @override
  String get personaSteveJobsTitle => 'Визионер-Предприниматель';

  @override
  String get personaSteveJobsQuote =>
      'Оставайся голодным. Оставайся безрассудным.';

  @override
  String get personaSherlockHolmes => 'Шерлок Холмс';

  @override
  String get personaSherlockHolmesTitle => 'Мастер Дедукции';

  @override
  String get personaSherlockHolmesQuote =>
      'Когда вы исключили невозможное, то, что осталось, должно быть правдой.';

  @override
  String get personaDumbledore => 'Альбус Дамблдор';

  @override
  String get personaDumbledoreTitle => 'Директор Хогвартса';

  @override
  String get personaDumbledoreQuote =>
      'Счастье можно найти даже в самые тёмные времена, если не забывать зажигать свет.';

  @override
  String get personaGandhi => 'Махатма Ганди';

  @override
  String get personaGandhiTitle => 'Отец Индийской Нации';

  @override
  String get personaGandhiQuote =>
      'Будь тем изменением, которое ты хочешь увидеть в мире.';

  @override
  String get personaRumi => 'Руми';

  @override
  String get personaRumiTitle => 'Суфийский Поэт и Мистик';

  @override
  String get personaRumiQuote =>
      'Рана — это место, через которое в тебя входит Свет.';

  @override
  String get personaKrishna => 'Кришна';

  @override
  String get personaKrishnaTitle => 'Божественный Наставник Бхагавад-гиты';

  @override
  String get personaKrishnaQuote =>
      'Ты имеешь право на действие, но никогда — на его плоды.';

  @override
  String get personaBrahma => 'Брахма';

  @override
  String get personaBrahmaTitle => 'Бог-Творец';

  @override
  String get personaBrahmaQuote =>
      'От нереального веди меня к реальному, от тьмы веди меня к свету.';

  @override
  String get personaTolstoy => 'Лев Толстой';

  @override
  String get personaTolstoyTitle => 'Гигант Русской Литературы';

  @override
  String get personaTolstoyQuote =>
      'Все думают о том, как изменить мир, но никто не думает о том, как изменить себя.';

  @override
  String get adviceYourQuestion => 'Your Question';

  @override
  String get adviceCitation => 'Citation';

  @override
  String get adviceRelevance => 'Why This Matters';

  @override
  String get adviceSourceType => 'Source Type';

  @override
  String get adviceSourceName => 'Source';

  @override
  String get adviceSourceLocation => 'Location';

  @override
  String get adviceSourceYear => 'Year';

  @override
  String get adviceSourceContext => 'Context';

  @override
  String get adviceMainCounsel => 'Counsel';

  @override
  String get adviceActionSteps => 'Action Steps';

  @override
  String get adviceClosingWords => 'Closing Words';

  @override
  String get adviceCopy => 'Copy';

  @override
  String get adviceShare => 'Share';

  @override
  String get adviceAddedToFavorites => 'Added to favorites';

  @override
  String get adviceRemovedFromFavorites => 'Removed from favorites';

  @override
  String get adviceCopied => 'Copied to clipboard';

  @override
  String get sourceTypeScripture => 'Scripture';

  @override
  String get sourceTypeBook => 'Book';

  @override
  String get sourceTypeSpeech => 'Speech';

  @override
  String get sourceTypeBattle => 'Battle';

  @override
  String get sourceTypeLetter => 'Letter';

  @override
  String get sourceTypeDialogue => 'Dialogue';

  @override
  String get sourceTypeMoment => 'Moment';

  @override
  String get sourceTypeTeaching => 'Teaching';

  @override
  String get sourceTypeNovel => 'Novel';

  @override
  String get chatSuggestionsTitle => 'Suggested Topics';

  @override
  String get chatIntroMessage =>
      'Share what weighs on your heart, and I shall offer what wisdom I can.';

  @override
  String get chatSuggestion1 => 'How do I find my purpose?';

  @override
  String get chatSuggestion2 => 'I\'m struggling with a difficult decision...';

  @override
  String get chatSuggestion3 => 'How do I overcome my fears?';

  @override
  String get chatLoading => 'Contemplating...';

  @override
  String get chatViewFullAdvice => 'View Full Advice';

  @override
  String get chatInputPlaceholder => 'Share your concern...';

  @override
  String get chatInputHint => 'Type your message here...';

  @override
  String get chatSend => 'Send';

  @override
  String get favoritesTitle => 'Saved Advice';

  @override
  String get favoritesEmpty => 'No saved advice yet';

  @override
  String get favoritesEmptySubtitle => 'Tap the bookmark icon to save wisdom';

  @override
  String get favoritesViewFull => 'View Full';

  @override
  String get favoritesRemoveTitle => 'Remove from Saved';

  @override
  String get favoritesRemoveMessage =>
      'Are you sure you want to remove this advice from your saved items?';

  @override
  String get favoritesRemoved => 'Removed from saved';

  @override
  String get remove => 'Remove';

  @override
  String get historyDeleted => 'Deleted from history';

  @override
  String get historyToday => 'Today';

  @override
  String get historyYesterday => 'Yesterday';

  @override
  String get historyDeleteTitle => 'Delete Advice';

  @override
  String get historyDeleteMessage =>
      'Are you sure you want to delete this advice?';

  @override
  String get historyClearTitle => 'Clear History';

  @override
  String get historyClearMessage =>
      'Are you sure you want to clear all history? This cannot be undone.';

  @override
  String get historyCleared => 'History cleared';

  @override
  String get clear => 'Clear';

  @override
  String get navHome => 'Home';

  @override
  String get navFavorites => 'Saved';

  @override
  String get appTitle => 'Counsel';

  @override
  String get homeWelcome => 'Who do you seek wisdom from today?';

  @override
  String get homeSubtitle => 'Choose a mentor to guide you';

  @override
  String get languageTitle => 'Select Language';

  @override
  String get languageSelectPrompt => 'Choose your preferred language';

  @override
  String get languageSelectSubtitle =>
      'You can change this anytime in settings';

  @override
  String get personaFeatured => 'Featured';

  @override
  String get personaSignatureQuote => 'Signature Quote';

  @override
  String get personaAbout => 'About';

  @override
  String get personaStartChat => 'Start Conversation';

  @override
  String get personaCategory => 'Category';

  @override
  String get personaEra => 'Era';

  @override
  String get personaExpertise => 'Areas of Wisdom';

  @override
  String get personaAskQuestion => 'Ask a Question';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsClearHistory => 'Clear History';

  @override
  String get settingsClearHistorySubtitle => 'Remove all saved conversations';

  @override
  String get settingsAboutApp => 'About Counsel';

  @override
  String get settingsAboutAppSubtitle => 'Version and app information';

  @override
  String get settingsPrivacyPolicy => 'Privacy Policy';

  @override
  String get settingsPrivacyPolicySubtitle => 'How we handle your data';

  @override
  String get settingsTermsSubtitle => 'Read our terms of service';

  @override
  String get settingsAppDescription =>
      'Get wisdom from history\'s greatest minds';

  @override
  String get settingsClearHistoryDialogTitle => 'Clear All History?';

  @override
  String get settingsClearHistoryDialogMessage =>
      'This will permanently delete all your conversation history. This action cannot be undone.';

  @override
  String get settingsHistoryCleared => 'History cleared successfully';

  @override
  String get settingsAboutContent =>
      'Counsel connects you with the wisdom of history\'s greatest philosophers, leaders, and thinkers through AI-powered conversations.';
}
