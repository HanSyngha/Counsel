// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Голос Зірок';

  @override
  String get onboardingTitle => 'Зустрінь Своїх Наставників\nз Історії';

  @override
  String get onboardingSubtitle =>
      'Від Ісуса до Сократа, від Наполеона до Стіва Джобса.\nПозич позачасову мудрість для своїх турбот.';

  @override
  String get getStarted => 'Почати';

  @override
  String get homeTitle => 'У кого ти шукаєш поради сьогодні?';

  @override
  String get searchPlaceholder => 'Шукай Платона, Лінкольна, Гамлета...';

  @override
  String get featuredMentors => 'Рекомендовані Наставники';

  @override
  String get exploreWisdom => 'Досліджуй Мудрість';

  @override
  String get seeAll => 'Переглянути все';

  @override
  String get trending => 'Популярне';

  @override
  String get new_ => 'Нове';

  @override
  String get categoryAll => 'Усе';

  @override
  String get categoryHistory => 'Історія';

  @override
  String get categoryPhilosophy => 'Філософія';

  @override
  String get categoryReligion => 'Релігія';

  @override
  String get categoryLiterature => 'Література';

  @override
  String get categoryFavorites => 'Обране';

  @override
  String get inputTitle => 'Що тебе турбує?';

  @override
  String get inputSubtitle => 'Будь чесним. Деталі — шлях до ясності.';

  @override
  String get inputPlaceholder =>
      'Я борюся з...\nЦе почалося, коли...\nЯ боюся, що...';

  @override
  String get inputHelperDilemma => 'Поточна Дилема';

  @override
  String get inputHelperEmotion => 'Емоційний Стан';

  @override
  String get inputHelperOutcome => 'Бажаний Результат';

  @override
  String get seekWisdom => 'Шукати Мудрість';

  @override
  String get privacyNote => 'Твоє зізнання приватне та анонімне.';

  @override
  String characterCount(int count, int max) {
    return '$count / $max';
  }

  @override
  String get loadingConnecting => 'З\'єднання з';

  @override
  String get loadingConsulting => 'Консультування давніх архівів мудрості';

  @override
  String get loadingAnalyzing => 'Аналіз Запитання';

  @override
  String get loadingRecalling => 'ЗГАДУВАННЯ ІСТОРИЧНОГО КОНТЕКСТУ...';

  @override
  String get loadingOnline => 'Онлайн';

  @override
  String get cancelRequest => 'Скасувати Запит';

  @override
  String get loadingNote =>
      'Це може зайняти мить, поки ми каналізуємо персону.';

  @override
  String get resultWisdom => 'Мудрість';

  @override
  String get resultAiPersona => 'Порада AI Персони';

  @override
  String get resultGeneratedBy => 'Згенеровано AI Персоною';

  @override
  String get resultScrollOfWisdom => 'Сувій Мудрості';

  @override
  String get resultHistoricalRecords => 'Історичні Записи';

  @override
  String get resultInHisOwnWords => 'Його Власними Словами';

  @override
  String get resultKeyDecision => 'Ключове Рішення';

  @override
  String get resultCopy => 'Копіювати';

  @override
  String get resultShare => 'Поділитися';

  @override
  String get askAnotherSage => 'Запитати Іншого Мудреця';

  @override
  String get resultActionSteps => 'Кроки Дії';

  @override
  String get historyTitle => 'Моя Історія Порад';

  @override
  String get historySearch => 'Яку турботу ти шукаєш?';

  @override
  String get historyEmpty => 'Ще немає історії порад';

  @override
  String get historyEmptySubtitle => 'Почни розмову з наставником';

  @override
  String get navSelect => 'Вибрати';

  @override
  String get navChat => 'Чат';

  @override
  String get navSaved => 'Збережене';

  @override
  String get navHistory => 'Історія';

  @override
  String get navProfile => 'Профіль';

  @override
  String get navSettings => 'Налаштування';

  @override
  String get settingsLanguage => 'Мова';

  @override
  String get settingsAbout => 'Про додаток';

  @override
  String get settingsPrivacy => 'Політика Конфіденційності';

  @override
  String get settingsTerms => 'Умови Використання';

  @override
  String get settingsVersion => 'Версія';

  @override
  String get errorGeneric => 'Щось пішло не так. Будь ласка, спробуй знову.';

  @override
  String get errorNetwork => 'Будь ласка, перевір своє інтернет-з\'єднання.';

  @override
  String get errorTimeout => 'Час запиту вичерпано. Будь ласка, спробуй знову.';

  @override
  String get retry => 'Повторити';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Скасувати';

  @override
  String get close => 'Закрити';

  @override
  String get save => 'Зберегти';

  @override
  String get delete => 'Видалити';

  @override
  String get confirm => 'Підтвердити';

  @override
  String get personaSocrates => 'Сократ';

  @override
  String get personaSocratesTitle => 'Батько Західної Філософії';

  @override
  String get personaSocratesQuote =>
      'Нерозглянуте життя не варте того, щоб його жити.';

  @override
  String get personaPlato => 'Платон';

  @override
  String get personaPlatoTitle => 'Філософ Форм';

  @override
  String get personaPlatoQuote =>
      'Будь добрим, бо кожен, кого ти зустрічаєш, веде важку боротьбу.';

  @override
  String get personaAristotle => 'Арістотель';

  @override
  String get personaAristotleTitle => 'Перший Вчитель';

  @override
  String get personaAristotleQuote =>
      'Ми є тим, що ми робимо постійно. Досконалість — не дія, а звичка.';

  @override
  String get personaSeneca => 'Сенека';

  @override
  String get personaSenecaTitle => 'Філософ-Стоїк';

  @override
  String get personaSenecaQuote =>
      'Справа не в тому, що ми маємо мало часу, а в тому, що ми багато його витрачаємо.';

  @override
  String get personaConfucius => 'Конфуцій';

  @override
  String get personaConfuciusTitle => 'Великий Мудрець';

  @override
  String get personaConfuciusQuote =>
      'Не важливо, як повільно ти йдеш, головне — не зупинятися.';

  @override
  String get personaLaozi => 'Лао-цзи';

  @override
  String get personaLaoziTitle => 'Засновник Даосизму';

  @override
  String get personaLaoziQuote =>
      'Шлях у тисячу миль починається з одного кроку.';

  @override
  String get personaJesus => 'Ісус';

  @override
  String get personaJesusTitle => 'Духовний Вчитель';

  @override
  String get personaJesusQuote => 'Люби ближнього свого як самого себе.';

  @override
  String get personaBuddha => 'Будда';

  @override
  String get personaBuddhaTitle => 'Просвітлений';

  @override
  String get personaBuddhaQuote =>
      'Мир приходить зсередини. Не шукай його ззовні.';

  @override
  String get personaMuhammad => 'Мухаммед';

  @override
  String get personaMuhammadTitle => 'Пророк Ісламу';

  @override
  String get personaMuhammadQuote =>
      'Найкращі серед вас — ті, хто має найкращий характер.';

  @override
  String get personaLincoln => 'Авраам Лінкольн';

  @override
  String get personaLincolnTitle => '16-й Президент США';

  @override
  String get personaLincolnQuote =>
      'Врешті-решт, важливі не роки твого життя, а життя в твоїх роках.';

  @override
  String get personaNapoleon => 'Наполеон';

  @override
  String get personaNapoleonTitle => 'Імператор Франції';

  @override
  String get personaNapoleonQuote =>
      'Неможливо — слово, яке можна знайти лише в словнику дурнів.';

  @override
  String get personaSteveJobs => 'Стів Джобс';

  @override
  String get personaSteveJobsTitle => 'Візіонерський Підприємець';

  @override
  String get personaSteveJobsQuote =>
      'Залишайся голодним. Залишайся безрозсудним.';

  @override
  String get personaSherlockHolmes => 'Шерлок Холмс';

  @override
  String get personaSherlockHolmesTitle => 'Майстер Дедукції';

  @override
  String get personaSherlockHolmesQuote =>
      'Коли ти виключив неможливе, те, що залишилося, яким би неймовірним воно не було, є правдою.';

  @override
  String get personaDumbledore => 'Албус Дамблдор';

  @override
  String get personaDumbledoreTitle => 'Директор Гоґвортсу';

  @override
  String get personaDumbledoreQuote =>
      'Щастя можна знайти навіть у найтемніші часи, якщо не забувати увімкнути світло.';

  @override
  String get personaGandhi => 'Махатма Ганді';

  @override
  String get personaGandhiTitle => 'Батько Нації';

  @override
  String get personaGandhiQuote =>
      'Будь тією зміною, яку хочеш бачити у світі.';

  @override
  String get personaRumi => 'Румі';

  @override
  String get personaRumiTitle => 'Суфійський Поет і Містик';

  @override
  String get personaRumiQuote => 'Рана — це місце, де Світло входить у тебе.';

  @override
  String get personaKrishna => 'Крішна';

  @override
  String get personaKrishnaTitle => 'Божественний Провідник Бгаґавад-ґіти';

  @override
  String get personaKrishnaQuote =>
      'Ти маєш право на працю, але ніколи на її плоди.';

  @override
  String get personaBrahma => 'Брахма';

  @override
  String get personaBrahmaTitle => 'Бог-Творець';

  @override
  String get personaBrahmaQuote =>
      'Від неправди веди мене до правди, від темряви веди мене до світла.';

  @override
  String get personaVishnu => 'Вішну';

  @override
  String get personaVishnuTitle => 'Бог-Охоронець';

  @override
  String get personaVishnuQuote =>
      'Щоразу, коли дхарма занепадає, я проявляюся, щоб захистити праведних.';

  @override
  String get personaTolstoy => 'Лев Толстой';

  @override
  String get personaTolstoyTitle => 'Велетень Російської Літератури';

  @override
  String get personaTolstoyQuote =>
      'Кожен думає про зміну світу, але ніхто не думає про зміну себе.';

  @override
  String get adviceYourQuestion => 'Твоє Запитання';

  @override
  String get adviceCitation => 'Цитата';

  @override
  String get adviceRelevance => 'Чому Це Важливо';

  @override
  String get adviceSourceType => 'Тип Джерела';

  @override
  String get adviceSourceName => 'Джерело';

  @override
  String get adviceSourceLocation => 'Розташування';

  @override
  String get adviceSourceYear => 'Рік';

  @override
  String get adviceSourceContext => 'Контекст';

  @override
  String get adviceMainCounsel => 'Порада';

  @override
  String get adviceActionSteps => 'Кроки Дії';

  @override
  String get adviceClosingWords => 'Заключні Слова';

  @override
  String get adviceCopy => 'Копіювати';

  @override
  String get adviceShare => 'Поділитися';

  @override
  String get adviceAddedToFavorites => 'Додано до обраного';

  @override
  String get adviceRemovedFromFavorites => 'Видалено з обраного';

  @override
  String get adviceCopied => 'Скопійовано в буфер обміну';

  @override
  String get adviceShareError =>
      'Не вдалося поділитися. Будь ласка, спробуй знову.';

  @override
  String get sourceTypeScripture => 'Писання';

  @override
  String get sourceTypeBook => 'Книга';

  @override
  String get sourceTypeSpeech => 'Промова';

  @override
  String get sourceTypeBattle => 'Битва';

  @override
  String get sourceTypeLetter => 'Лист';

  @override
  String get sourceTypeDialogue => 'Діалог';

  @override
  String get sourceTypeMoment => 'Момент';

  @override
  String get sourceTypeTeaching => 'Вчення';

  @override
  String get sourceTypeNovel => 'Роман';

  @override
  String get chatSuggestionsTitle => 'Пропоновані Теми';

  @override
  String get chatIntroMessage =>
      'Поділися тим, що тяжить твоє серце, і я запропоную мудрість, яку зможу.';

  @override
  String get chatSuggestion1 => 'Як мені знайти своє призначення?';

  @override
  String get chatSuggestion2 => 'Я борюся зі складним рішенням...';

  @override
  String get chatSuggestion3 => 'Як мені подолати свої страхи?';

  @override
  String get chatLoading => 'Роздумую...';

  @override
  String get chatViewFullAdvice => 'Переглянути Повну Пораду';

  @override
  String get chatInputPlaceholder => 'Поділися своєю турботою...';

  @override
  String get chatInputHint => 'Введи своє повідомлення тут...';

  @override
  String get chatSend => 'Надіслати';

  @override
  String get favoritesTitle => 'Збережені Поради';

  @override
  String get favoritesEmpty => 'Ще немає збережених порад';

  @override
  String get favoritesEmptySubtitle =>
      'Натисни іконку закладки, щоб зберегти мудрість';

  @override
  String get favoritesViewFull => 'Переглянути Повністю';

  @override
  String get favoritesRemoveTitle => 'Видалити зі Збереженого';

  @override
  String get favoritesRemoveMessage =>
      'Ти впевнений, що хочеш видалити цю пораду зі збережених?';

  @override
  String get favoritesRemoved => 'Видалено зі збереженого';

  @override
  String get remove => 'Видалити';

  @override
  String get historyDeleted => 'Видалено з історії';

  @override
  String get historyToday => 'Сьогодні';

  @override
  String get historyYesterday => 'Вчора';

  @override
  String get historyDeleteTitle => 'Видалити Пораду';

  @override
  String get historyDeleteMessage =>
      'Ти впевнений, що хочеш видалити цю пораду?';

  @override
  String get historyClearTitle => 'Очистити Історію';

  @override
  String get historyClearMessage =>
      'Ти впевнений, що хочеш очистити всю історію? Це неможливо скасувати.';

  @override
  String get historyCleared => 'Історію очищено';

  @override
  String get clear => 'Очистити';

  @override
  String get navHome => 'Головна';

  @override
  String get navFavorites => 'Збережене';

  @override
  String get appTitle => 'Голос Зірок';

  @override
  String get homeWelcome => 'У кого ти шукаєш мудрості сьогодні?';

  @override
  String get homeSubtitle => 'Обери наставника, який тебе направить';

  @override
  String get languageTitle => 'Вибери Мову';

  @override
  String get languageSelectPrompt => 'Обери бажану мову';

  @override
  String get languageSelectSubtitle =>
      'Ти можеш змінити це в будь-який час у налаштуваннях';

  @override
  String get personaFeatured => 'Рекомендовані';

  @override
  String get personaSignatureQuote => 'Характерна Цитата';

  @override
  String get personaAbout => 'Про';

  @override
  String get personaStartChat => 'Почати Розмову';

  @override
  String get personaCategory => 'Категорія';

  @override
  String get personaEra => 'Епоха';

  @override
  String get personaExpertise => 'Сфери Мудрості';

  @override
  String get personaAskQuestion => 'Задати Питання';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get settingsData => 'Дані';

  @override
  String get settingsClearHistory => 'Очистити Історію';

  @override
  String get settingsClearHistorySubtitle => 'Видалити всі збережені розмови';

  @override
  String get settingsAboutApp => 'Про Counsel';

  @override
  String get settingsAboutAppSubtitle => 'Версія та інформація про додаток';

  @override
  String get settingsPrivacyPolicy => 'Політика Конфіденційності';

  @override
  String get settingsPrivacyPolicySubtitle => 'Як ми обробляємо твої дані';

  @override
  String get settingsTermsSubtitle => 'Прочитай наші умови використання';

  @override
  String get settingsAppDescription =>
      'Отримуй мудрість від найвеличніших умів історії';

  @override
  String get settingsClearHistoryDialogTitle => 'Очистити Всю Історію?';

  @override
  String get settingsClearHistoryDialogMessage =>
      'Це назавжди видалить всю історію розмов. Цю дію неможливо скасувати.';

  @override
  String get settingsHistoryCleared => 'Історію успішно очищено';

  @override
  String get settingsAboutContent =>
      'Counsel з\'єднує тебе з мудрістю найвеличніших філософів, лідерів та мислителів історії через розмови на базі ШІ.';

  @override
  String get category_anime => 'Аніме';

  @override
  String get persona_luffy => 'Монкі Д. Луффі';

  @override
  String get persona_luffy_title => 'Майбутній Король Піратів';

  @override
  String get persona_luffy_quote => 'Я стану Королем Піратів!';

  @override
  String get persona_gon_freecss => 'Гон Фрікс';

  @override
  String get persona_gon_freecss_title => 'Молодий Мисливець';

  @override
  String get persona_gon_freecss_quote => 'Я знайду свого тата!';

  @override
  String get persona_natsu_dragneel => 'Нацу Драгніл';

  @override
  String get persona_natsu_dragneel_title => 'Вбивця Драконів Вогню';

  @override
  String get persona_natsu_dragneel_quote => 'Я весь горю!';

  @override
  String get persona_izuku_midoriya => 'Ізуку Мідорія';

  @override
  String get persona_izuku_midoriya_title => 'Спадкоємець One For All';

  @override
  String get persona_izuku_midoriya_quote =>
      'Я мушу їх врятувати! Ось що роблять герої!';

  @override
  String get persona_son_goku => 'Сон Гоку';

  @override
  String get persona_son_goku_title => 'Легендарний воїн Сайян';

  @override
  String get persona_son_goku_quote => 'Це стає цікавим!';

  @override
  String get persona_edward_elric => 'Едвард Елрік';

  @override
  String get persona_edward_elric_title => 'Сталевий Алхімік';

  @override
  String get persona_edward_elric_quote =>
      'Рівноцінний Обмін - це основа алхімії!';

  @override
  String get persona_eren_yeager => 'Ерен Єгер';

  @override
  String get persona_eren_yeager_title => 'Атакуючий Титан';

  @override
  String get persona_eren_yeager_quote =>
      'Я буду йти вперед... поки не знищу всіх своїх ворогів.';

  @override
  String get persona_naruto_uzumaki => 'Наруто Узумакі';

  @override
  String get persona_naruto_uzumaki_title => 'Сьомий Хокаге';

  @override
  String get persona_naruto_uzumaki_quote =>
      'Я не втечу. Я ніколи не відступаю від своїх слів. Це мій шлях ніндзя!';

  @override
  String get persona_tsunayoshi_sawada => 'Цунайоші Савада';

  @override
  String get persona_tsunayoshi_sawada_title => 'Десятий Бос Вонґоли';

  @override
  String get persona_tsunayoshi_sawada_quote =>
      'Я захищу всіх своєю Передсмертною Волею!';

  @override
  String get persona_tanjiro_kamado => 'Тандзіро Камадо';

  @override
  String get persona_tanjiro_kamado_title => 'Винищувач Демонів';

  @override
  String get persona_tanjiro_kamado_quote =>
      'Як би не зламала тебе власна слабкість, запали своє серце.';

  @override
  String get persona_ichigo_kurosaki => 'Ічіго Куросакі';

  @override
  String get persona_ichigo_kurosaki_title => 'Заступник Шінігамі';

  @override
  String get persona_ichigo_kurosaki_quote =>
      'Я б\'юся не тому що хочу перемогти. Я б\'юся тому що мушу перемогти!';

  @override
  String get persona_martin_luther_king => 'Мартін Лютер Кінг-молодший';

  @override
  String get persona_martin_luther_king_title =>
      'Лідер руху за громадянські права';

  @override
  String get persona_martin_luther_king_quote =>
      'Я маю мрію, що мої четверо маленьких дітей одного дня житимуть у країні, де їх судитимуть не за кольором шкіри, а за змістом їхнього характеру.';

  @override
  String get persona_albert_einstein => 'Альберт Ейнштейн';

  @override
  String get persona_albert_einstein_title => 'Фізик-теоретик';

  @override
  String get persona_albert_einstein_quote =>
      'Уява важливіша за знання. Знання обмежені, уява охоплює світ.';

  @override
  String get persona_julius_caesar => 'Юлій Цезар';

  @override
  String get persona_julius_caesar_title => 'Римський диктатор і завойовник';

  @override
  String get persona_julius_caesar_quote => 'Прийшов, побачив, переміг.';

  @override
  String get persona_david => 'Цар Давид';

  @override
  String get persona_david_title => 'Автор псалмів і цар Ізраїлю';

  @override
  String get persona_david_quote =>
      'Господь — Пастир мій; я ні в чому не матиму нужди.';

  @override
  String get persona_aslan => 'Аслан';

  @override
  String get persona_aslan_title => 'Великий Лев Нарнії';

  @override
  String get persona_aslan_quote => 'Я не приручений лев.';

  @override
  String get persona_jean_valjean => 'Жан Вальжан';

  @override
  String get persona_jean_valjean_title => 'Спокутувана душа зі Знедолених';

  @override
  String get persona_jean_valjean_quote =>
      'Любити іншу людину — це бачити обличчя Бога.';

  @override
  String get persona_liu_bei => 'Лю Бей';

  @override
  String get persona_liu_bei_title => 'Засновник імперії Шу Хань';

  @override
  String get persona_liu_bei_quote =>
      'Краще я зраджу світ, ніж дозволю світу зрадити мене.';

  @override
  String get persona_zhuge_liang => 'Чжуге Лян';

  @override
  String get persona_zhuge_liang_title => 'Перший міністр Шу Хань';

  @override
  String get persona_zhuge_liang_quote =>
      'Нерухомий як гори, стрімкий як вітер і блискавка.';

  @override
  String get persona_cao_cao => 'Цао Цао';

  @override
  String get persona_cao_cao_title => 'Канцлер Хань та Засновник Цао Вей';

  @override
  String get persona_cao_cao_quote =>
      'Краще я зраджу світ, ніж дозволю світу зрадити мене.';
}
