import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('pt'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Counsel'**
  String get appName;

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'Meet Your Mentors\nFrom History'**
  String get onboardingTitle;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'From Jesus to Socrates, Admiral Yi to Steve Jobs.\nBorrow timeless wisdom for your concerns.'**
  String get onboardingSubtitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Who do you seek counsel from today?'**
  String get homeTitle;

  /// No description provided for @searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search for Plato, Lincoln, Hamlet...'**
  String get searchPlaceholder;

  /// No description provided for @featuredMentors.
  ///
  /// In en, this message translates to:
  /// **'Featured Mentors'**
  String get featuredMentors;

  /// No description provided for @exploreWisdom.
  ///
  /// In en, this message translates to:
  /// **'Explore Wisdom'**
  String get exploreWisdom;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// No description provided for @new_.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get new_;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get categoryHistory;

  /// No description provided for @categoryPhilosophy.
  ///
  /// In en, this message translates to:
  /// **'Philosophy'**
  String get categoryPhilosophy;

  /// No description provided for @categoryReligion.
  ///
  /// In en, this message translates to:
  /// **'Religion'**
  String get categoryReligion;

  /// No description provided for @categoryLiterature.
  ///
  /// In en, this message translates to:
  /// **'Literature'**
  String get categoryLiterature;

  /// No description provided for @categoryFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get categoryFavorites;

  /// No description provided for @inputTitle.
  ///
  /// In en, this message translates to:
  /// **'What weighs on your mind?'**
  String get inputTitle;

  /// No description provided for @inputSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Be honest. Detail is the path to clarity.'**
  String get inputSubtitle;

  /// No description provided for @inputPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'I find myself struggling with...\nIt began when...\nI am afraid that...'**
  String get inputPlaceholder;

  /// No description provided for @inputHelperDilemma.
  ///
  /// In en, this message translates to:
  /// **'Current Dilemma'**
  String get inputHelperDilemma;

  /// No description provided for @inputHelperEmotion.
  ///
  /// In en, this message translates to:
  /// **'Emotional State'**
  String get inputHelperEmotion;

  /// No description provided for @inputHelperOutcome.
  ///
  /// In en, this message translates to:
  /// **'Desired Outcome'**
  String get inputHelperOutcome;

  /// No description provided for @seekWisdom.
  ///
  /// In en, this message translates to:
  /// **'Seek Wisdom'**
  String get seekWisdom;

  /// No description provided for @privacyNote.
  ///
  /// In en, this message translates to:
  /// **'Your confession is private and anonymous.'**
  String get privacyNote;

  /// No description provided for @characterCount.
  ///
  /// In en, this message translates to:
  /// **'{count} / {max}'**
  String characterCount(int count, int max);

  /// No description provided for @loadingConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting with'**
  String get loadingConnecting;

  /// No description provided for @loadingConsulting.
  ///
  /// In en, this message translates to:
  /// **'Consulting the ancient archives of wisdom'**
  String get loadingConsulting;

  /// No description provided for @loadingAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing Query'**
  String get loadingAnalyzing;

  /// No description provided for @loadingRecalling.
  ///
  /// In en, this message translates to:
  /// **'RECALLING HISTORICAL CONTEXT...'**
  String get loadingRecalling;

  /// No description provided for @loadingOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get loadingOnline;

  /// No description provided for @cancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel Request'**
  String get cancelRequest;

  /// No description provided for @loadingNote.
  ///
  /// In en, this message translates to:
  /// **'This may take a moment as we channel the persona.'**
  String get loadingNote;

  /// No description provided for @resultWisdom.
  ///
  /// In en, this message translates to:
  /// **'Wisdom'**
  String get resultWisdom;

  /// No description provided for @resultAiPersona.
  ///
  /// In en, this message translates to:
  /// **'AI Persona Advice'**
  String get resultAiPersona;

  /// No description provided for @resultGeneratedBy.
  ///
  /// In en, this message translates to:
  /// **'Generated by AI Persona'**
  String get resultGeneratedBy;

  /// No description provided for @resultScrollOfWisdom.
  ///
  /// In en, this message translates to:
  /// **'Scroll of Wisdom'**
  String get resultScrollOfWisdom;

  /// No description provided for @resultHistoricalRecords.
  ///
  /// In en, this message translates to:
  /// **'Historical Records'**
  String get resultHistoricalRecords;

  /// No description provided for @resultInHisOwnWords.
  ///
  /// In en, this message translates to:
  /// **'In Their Own Words'**
  String get resultInHisOwnWords;

  /// No description provided for @resultKeyDecision.
  ///
  /// In en, this message translates to:
  /// **'Key Decision'**
  String get resultKeyDecision;

  /// No description provided for @resultCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get resultCopy;

  /// No description provided for @resultShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get resultShare;

  /// No description provided for @askAnotherSage.
  ///
  /// In en, this message translates to:
  /// **'Ask Another Sage'**
  String get askAnotherSage;

  /// No description provided for @resultActionSteps.
  ///
  /// In en, this message translates to:
  /// **'Action Steps'**
  String get resultActionSteps;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'My Advice History'**
  String get historyTitle;

  /// No description provided for @historySearch.
  ///
  /// In en, this message translates to:
  /// **'What concern are you searching for?'**
  String get historySearch;

  /// No description provided for @historyEmpty.
  ///
  /// In en, this message translates to:
  /// **'No advice history yet'**
  String get historyEmpty;

  /// No description provided for @historyEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start a conversation with a mentor'**
  String get historyEmptySubtitle;

  /// No description provided for @navSelect.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get navSelect;

  /// No description provided for @navChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get navChat;

  /// No description provided for @navSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get navSaved;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacy;

  /// No description provided for @settingsTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get settingsTerms;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out. Please try again.'**
  String get errorTimeout;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @personaSocrates.
  ///
  /// In en, this message translates to:
  /// **'Socrates'**
  String get personaSocrates;

  /// No description provided for @personaSocratesTitle.
  ///
  /// In en, this message translates to:
  /// **'Father of Western Philosophy'**
  String get personaSocratesTitle;

  /// No description provided for @personaSocratesQuote.
  ///
  /// In en, this message translates to:
  /// **'The unexamined life is not worth living.'**
  String get personaSocratesQuote;

  /// No description provided for @personaPlato.
  ///
  /// In en, this message translates to:
  /// **'Plato'**
  String get personaPlato;

  /// No description provided for @personaPlatoTitle.
  ///
  /// In en, this message translates to:
  /// **'Philosopher of the Forms'**
  String get personaPlatoTitle;

  /// No description provided for @personaPlatoQuote.
  ///
  /// In en, this message translates to:
  /// **'Be kind, for everyone you meet is fighting a hard battle.'**
  String get personaPlatoQuote;

  /// No description provided for @personaAristotle.
  ///
  /// In en, this message translates to:
  /// **'Aristotle'**
  String get personaAristotle;

  /// No description provided for @personaAristotleTitle.
  ///
  /// In en, this message translates to:
  /// **'The First Teacher'**
  String get personaAristotleTitle;

  /// No description provided for @personaAristotleQuote.
  ///
  /// In en, this message translates to:
  /// **'We are what we repeatedly do. Excellence is not an act, but a habit.'**
  String get personaAristotleQuote;

  /// No description provided for @personaSeneca.
  ///
  /// In en, this message translates to:
  /// **'Seneca'**
  String get personaSeneca;

  /// No description provided for @personaSenecaTitle.
  ///
  /// In en, this message translates to:
  /// **'Stoic Philosopher'**
  String get personaSenecaTitle;

  /// No description provided for @personaSenecaQuote.
  ///
  /// In en, this message translates to:
  /// **'It is not that we have a short time to live, but that we waste a lot of it.'**
  String get personaSenecaQuote;

  /// No description provided for @personaConfucius.
  ///
  /// In en, this message translates to:
  /// **'Confucius'**
  String get personaConfucius;

  /// No description provided for @personaConfuciusTitle.
  ///
  /// In en, this message translates to:
  /// **'The Great Sage'**
  String get personaConfuciusTitle;

  /// No description provided for @personaConfuciusQuote.
  ///
  /// In en, this message translates to:
  /// **'It does not matter how slowly you go as long as you do not stop.'**
  String get personaConfuciusQuote;

  /// No description provided for @personaLaozi.
  ///
  /// In en, this message translates to:
  /// **'Laozi'**
  String get personaLaozi;

  /// No description provided for @personaLaoziTitle.
  ///
  /// In en, this message translates to:
  /// **'Founder of Taoism'**
  String get personaLaoziTitle;

  /// No description provided for @personaLaoziQuote.
  ///
  /// In en, this message translates to:
  /// **'The journey of a thousand miles begins with a single step.'**
  String get personaLaoziQuote;

  /// No description provided for @personaJesus.
  ///
  /// In en, this message translates to:
  /// **'Jesus'**
  String get personaJesus;

  /// No description provided for @personaJesusTitle.
  ///
  /// In en, this message translates to:
  /// **'Spiritual Teacher'**
  String get personaJesusTitle;

  /// No description provided for @personaJesusQuote.
  ///
  /// In en, this message translates to:
  /// **'Love your neighbor as yourself.'**
  String get personaJesusQuote;

  /// No description provided for @personaBuddha.
  ///
  /// In en, this message translates to:
  /// **'Buddha'**
  String get personaBuddha;

  /// No description provided for @personaBuddhaTitle.
  ///
  /// In en, this message translates to:
  /// **'The Awakened One'**
  String get personaBuddhaTitle;

  /// No description provided for @personaBuddhaQuote.
  ///
  /// In en, this message translates to:
  /// **'Peace comes from within. Do not seek it without.'**
  String get personaBuddhaQuote;

  /// No description provided for @personaMuhammad.
  ///
  /// In en, this message translates to:
  /// **'Muhammad'**
  String get personaMuhammad;

  /// No description provided for @personaMuhammadTitle.
  ///
  /// In en, this message translates to:
  /// **'Prophet of Islam'**
  String get personaMuhammadTitle;

  /// No description provided for @personaMuhammadQuote.
  ///
  /// In en, this message translates to:
  /// **'The best among you are those who have the best character.'**
  String get personaMuhammadQuote;

  /// No description provided for @personaLincoln.
  ///
  /// In en, this message translates to:
  /// **'Abraham Lincoln'**
  String get personaLincoln;

  /// No description provided for @personaLincolnTitle.
  ///
  /// In en, this message translates to:
  /// **'16th U.S. President'**
  String get personaLincolnTitle;

  /// No description provided for @personaLincolnQuote.
  ///
  /// In en, this message translates to:
  /// **'In the end, it\'s not the years in your life that count. It\'s the life in your years.'**
  String get personaLincolnQuote;

  /// No description provided for @personaNapoleon.
  ///
  /// In en, this message translates to:
  /// **'Napoleon'**
  String get personaNapoleon;

  /// No description provided for @personaNapoleonTitle.
  ///
  /// In en, this message translates to:
  /// **'Emperor of France'**
  String get personaNapoleonTitle;

  /// No description provided for @personaNapoleonQuote.
  ///
  /// In en, this message translates to:
  /// **'Impossible is a word to be found only in the dictionary of fools.'**
  String get personaNapoleonQuote;

  /// No description provided for @personaSteveJobs.
  ///
  /// In en, this message translates to:
  /// **'Steve Jobs'**
  String get personaSteveJobs;

  /// No description provided for @personaSteveJobsTitle.
  ///
  /// In en, this message translates to:
  /// **'Visionary Entrepreneur'**
  String get personaSteveJobsTitle;

  /// No description provided for @personaSteveJobsQuote.
  ///
  /// In en, this message translates to:
  /// **'Stay hungry. Stay foolish.'**
  String get personaSteveJobsQuote;

  /// No description provided for @personaSherlockHolmes.
  ///
  /// In en, this message translates to:
  /// **'Sherlock Holmes'**
  String get personaSherlockHolmes;

  /// No description provided for @personaSherlockHolmesTitle.
  ///
  /// In en, this message translates to:
  /// **'Master of Deduction'**
  String get personaSherlockHolmesTitle;

  /// No description provided for @personaSherlockHolmesQuote.
  ///
  /// In en, this message translates to:
  /// **'When you have eliminated the impossible, whatever remains must be the truth.'**
  String get personaSherlockHolmesQuote;

  /// No description provided for @personaDumbledore.
  ///
  /// In en, this message translates to:
  /// **'Albus Dumbledore'**
  String get personaDumbledore;

  /// No description provided for @personaDumbledoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Headmaster of Hogwarts'**
  String get personaDumbledoreTitle;

  /// No description provided for @personaDumbledoreQuote.
  ///
  /// In en, this message translates to:
  /// **'Happiness can be found even in the darkest of times, if one only remembers to turn on the light.'**
  String get personaDumbledoreQuote;

  /// No description provided for @personaGandhi.
  ///
  /// In en, this message translates to:
  /// **'Mahatma Gandhi'**
  String get personaGandhi;

  /// No description provided for @personaGandhiTitle.
  ///
  /// In en, this message translates to:
  /// **'Father of the Nation'**
  String get personaGandhiTitle;

  /// No description provided for @personaGandhiQuote.
  ///
  /// In en, this message translates to:
  /// **'Be the change you wish to see in the world.'**
  String get personaGandhiQuote;

  /// No description provided for @personaRumi.
  ///
  /// In en, this message translates to:
  /// **'Rumi'**
  String get personaRumi;

  /// No description provided for @personaRumiTitle.
  ///
  /// In en, this message translates to:
  /// **'Sufi Poet & Mystic'**
  String get personaRumiTitle;

  /// No description provided for @personaRumiQuote.
  ///
  /// In en, this message translates to:
  /// **'The wound is the place where the Light enters you.'**
  String get personaRumiQuote;

  /// No description provided for @personaKrishna.
  ///
  /// In en, this message translates to:
  /// **'Krishna'**
  String get personaKrishna;

  /// No description provided for @personaKrishnaTitle.
  ///
  /// In en, this message translates to:
  /// **'Divine Guide of the Bhagavad Gita'**
  String get personaKrishnaTitle;

  /// No description provided for @personaKrishnaQuote.
  ///
  /// In en, this message translates to:
  /// **'You have the right to work, but never to the fruit of work.'**
  String get personaKrishnaQuote;

  /// No description provided for @personaBrahma.
  ///
  /// In en, this message translates to:
  /// **'Brahma'**
  String get personaBrahma;

  /// No description provided for @personaBrahmaTitle.
  ///
  /// In en, this message translates to:
  /// **'The Creator God'**
  String get personaBrahmaTitle;

  /// No description provided for @personaBrahmaQuote.
  ///
  /// In en, this message translates to:
  /// **'From the unreal lead me to the real, from darkness lead me to light.'**
  String get personaBrahmaQuote;

  /// No description provided for @personaTolstoy.
  ///
  /// In en, this message translates to:
  /// **'Leo Tolstoy'**
  String get personaTolstoy;

  /// No description provided for @personaTolstoyTitle.
  ///
  /// In en, this message translates to:
  /// **'Russian Literary Giant'**
  String get personaTolstoyTitle;

  /// No description provided for @personaTolstoyQuote.
  ///
  /// In en, this message translates to:
  /// **'Everyone thinks of changing the world, but no one thinks of changing himself.'**
  String get personaTolstoyQuote;

  /// No description provided for @adviceYourQuestion.
  ///
  /// In en, this message translates to:
  /// **'Your Question'**
  String get adviceYourQuestion;

  /// No description provided for @adviceCitation.
  ///
  /// In en, this message translates to:
  /// **'Citation'**
  String get adviceCitation;

  /// No description provided for @adviceRelevance.
  ///
  /// In en, this message translates to:
  /// **'Why This Matters'**
  String get adviceRelevance;

  /// No description provided for @adviceSourceType.
  ///
  /// In en, this message translates to:
  /// **'Source Type'**
  String get adviceSourceType;

  /// No description provided for @adviceSourceName.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get adviceSourceName;

  /// No description provided for @adviceSourceLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get adviceSourceLocation;

  /// No description provided for @adviceSourceYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get adviceSourceYear;

  /// No description provided for @adviceSourceContext.
  ///
  /// In en, this message translates to:
  /// **'Context'**
  String get adviceSourceContext;

  /// No description provided for @adviceMainCounsel.
  ///
  /// In en, this message translates to:
  /// **'Counsel'**
  String get adviceMainCounsel;

  /// No description provided for @adviceActionSteps.
  ///
  /// In en, this message translates to:
  /// **'Action Steps'**
  String get adviceActionSteps;

  /// No description provided for @adviceClosingWords.
  ///
  /// In en, this message translates to:
  /// **'Closing Words'**
  String get adviceClosingWords;

  /// No description provided for @adviceCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get adviceCopy;

  /// No description provided for @adviceShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get adviceShare;

  /// No description provided for @adviceAddedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get adviceAddedToFavorites;

  /// No description provided for @adviceRemovedFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get adviceRemovedFromFavorites;

  /// No description provided for @adviceCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get adviceCopied;

  /// No description provided for @adviceShareError.
  ///
  /// In en, this message translates to:
  /// **'Could not share. Please try again.'**
  String get adviceShareError;

  /// No description provided for @sourceTypeScripture.
  ///
  /// In en, this message translates to:
  /// **'Scripture'**
  String get sourceTypeScripture;

  /// No description provided for @sourceTypeBook.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get sourceTypeBook;

  /// No description provided for @sourceTypeSpeech.
  ///
  /// In en, this message translates to:
  /// **'Speech'**
  String get sourceTypeSpeech;

  /// No description provided for @sourceTypeBattle.
  ///
  /// In en, this message translates to:
  /// **'Battle'**
  String get sourceTypeBattle;

  /// No description provided for @sourceTypeLetter.
  ///
  /// In en, this message translates to:
  /// **'Letter'**
  String get sourceTypeLetter;

  /// No description provided for @sourceTypeDialogue.
  ///
  /// In en, this message translates to:
  /// **'Dialogue'**
  String get sourceTypeDialogue;

  /// No description provided for @sourceTypeMoment.
  ///
  /// In en, this message translates to:
  /// **'Moment'**
  String get sourceTypeMoment;

  /// No description provided for @sourceTypeTeaching.
  ///
  /// In en, this message translates to:
  /// **'Teaching'**
  String get sourceTypeTeaching;

  /// No description provided for @sourceTypeNovel.
  ///
  /// In en, this message translates to:
  /// **'Novel'**
  String get sourceTypeNovel;

  /// No description provided for @chatSuggestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggested Topics'**
  String get chatSuggestionsTitle;

  /// No description provided for @chatIntroMessage.
  ///
  /// In en, this message translates to:
  /// **'Share what weighs on your heart, and I shall offer what wisdom I can.'**
  String get chatIntroMessage;

  /// No description provided for @chatSuggestion1.
  ///
  /// In en, this message translates to:
  /// **'How do I find my purpose?'**
  String get chatSuggestion1;

  /// No description provided for @chatSuggestion2.
  ///
  /// In en, this message translates to:
  /// **'I\'m struggling with a difficult decision...'**
  String get chatSuggestion2;

  /// No description provided for @chatSuggestion3.
  ///
  /// In en, this message translates to:
  /// **'How do I overcome my fears?'**
  String get chatSuggestion3;

  /// No description provided for @chatLoading.
  ///
  /// In en, this message translates to:
  /// **'Contemplating...'**
  String get chatLoading;

  /// No description provided for @chatViewFullAdvice.
  ///
  /// In en, this message translates to:
  /// **'View Full Advice'**
  String get chatViewFullAdvice;

  /// No description provided for @chatInputPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Share your concern...'**
  String get chatInputPlaceholder;

  /// No description provided for @chatInputHint.
  ///
  /// In en, this message translates to:
  /// **'Type your message here...'**
  String get chatInputHint;

  /// No description provided for @chatSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get chatSend;

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Advice'**
  String get favoritesTitle;

  /// No description provided for @favoritesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No saved advice yet'**
  String get favoritesEmpty;

  /// No description provided for @favoritesEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the bookmark icon to save wisdom'**
  String get favoritesEmptySubtitle;

  /// No description provided for @favoritesViewFull.
  ///
  /// In en, this message translates to:
  /// **'View Full'**
  String get favoritesViewFull;

  /// No description provided for @favoritesRemoveTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove from Saved'**
  String get favoritesRemoveTitle;

  /// No description provided for @favoritesRemoveMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this advice from your saved items?'**
  String get favoritesRemoveMessage;

  /// No description provided for @favoritesRemoved.
  ///
  /// In en, this message translates to:
  /// **'Removed from saved'**
  String get favoritesRemoved;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @historyDeleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted from history'**
  String get historyDeleted;

  /// No description provided for @historyToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get historyToday;

  /// No description provided for @historyYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get historyYesterday;

  /// No description provided for @historyDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Advice'**
  String get historyDeleteTitle;

  /// No description provided for @historyDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this advice?'**
  String get historyDeleteMessage;

  /// No description provided for @historyClearTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get historyClearTitle;

  /// No description provided for @historyClearMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all history? This cannot be undone.'**
  String get historyClearMessage;

  /// No description provided for @historyCleared.
  ///
  /// In en, this message translates to:
  /// **'History cleared'**
  String get historyCleared;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navFavorites.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get navFavorites;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Counsel'**
  String get appTitle;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Who do you seek wisdom from today?'**
  String get homeWelcome;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a mentor to guide you'**
  String get homeSubtitle;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get languageTitle;

  /// No description provided for @languageSelectPrompt.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language'**
  String get languageSelectPrompt;

  /// No description provided for @languageSelectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You can change this anytime in settings'**
  String get languageSelectSubtitle;

  /// No description provided for @personaFeatured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get personaFeatured;

  /// No description provided for @personaSignatureQuote.
  ///
  /// In en, this message translates to:
  /// **'Signature Quote'**
  String get personaSignatureQuote;

  /// No description provided for @personaAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get personaAbout;

  /// No description provided for @personaStartChat.
  ///
  /// In en, this message translates to:
  /// **'Start Conversation'**
  String get personaStartChat;

  /// No description provided for @personaCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get personaCategory;

  /// No description provided for @personaEra.
  ///
  /// In en, this message translates to:
  /// **'Era'**
  String get personaEra;

  /// No description provided for @personaExpertise.
  ///
  /// In en, this message translates to:
  /// **'Areas of Wisdom'**
  String get personaExpertise;

  /// No description provided for @personaAskQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask a Question'**
  String get personaAskQuestion;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get settingsData;

  /// No description provided for @settingsClearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get settingsClearHistory;

  /// No description provided for @settingsClearHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Remove all saved conversations'**
  String get settingsClearHistorySubtitle;

  /// No description provided for @settingsAboutApp.
  ///
  /// In en, this message translates to:
  /// **'About Counsel'**
  String get settingsAboutApp;

  /// No description provided for @settingsAboutAppSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Version and app information'**
  String get settingsAboutAppSubtitle;

  /// No description provided for @settingsPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// No description provided for @settingsPrivacyPolicySubtitle.
  ///
  /// In en, this message translates to:
  /// **'How we handle your data'**
  String get settingsPrivacyPolicySubtitle;

  /// No description provided for @settingsTermsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Read our terms of service'**
  String get settingsTermsSubtitle;

  /// No description provided for @settingsAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Get wisdom from history\'s greatest minds'**
  String get settingsAppDescription;

  /// No description provided for @settingsClearHistoryDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear All History?'**
  String get settingsClearHistoryDialogTitle;

  /// No description provided for @settingsClearHistoryDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete all your conversation history. This action cannot be undone.'**
  String get settingsClearHistoryDialogMessage;

  /// No description provided for @settingsHistoryCleared.
  ///
  /// In en, this message translates to:
  /// **'History cleared successfully'**
  String get settingsHistoryCleared;

  /// No description provided for @settingsAboutContent.
  ///
  /// In en, this message translates to:
  /// **'Counsel connects you with the wisdom of history\'s greatest philosophers, leaders, and thinkers through AI-powered conversations.'**
  String get settingsAboutContent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'ja',
    'ko',
    'ms',
    'pt',
    'ru',
    'th',
    'tr',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
