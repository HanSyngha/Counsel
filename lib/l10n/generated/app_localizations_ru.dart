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
  String get onboardingTitle => 'Встретьте наставников\nиз глубины веков';

  @override
  String get onboardingSubtitle =>
      'От Иисуса, Сократа и адмирала Ли Сунсина до Стива Джобса.\nМы предложим вам мудрость, преодолевающую время, для ваших жизненных вопросов.';

  @override
  String get getStarted => 'Начать';

  @override
  String get homeTitle => 'У кого вы хотите спросить совета сегодня?';

  @override
  String get searchPlaceholder => 'Поиск: Платон, Линкольн, Гамлет...';

  @override
  String get featuredMentors => 'Рекомендуемые наставники';

  @override
  String get exploreWisdom => 'Исследовать мудрость';

  @override
  String get seeAll => 'Смотреть все';

  @override
  String get trending => 'Популярное';

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
  String get inputTitle => 'Что вас беспокоит?';

  @override
  String get inputSubtitle =>
      'Говорите откровенно. Чем конкретнее вопрос, тем точнее будет ответ.';

  @override
  String get inputPlaceholder =>
      'Я столкнулся с такой проблемой...\nВсё началось с того, что...\nЯ боюсь, что...';

  @override
  String get inputHelperDilemma => 'Текущая проблема';

  @override
  String get inputHelperEmotion => 'Эмоциональное состояние';

  @override
  String get inputHelperOutcome => 'Желаемый результат';

  @override
  String get seekWisdom => 'Получить мудрость';

  @override
  String get privacyNote => 'Ваши вопросы конфиденциальны и анонимны.';

  @override
  String characterCount(int count, int max) {
    return '$count / $max';
  }

  @override
  String get loadingConnecting => 'Подключение';

  @override
  String get loadingConsulting => 'Изучаем древние хранилища мудрости';

  @override
  String get loadingAnalyzing => 'Анализируем ваш вопрос';

  @override
  String get loadingRecalling => 'Погружаемся в исторический контекст...';

  @override
  String get loadingOnline => 'Онлайн';

  @override
  String get cancelRequest => 'Отменить запрос';

  @override
  String get loadingNote => 'Загрузка персоны может занять некоторое время.';

  @override
  String get resultWisdom => 'Мудрость';

  @override
  String get resultAiPersona => 'Совет AI-персоны';

  @override
  String get resultGeneratedBy => 'Создано AI-персоной';

  @override
  String get resultScrollOfWisdom => 'Свиток мудрости';

  @override
  String get resultHistoricalRecords => 'Исторические записи';

  @override
  String get resultInHisOwnWords => 'Его собственными словами';

  @override
  String get resultKeyDecision => 'Ключевое решение';

  @override
  String get resultCopy => 'Копировать';

  @override
  String get resultShare => 'Поделиться';

  @override
  String get askAnotherSage => 'Спросить другого мудреца';

  @override
  String get resultActionSteps => 'Практические шаги';

  @override
  String get historyTitle => 'Мои консультации';

  @override
  String get historySearch => 'Какой вопрос вы ищете?';

  @override
  String get historyEmpty => 'История консультаций пуста';

  @override
  String get historyEmptySubtitle => 'Начните диалог с наставником';

  @override
  String get navSelect => 'Выбор';

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
  String get settingsPrivacy => 'Политика конфиденциальности';

  @override
  String get settingsTerms => 'Условия использования';

  @override
  String get settingsVersion => 'Версия';

  @override
  String get errorGeneric =>
      'Что-то пошло не так. Пожалуйста, попробуйте ещё раз.';

  @override
  String get errorNetwork => 'Проверьте подключение к интернету.';

  @override
  String get errorTimeout =>
      'Время ожидания истекло. Пожалуйста, попробуйте ещё раз.';

  @override
  String get retry => 'Повторить';

  @override
  String get ok => 'OK';

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
  String get personaSocratesTitle => 'Отец западной философии';

  @override
  String get personaSocratesQuote =>
      'Непознанная жизнь не стоит того, чтобы быть прожитой.';

  @override
  String get personaPlato => 'Платон';

  @override
  String get personaPlatoTitle => 'Философ идей';

  @override
  String get personaPlatoQuote =>
      'Будьте добры, ведь каждый, кого вы встречаете, ведёт свою нелёгкую борьбу.';

  @override
  String get personaAristotle => 'Аристотель';

  @override
  String get personaAristotleTitle => 'Первый учитель';

  @override
  String get personaAristotleQuote =>
      'Мы есть то, что мы делаем постоянно. Совершенство — это не действие, а привычка.';

  @override
  String get personaSeneca => 'Сенека';

  @override
  String get personaSenecaTitle => 'Философ-стоик';

  @override
  String get personaSenecaQuote =>
      'Дело не в том, что нам мало времени, а в том, что мы много его теряем.';

  @override
  String get personaConfucius => 'Конфуций';

  @override
  String get personaConfuciusTitle => 'Великий мудрец';

  @override
  String get personaConfuciusQuote =>
      'Неважно, как медленно ты идёшь, главное — не останавливайся.';

  @override
  String get personaLaozi => 'Лао-цзы';

  @override
  String get personaLaoziTitle => 'Основатель даосизма';

  @override
  String get personaLaoziQuote => 'Путь в тысячу ли начинается с одного шага.';

  @override
  String get personaJesus => 'Иисус';

  @override
  String get personaJesusTitle => 'Духовный учитель';

  @override
  String get personaJesusQuote => 'Возлюби ближнего твоего, как самого себя.';

  @override
  String get personaBuddha => 'Будда';

  @override
  String get personaBuddhaTitle => 'Просветлённый';

  @override
  String get personaBuddhaQuote =>
      'Покой приходит изнутри. Не ищи его снаружи.';

  @override
  String get personaMuhammad => 'Мухаммед';

  @override
  String get personaMuhammadTitle => 'Пророк ислама';

  @override
  String get personaMuhammadQuote =>
      'Лучший из людей тот, кто обладает лучшим нравом.';

  @override
  String get personaLincoln => 'Авраам Линкольн';

  @override
  String get personaLincolnTitle => '16-й президент США';

  @override
  String get personaLincolnQuote =>
      'В конце концов важны не годы жизни, а жизнь в этих годах.';

  @override
  String get personaNapoleon => 'Наполеон';

  @override
  String get personaNapoleonTitle => 'Император Франции';

  @override
  String get personaNapoleonQuote => 'Невозможно — слово из словаря глупцов.';

  @override
  String get personaSteveJobs => 'Стив Джобс';

  @override
  String get personaSteveJobsTitle => 'Предприниматель-визионер';

  @override
  String get personaSteveJobsQuote =>
      'Оставайтесь голодными. Оставайтесь безрассудными.';

  @override
  String get personaSherlockHolmes => 'Шерлок Холмс';

  @override
  String get personaSherlockHolmesTitle => 'Мастер дедукции';

  @override
  String get personaSherlockHolmesQuote =>
      'Когда вы исключите невозможное, то, что останется, каким бы невероятным оно ни было, и есть истина.';

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
  String get personaGandhiTitle => 'Отец нации Индии';

  @override
  String get personaGandhiQuote =>
      'Будь тем изменением, которое хочешь видеть в мире.';

  @override
  String get personaRumi => 'Руми';

  @override
  String get personaRumiTitle => 'Суфийский поэт и мистик';

  @override
  String get personaRumiQuote =>
      'Рана — это место, через которое в тебя входит свет.';

  @override
  String get personaKrishna => 'Кришна';

  @override
  String get personaKrishnaTitle => 'Божественный наставник Бхагавад-гиты';

  @override
  String get personaKrishnaQuote =>
      'Ты имеешь право на действие, но не на его плоды.';

  @override
  String get personaBrahma => 'Брахма';

  @override
  String get personaBrahmaTitle => 'Бог-творец';

  @override
  String get personaBrahmaQuote =>
      'Веди нас от иллюзии к истине, от тьмы к свету.';

  @override
  String get personaVishnu => 'Вишну';

  @override
  String get personaVishnuTitle => 'Бог-Хранитель';

  @override
  String get personaVishnuQuote =>
      'Когда дхарма приходит в упадок, я являюсь, чтобы защитить праведных.';

  @override
  String get personaTolstoy => 'Лев Толстой';

  @override
  String get personaTolstoyTitle => 'Великий русский писатель';

  @override
  String get personaTolstoyQuote =>
      'Каждый мечтает изменить мир, но никто не думает о том, как изменить себя.';

  @override
  String get adviceYourQuestion => 'Ваш вопрос';

  @override
  String get adviceCitation => 'Цитата';

  @override
  String get adviceRelevance => 'Почему это важно';

  @override
  String get adviceSourceType => 'Тип источника';

  @override
  String get adviceSourceName => 'Источник';

  @override
  String get adviceSourceLocation => 'Расположение';

  @override
  String get adviceSourceYear => 'Год';

  @override
  String get adviceSourceContext => 'Контекст';

  @override
  String get adviceMainCounsel => 'Совет';

  @override
  String get adviceActionSteps => 'Практические шаги';

  @override
  String get adviceClosingWords => 'Заключительные слова';

  @override
  String get adviceCopy => 'Копировать';

  @override
  String get adviceShare => 'Поделиться';

  @override
  String get adviceAddedToFavorites => 'Добавлено в избранное';

  @override
  String get adviceRemovedFromFavorites => 'Удалено из избранного';

  @override
  String get adviceCopied => 'Скопировано в буфер обмена';

  @override
  String get adviceShareError =>
      'Не удалось поделиться. Пожалуйста, попробуйте еще раз.';

  @override
  String get sourceTypeScripture => 'Священное писание';

  @override
  String get sourceTypeBook => 'Книга';

  @override
  String get sourceTypeSpeech => 'Речь';

  @override
  String get sourceTypeBattle => 'Сражение';

  @override
  String get sourceTypeLetter => 'Письмо';

  @override
  String get sourceTypeDialogue => 'Диалог';

  @override
  String get sourceTypeMoment => 'Момент';

  @override
  String get sourceTypeTeaching => 'Учение';

  @override
  String get sourceTypeNovel => 'Роман';

  @override
  String get chatSuggestionsTitle => 'Рекомендуемые темы';

  @override
  String get chatIntroMessage =>
      'Поделитесь тем, что у вас на душе, и я поделюсь с вами своей мудростью.';

  @override
  String get chatSuggestion1 => 'Как мне найти своё предназначение?';

  @override
  String get chatSuggestion2 => 'Мне нужно принять трудное решение...';

  @override
  String get chatSuggestion3 => 'Как преодолеть свой страх?';

  @override
  String get chatLoading => 'Размышляю...';

  @override
  String get chatViewFullAdvice => 'Посмотреть полный совет';

  @override
  String get chatInputPlaceholder => 'Поделитесь своими переживаниями...';

  @override
  String get chatInputHint => 'Введите сообщение...';

  @override
  String get chatSend => 'Отправить';

  @override
  String get favoritesTitle => 'Сохранённые советы';

  @override
  String get favoritesEmpty => 'Нет сохранённых советов';

  @override
  String get favoritesEmptySubtitle =>
      'Нажмите на закладку, чтобы сохранить мудрость';

  @override
  String get favoritesViewFull => 'Смотреть полностью';

  @override
  String get favoritesRemoveTitle => 'Удалить из сохранённого';

  @override
  String get favoritesRemoveMessage =>
      'Вы уверены, что хотите удалить этот совет из сохранённого?';

  @override
  String get favoritesRemoved => 'Удалено из сохранённого';

  @override
  String get remove => 'Удалить';

  @override
  String get historyDeleted => 'Удалено из истории';

  @override
  String get historyToday => 'Сегодня';

  @override
  String get historyYesterday => 'Вчера';

  @override
  String get historyDeleteTitle => 'Удалить совет';

  @override
  String get historyDeleteMessage =>
      'Вы уверены, что хотите удалить этот совет?';

  @override
  String get historyClearTitle => 'Очистить историю';

  @override
  String get historyClearMessage =>
      'Вы уверены, что хотите очистить всю историю? Это действие необратимо.';

  @override
  String get historyCleared => 'История очищена';

  @override
  String get clear => 'Очистить';

  @override
  String get navHome => 'Главная';

  @override
  String get navFavorites => 'Сохранённое';

  @override
  String get appTitle => 'Голос Мудрецов';

  @override
  String get homeWelcome => 'Чьей мудрости вы ищете сегодня?';

  @override
  String get homeSubtitle => 'Выберите наставника, который направит вас';

  @override
  String get languageTitle => 'Выбор языка';

  @override
  String get languageSelectPrompt => 'Выберите предпочитаемый язык';

  @override
  String get languageSelectSubtitle =>
      'Вы можете изменить это в настройках в любое время';

  @override
  String get personaFeatured => 'Рекомендуемые';

  @override
  String get personaSignatureQuote => 'Известная цитата';

  @override
  String get personaAbout => 'О персоне';

  @override
  String get personaStartChat => 'Начать диалог';

  @override
  String get personaCategory => 'Категория';

  @override
  String get personaEra => 'Эпоха';

  @override
  String get personaExpertise => 'Область мудрости';

  @override
  String get personaAskQuestion => 'Задать вопрос';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsData => 'Данные';

  @override
  String get settingsClearHistory => 'Очистить историю';

  @override
  String get settingsClearHistorySubtitle => 'Удалить все сохранённые диалоги';

  @override
  String get settingsAboutApp => 'О приложении Голос Мудрецов';

  @override
  String get settingsAboutAppSubtitle => 'Версия и информация о приложении';

  @override
  String get settingsPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get settingsPrivacyPolicySubtitle => 'Как мы обрабатываем ваши данные';

  @override
  String get settingsTermsSubtitle => 'Прочитать условия использования';

  @override
  String get settingsAppDescription =>
      'Получите мудрость величайших умов в истории';

  @override
  String get settingsClearHistoryDialogTitle => 'Очистить всю историю?';

  @override
  String get settingsClearHistoryDialogMessage =>
      'Все диалоги будут удалены безвозвратно. Это действие нельзя отменить.';

  @override
  String get settingsHistoryCleared => 'История успешно очищена';

  @override
  String get settingsAboutContent =>
      'Голос Мудрецов соединяет вас с мудростью величайших философов, лидеров и мыслителей в истории через диалоги на основе искусственного интеллекта.';

  @override
  String get category_anime => 'Аниме';

  @override
  String get persona_luffy => 'Монки Д. Луффи';

  @override
  String get persona_luffy_title => 'Будущий Король Пиратов';

  @override
  String get persona_luffy_quote => 'Я стану Королём Пиратов!';
}
