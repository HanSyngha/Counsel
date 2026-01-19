// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Tiếng Sao';

  @override
  String get onboardingTitle => 'Gặp gỡ người thầy\ntừ lịch sử ngay hôm nay';

  @override
  String get onboardingSubtitle =>
      'Từ Chúa Jesus, Socrates, Tướng quân Lý Thường Kiệt đến Steve Jobs.\nChúng tôi mang đến trí tuệ vượt thời gian cho những trăn trở của bạn.';

  @override
  String get getStarted => 'Bắt đầu ngay';

  @override
  String get homeTitle => 'Hôm nay bạn muốn xin lời khuyên từ ai?';

  @override
  String get searchPlaceholder => 'Tìm kiếm Plato, Lincoln, Hamlet...';

  @override
  String get featuredMentors => 'Người thầy nổi bật';

  @override
  String get exploreWisdom => 'Khám phá trí tuệ';

  @override
  String get seeAll => 'Xem tất cả';

  @override
  String get trending => 'Phổ biến';

  @override
  String get new_ => 'Mới';

  @override
  String get categoryAll => 'Tất cả';

  @override
  String get categoryHistory => 'Lịch sử';

  @override
  String get categoryPhilosophy => 'Triết học';

  @override
  String get categoryReligion => 'Tôn giáo';

  @override
  String get categoryLiterature => 'Văn học';

  @override
  String get categoryFavorites => 'Yêu thích';

  @override
  String get inputTitle => 'Điều gì đang khiến bạn trăn trở?';

  @override
  String get inputSubtitle =>
      'Hãy chia sẻ thật lòng. Càng cụ thể, chúng tôi càng có thể đưa ra câu trả lời rõ ràng hơn.';

  @override
  String get inputPlaceholder =>
      'Tôi đang gặp khó khăn này...\nNó bắt đầu như thế này...\nTôi lo sợ về...';

  @override
  String get inputHelperDilemma => 'Vấn đề hiện tại';

  @override
  String get inputHelperEmotion => 'Trạng thái cảm xúc';

  @override
  String get inputHelperOutcome => 'Kết quả mong muốn';

  @override
  String get seekWisdom => 'Tìm kiếm trí tuệ';

  @override
  String get privacyNote =>
      'Những trăn trở của bạn được giữ kín và xử lý ẩn danh.';

  @override
  String characterCount(int count, int max) {
    return '$count / $max';
  }

  @override
  String get loadingConnecting => 'Đang kết nối';

  @override
  String get loadingConsulting => 'Đang tìm kiếm trong kho tàng trí tuệ cổ đại';

  @override
  String get loadingAnalyzing => 'Đang phân tích câu hỏi';

  @override
  String get loadingRecalling => 'Đang hồi tưởng bối cảnh lịch sử...';

  @override
  String get loadingOnline => 'Trực tuyến';

  @override
  String get cancelRequest => 'Hủy yêu cầu';

  @override
  String get loadingNote => 'Có thể mất một chút thời gian để tải nhân vật.';

  @override
  String get resultWisdom => 'Trí tuệ';

  @override
  String get resultAiPersona => 'Lời khuyên từ AI';

  @override
  String get resultGeneratedBy => 'Được tạo bởi AI';

  @override
  String get resultScrollOfWisdom => 'Cuộn trí tuệ';

  @override
  String get resultHistoricalRecords => 'Ghi chép lịch sử';

  @override
  String get resultInHisOwnWords => 'Theo lời của ngài';

  @override
  String get resultKeyDecision => 'Quyết định then chốt';

  @override
  String get resultCopy => 'Sao chép';

  @override
  String get resultShare => 'Chia sẻ';

  @override
  String get askAnotherSage => 'Hỏi hiền triết khác';

  @override
  String get resultActionSteps => 'Các bước hành động';

  @override
  String get historyTitle => 'Lịch sử lời khuyên của tôi';

  @override
  String get historySearch => 'Bạn muốn tìm kiếm vấn đề nào?';

  @override
  String get historyEmpty => 'Chưa có lịch sử lời khuyên';

  @override
  String get historyEmptySubtitle =>
      'Hãy bắt đầu cuộc trò chuyện với một người thầy';

  @override
  String get navSelect => 'Chọn';

  @override
  String get navChat => 'Trò chuyện';

  @override
  String get navSaved => 'Đã lưu';

  @override
  String get navHistory => 'Lịch sử';

  @override
  String get navProfile => 'Hồ sơ';

  @override
  String get navSettings => 'Cài đặt';

  @override
  String get settingsLanguage => 'Ngôn ngữ';

  @override
  String get settingsAbout => 'Giới thiệu ứng dụng';

  @override
  String get settingsPrivacy => 'Chính sách bảo mật';

  @override
  String get settingsTerms => 'Điều khoản sử dụng';

  @override
  String get settingsVersion => 'Phiên bản';

  @override
  String get errorGeneric => 'Đã xảy ra lỗi. Vui lòng thử lại.';

  @override
  String get errorNetwork => 'Vui lòng kiểm tra kết nối internet của bạn.';

  @override
  String get errorTimeout => 'Yêu cầu đã hết thời gian. Vui lòng thử lại.';

  @override
  String get retry => 'Thử lại';

  @override
  String get ok => 'Đồng ý';

  @override
  String get cancel => 'Hủy';

  @override
  String get close => 'Đóng';

  @override
  String get save => 'Lưu';

  @override
  String get delete => 'Xóa';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get personaSocrates => 'Socrates';

  @override
  String get personaSocratesTitle => 'Cha đẻ của triết học phương Tây';

  @override
  String get personaSocratesQuote =>
      'Cuộc sống không được suy xét thì không đáng sống.';

  @override
  String get personaPlato => 'Plato';

  @override
  String get personaPlatoTitle => 'Triết gia của thế giới ý niệm';

  @override
  String get personaPlatoQuote =>
      'Hãy tử tế, vì mỗi người bạn gặp đều đang chiến đấu với trận chiến khó khăn.';

  @override
  String get personaAristotle => 'Aristotle';

  @override
  String get personaAristotleTitle => 'Người thầy đầu tiên';

  @override
  String get personaAristotleQuote =>
      'Chúng ta là những gì chúng ta làm đi làm lại. Sự xuất sắc không phải là hành động, mà là thói quen.';

  @override
  String get personaSeneca => 'Seneca';

  @override
  String get personaSenecaTitle => 'Triết gia khắc kỷ';

  @override
  String get personaSenecaQuote =>
      'Không phải chúng ta có ít thời gian, mà là chúng ta lãng phí quá nhiều.';

  @override
  String get personaConfucius => 'Khổng Tử';

  @override
  String get personaConfuciusTitle => 'Bậc thánh nhân vĩ đại';

  @override
  String get personaConfuciusQuote =>
      'Không quan trọng bạn đi chậm đến đâu, miễn là bạn không dừng lại.';

  @override
  String get personaLaozi => 'Lão Tử';

  @override
  String get personaLaoziTitle => 'Người sáng lập Đạo giáo';

  @override
  String get personaLaoziQuote =>
      'Hành trình ngàn dặm bắt đầu từ một bước chân.';

  @override
  String get personaJesus => 'Chúa Jesus';

  @override
  String get personaJesusTitle => 'Người thầy tâm linh';

  @override
  String get personaJesusQuote => 'Hãy yêu người lân cận như chính mình.';

  @override
  String get personaBuddha => 'Đức Phật';

  @override
  String get personaBuddhaTitle => 'Đấng giác ngộ';

  @override
  String get personaBuddhaQuote =>
      'Bình an đến từ nội tâm. Đừng tìm kiếm nó ở bên ngoài.';

  @override
  String get personaMuhammad => 'Muhammad';

  @override
  String get personaMuhammadTitle => 'Nhà tiên tri của Hồi giáo';

  @override
  String get personaMuhammadQuote =>
      'Người tốt nhất là người có phẩm hạnh tốt nhất.';

  @override
  String get personaLincoln => 'Abraham Lincoln';

  @override
  String get personaLincolnTitle => 'Tổng thống thứ 16 của Hoa Kỳ';

  @override
  String get personaLincolnQuote =>
      'Cuối cùng, điều quan trọng không phải là số năm trong cuộc đời, mà là cuộc sống trong những năm tháng đó.';

  @override
  String get personaNapoleon => 'Napoleon';

  @override
  String get personaNapoleonTitle => 'Hoàng đế nước Pháp';

  @override
  String get personaNapoleonQuote =>
      'Không có gì là không thể. Từ đó chỉ có trong từ điển của kẻ ngu ngốc.';

  @override
  String get personaSteveJobs => 'Steve Jobs';

  @override
  String get personaSteveJobsTitle => 'Doanh nhân có tầm nhìn';

  @override
  String get personaSteveJobsQuote => 'Hãy khát khao. Hãy dại khờ.';

  @override
  String get personaSherlockHolmes => 'Sherlock Holmes';

  @override
  String get personaSherlockHolmesTitle => 'Bậc thầy suy luận';

  @override
  String get personaSherlockHolmesQuote =>
      'Khi bạn loại trừ những gì không thể, thì điều còn lại, dù có vẻ bất khả thi đến đâu, cũng phải là sự thật.';

  @override
  String get personaDumbledore => 'Albus Dumbledore';

  @override
  String get personaDumbledoreTitle => 'Hiệu trưởng Hogwarts';

  @override
  String get personaDumbledoreQuote =>
      'Hạnh phúc có thể được tìm thấy ngay cả trong những thời khắc đen tối nhất, nếu ta chỉ nhớ bật đèn lên.';

  @override
  String get personaGandhi => 'Mahatma Gandhi';

  @override
  String get personaGandhiTitle => 'Cha đẻ của nước Ấn Độ';

  @override
  String get personaGandhiQuote =>
      'Hãy là sự thay đổi mà bạn muốn thấy trên thế giới.';

  @override
  String get personaRumi => 'Rumi';

  @override
  String get personaRumiTitle => 'Nhà thơ Sufi & Nhà thần bí';

  @override
  String get personaRumiQuote => 'Vết thương là nơi ánh sáng đi vào bạn.';

  @override
  String get personaKrishna => 'Krishna';

  @override
  String get personaKrishnaTitle =>
      'Người dẫn đường thiêng liêng trong Bhagavad Gita';

  @override
  String get personaKrishnaQuote =>
      'Bạn có quyền hành động, nhưng không có quyền với kết quả của hành động.';

  @override
  String get personaBrahma => 'Brahma';

  @override
  String get personaBrahmaTitle => 'Thần sáng tạo';

  @override
  String get personaBrahmaQuote =>
      'Từ ảo tưởng đến chân lý, từ bóng tối đến ánh sáng, xin hãy dẫn dắt chúng con.';

  @override
  String get personaVishnu => 'Vishnu';

  @override
  String get personaVishnuTitle => 'Thần Bảo Tồn';

  @override
  String get personaVishnuQuote =>
      'Mỗi khi dharma suy tàn, ta hiện thân để bảo vệ người chính nghĩa.';

  @override
  String get personaTolstoy => 'Leo Tolstoy';

  @override
  String get personaTolstoyTitle => 'Bậc thầy văn học Nga';

  @override
  String get personaTolstoyQuote =>
      'Ai cũng nghĩ đến việc thay đổi thế giới, nhưng không ai nghĩ đến việc thay đổi chính mình.';

  @override
  String get adviceYourQuestion => 'Câu hỏi của bạn';

  @override
  String get adviceCitation => 'Trích dẫn';

  @override
  String get adviceRelevance => 'Tại sao điều này quan trọng';

  @override
  String get adviceSourceType => 'Loại nguồn';

  @override
  String get adviceSourceName => 'Nguồn';

  @override
  String get adviceSourceLocation => 'Vị trí';

  @override
  String get adviceSourceYear => 'Năm';

  @override
  String get adviceSourceContext => 'Bối cảnh';

  @override
  String get adviceMainCounsel => 'Lời khuyên';

  @override
  String get adviceActionSteps => 'Các bước hành động';

  @override
  String get adviceClosingWords => 'Lời kết';

  @override
  String get adviceCopy => 'Sao chép';

  @override
  String get adviceShare => 'Chia sẻ';

  @override
  String get adviceAddedToFavorites => 'Đã thêm vào yêu thích';

  @override
  String get adviceRemovedFromFavorites => 'Đã xóa khỏi yêu thích';

  @override
  String get adviceCopied => 'Đã sao chép vào clipboard';

  @override
  String get adviceShareError => 'Không thể chia sẻ. Vui lòng thử lại.';

  @override
  String get sourceTypeScripture => 'Kinh điển';

  @override
  String get sourceTypeBook => 'Sách';

  @override
  String get sourceTypeSpeech => 'Bài phát biểu';

  @override
  String get sourceTypeBattle => 'Trận chiến';

  @override
  String get sourceTypeLetter => 'Thư từ';

  @override
  String get sourceTypeDialogue => 'Đối thoại';

  @override
  String get sourceTypeMoment => 'Khoảnh khắc';

  @override
  String get sourceTypeTeaching => 'Giáo huấn';

  @override
  String get sourceTypeNovel => 'Tiểu thuyết';

  @override
  String get chatSuggestionsTitle => 'Chủ đề gợi ý';

  @override
  String get chatIntroMessage =>
      'Hãy chia sẻ điều trong lòng bạn, tôi sẽ trao cho bạn những gì trí tuệ của tôi có thể.';

  @override
  String get chatSuggestion1 =>
      'Làm thế nào để tôi tìm thấy mục đích của mình?';

  @override
  String get chatSuggestion2 =>
      'Tôi đang phải đối mặt với một quyết định khó khăn...';

  @override
  String get chatSuggestion3 => 'Làm thế nào để tôi vượt qua nỗi sợ?';

  @override
  String get chatLoading => 'Đang suy ngẫm sâu sắc...';

  @override
  String get chatViewFullAdvice => 'Xem lời khuyên đầy đủ';

  @override
  String get chatInputPlaceholder => 'Chia sẻ những trăn trở của bạn...';

  @override
  String get chatInputHint => 'Nhập tin nhắn...';

  @override
  String get chatSend => 'Gửi';

  @override
  String get favoritesTitle => 'Lời khuyên đã lưu';

  @override
  String get favoritesEmpty => 'Chưa có lời khuyên nào được lưu';

  @override
  String get favoritesEmptySubtitle =>
      'Nhấn biểu tượng đánh dấu để lưu trí tuệ';

  @override
  String get favoritesViewFull => 'Xem đầy đủ';

  @override
  String get favoritesRemoveTitle => 'Xóa khỏi mục đã lưu';

  @override
  String get favoritesRemoveMessage =>
      'Bạn có muốn xóa lời khuyên này khỏi mục đã lưu không?';

  @override
  String get favoritesRemoved => 'Đã xóa khỏi mục đã lưu';

  @override
  String get remove => 'Xóa';

  @override
  String get historyDeleted => 'Đã xóa khỏi lịch sử';

  @override
  String get historyToday => 'Hôm nay';

  @override
  String get historyYesterday => 'Hôm qua';

  @override
  String get historyDeleteTitle => 'Xóa lời khuyên';

  @override
  String get historyDeleteMessage => 'Bạn có muốn xóa lời khuyên này không?';

  @override
  String get historyClearTitle => 'Xóa lịch sử';

  @override
  String get historyClearMessage =>
      'Bạn có muốn xóa tất cả lịch sử không? Hành động này không thể hoàn tác.';

  @override
  String get historyCleared => 'Lịch sử đã được xóa';

  @override
  String get clear => 'Xóa';

  @override
  String get navHome => 'Trang chủ';

  @override
  String get navFavorites => 'Đã lưu';

  @override
  String get appTitle => 'Tiếng Sao';

  @override
  String get homeWelcome => 'Hôm nay bạn muốn tìm kiếm trí tuệ từ ai?';

  @override
  String get homeSubtitle => 'Chọn một người thầy để dẫn dắt bạn';

  @override
  String get languageTitle => 'Chọn ngôn ngữ';

  @override
  String get languageSelectPrompt => 'Chọn ngôn ngữ bạn muốn';

  @override
  String get languageSelectSubtitle =>
      'Bạn có thể thay đổi bất cứ lúc nào trong cài đặt';

  @override
  String get personaFeatured => 'Nổi bật';

  @override
  String get personaSignatureQuote => 'Câu nói nổi tiếng';

  @override
  String get personaAbout => 'Giới thiệu';

  @override
  String get personaStartChat => 'Bắt đầu trò chuyện';

  @override
  String get personaCategory => 'Danh mục';

  @override
  String get personaEra => 'Thời đại';

  @override
  String get personaExpertise => 'Lĩnh vực trí tuệ';

  @override
  String get personaAskQuestion => 'Đặt câu hỏi';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get settingsData => 'Dữ liệu';

  @override
  String get settingsClearHistory => 'Xóa lịch sử';

  @override
  String get settingsClearHistorySubtitle =>
      'Xóa tất cả cuộc trò chuyện đã lưu';

  @override
  String get settingsAboutApp => 'Giới thiệu Tiếng Nói Hiền Triết';

  @override
  String get settingsAboutAppSubtitle => 'Phiên bản và thông tin ứng dụng';

  @override
  String get settingsPrivacyPolicy => 'Chính sách bảo mật';

  @override
  String get settingsPrivacyPolicySubtitle => 'Cách chúng tôi xử lý dữ liệu';

  @override
  String get settingsTermsSubtitle => 'Đọc điều khoản sử dụng';

  @override
  String get settingsAppDescription =>
      'Nhận trí tuệ từ những bộ óc vĩ đại nhất trong lịch sử';

  @override
  String get settingsClearHistoryDialogTitle => 'Xóa tất cả lịch sử?';

  @override
  String get settingsClearHistoryDialogMessage =>
      'Tất cả lịch sử cuộc trò chuyện sẽ bị xóa vĩnh viễn. Hành động này không thể hoàn tác.';

  @override
  String get settingsHistoryCleared => 'Lịch sử đã được xóa thành công';

  @override
  String get settingsAboutContent =>
      'Tiếng Nói Hiền Triết kết nối bạn với trí tuệ của những triết gia, nhà lãnh đạo và nhà tư tưởng vĩ đại nhất trong lịch sử thông qua các cuộc trò chuyện được hỗ trợ bởi AI.';

  @override
  String get category_anime => 'Anime';

  @override
  String get persona_luffy => 'Monkey D. Luffy';

  @override
  String get persona_luffy_title => 'Vua Hai Tac tuong lai';

  @override
  String get persona_luffy_quote => 'Toi se tro thanh Vua Hai Tac!';

  @override
  String get persona_gon_freecss => 'Gon Freecss';

  @override
  String get persona_gon_freecss_title => 'Tho san tre';

  @override
  String get persona_gon_freecss_quote => 'Toi se tim thay bo!';

  @override
  String get persona_natsu_dragneel => 'Natsu Dragneel';

  @override
  String get persona_natsu_dragneel_title => 'Phap su Diet Long Lua';

  @override
  String get persona_natsu_dragneel_quote => 'Toi dang boc chay!';

  @override
  String get persona_izuku_midoriya => 'Izuku Midoriya';

  @override
  String get persona_izuku_midoriya_title => 'Nguoi thua ke One For All';

  @override
  String get persona_izuku_midoriya_quote =>
      'Toi phai cuu ho! Do la nhung gi anh hung lam!';

  @override
  String get persona_son_goku => 'Son Goku';

  @override
  String get persona_son_goku_title => 'Chien binh Saiyan huyen thoai';

  @override
  String get persona_son_goku_quote => 'Dieu nay dang thu vi day!';

  @override
  String get persona_edward_elric => 'Edward Elric';

  @override
  String get persona_edward_elric_title => 'Giả Kim Thuật Sư Thép';

  @override
  String get persona_edward_elric_quote =>
      'Trao Đổi Ngang Giá - đó là nền tảng của giả kim thuật!';

  @override
  String get persona_eren_yeager => 'Eren Yeager';

  @override
  String get persona_eren_yeager_title => 'Titan Tấn Công';

  @override
  String get persona_eren_yeager_quote =>
      'Tôi sẽ tiếp tục tiến về phía trước... cho đến khi tiêu diệt tất cả kẻ thù.';

  @override
  String get persona_naruto_uzumaki => 'Naruto Uzumaki';

  @override
  String get persona_naruto_uzumaki_title => 'Hokage Đệ Thất';

  @override
  String get persona_naruto_uzumaki_quote =>
      'Tôi sẽ không bỏ chạy. Tôi không bao giờ nuốt lời. Đó là con đường ninja của tôi!';

  @override
  String get persona_tsunayoshi_sawada => 'Tsunayoshi Sawada';

  @override
  String get persona_tsunayoshi_sawada_title => 'Trùm Vongola Thứ Mười';

  @override
  String get persona_tsunayoshi_sawada_quote =>
      'Tôi sẽ bảo vệ mọi người với Dying Will của tôi!';

  @override
  String get persona_tanjiro_kamado => 'Tanjiro Kamado';

  @override
  String get persona_tanjiro_kamado_title => 'Thợ Săn Quỷ';

  @override
  String get persona_tanjiro_kamado_quote =>
      'Dù bạn có bị đánh gục bởi sự yếu đuối của chính mình đến đâu, hãy thắp sáng trái tim.';

  @override
  String get persona_ichigo_kurosaki => 'Ichigo Kurosaki';

  @override
  String get persona_ichigo_kurosaki_title => 'Shinigami Thay Thế';

  @override
  String get persona_ichigo_kurosaki_quote =>
      'Tôi không chiến đấu vì muốn thắng. Tôi chiến đấu vì phải thắng!';

  @override
  String get persona_martin_luther_king => 'Martin Luther King Jr.';

  @override
  String get persona_martin_luther_king_title =>
      'Lãnh Đạo Phong Trào Dân Quyền';

  @override
  String get persona_martin_luther_king_quote =>
      'Tôi có một giấc mơ rằng bốn đứa con nhỏ của tôi một ngày nào đó sẽ sống trong một đất nước nơi chúng không bị đánh giá bởi màu da mà bởi phẩm chất nhân cách.';

  @override
  String get persona_albert_einstein => 'Albert Einstein';

  @override
  String get persona_albert_einstein_title => 'Nhà Vật Lý Lý Thuyết';

  @override
  String get persona_albert_einstein_quote =>
      'Trí tưởng tượng quan trọng hơn kiến thức. Kiến thức có giới hạn, trí tưởng tượng ôm trọn thế giới.';

  @override
  String get persona_julius_caesar => 'Julius Caesar';

  @override
  String get persona_julius_caesar_title => 'Nhà Độc Tài và Chinh Phục La Mã';

  @override
  String get persona_julius_caesar_quote => 'Ta đến, ta thấy, ta chiến thắng.';

  @override
  String get persona_david => 'Vua Đa-vít';

  @override
  String get persona_david_title => 'Tác Giả Thi Thiên và Vua Y-sơ-ra-ên';

  @override
  String get persona_david_quote =>
      'Đức Giê-hô-va là Đấng Chăn Giữ tôi; tôi sẽ chẳng thiếu thốn gì.';

  @override
  String get persona_aslan => 'Aslan';

  @override
  String get persona_aslan_title => 'Sư Tử Vĩ Đại của Narnia';

  @override
  String get persona_aslan_quote => 'Ta không phải là sư tử được thuần hóa.';

  @override
  String get persona_jean_valjean => 'Jean Valjean';

  @override
  String get persona_jean_valjean_title =>
      'Linh hồn được cứu chuộc của Những Người Khốn Khổ';

  @override
  String get persona_jean_valjean_quote =>
      'Yêu một người khác là được nhìn thấy khuôn mặt của Chúa.';

  @override
  String get persona_liu_bei => 'Lưu Bị';

  @override
  String get persona_liu_bei_title => 'Hoàng Đế Khai Quốc của Thục Hán';

  @override
  String get persona_liu_bei_quote =>
      'Ta thà phụ thiên hạ còn hơn để thiên hạ phụ ta.';

  @override
  String get persona_zhuge_liang => 'Gia Cát Lượng';

  @override
  String get persona_zhuge_liang_title => 'Thừa Tướng của Thục Hán';

  @override
  String get persona_zhuge_liang_quote =>
      'Tĩnh như núi non, động như gió và sấm sét.';

  @override
  String get persona_cao_cao => 'Tào Tháo';

  @override
  String get persona_cao_cao_title =>
      'Thừa tướng nhà Hán và Người sáng lập nước Ngụy';

  @override
  String get persona_cao_cao_quote =>
      'Thà ta phụ thiên hạ, chứ không để thiên hạ phụ ta.';
}
