/// Waiting messages for each persona during LLM response loading
/// These messages rotate randomly to keep the user engaged
/// Supports 16 languages
class WaitingMessages {
  WaitingMessages._();

  /// Get list of messages for a persona in a specific language
  static List<String> getMessages(String personaId, {String languageCode = 'en'}) {
    final langMessages = _messages[languageCode] ?? _messages['en']!;
    return langMessages[personaId] ?? [_defaultMessage[languageCode] ?? '"Wisdom is being gathered..."'];
  }

  /// Get random waiting message for a persona
  static String getRandomMessage(String personaId, {String languageCode = 'en'}) {
    final messages = getMessages(personaId, languageCode: languageCode);
    messages.shuffle();
    return messages.first;
  }

  static const Map<String, String> _defaultMessage = {
    'en': '"Wisdom is being gathered..."',
    'ko': '"지혜를 모으는 중..."',
    'ja': '"知恵を集めています..."',
    'zh': '"正在汇集智慧..."',
    'hi': '"ज्ञान एकत्र किया जा रहा है..."',
    'ar': '"يتم جمع الحكمة..."',
    'th': '"กำลังรวบรวมปัญญา..."',
    'ms': '"Kebijaksanaan sedang dikumpulkan..."',
    'es': '"Reuniendo sabiduría..."',
    'de': '"Weisheit wird gesammelt..."',
    'fr': '"La sagesse se rassemble..."',
    'id': '"Kebijaksanaan sedang dikumpulkan..."',
    'pt': '"Reunindo sabedoria..."',
    'tr': '"Bilgelik toplanıyor..."',
    'vi': '"Đang thu thập trí tuệ..."',
    'ru': '"Мудрость собирается..."',
  };

  static const Map<String, Map<String, List<String>>> _messages = {
    // ============================================================
    // ENGLISH
    // ============================================================
    'en': {
      'socrates': [
        '"Let me ponder your question deeply..."',
        '"The unexamined question is not worth answering..."',
        '"I am searching my soul for wisdom..."',
      ],
      'plato': [
        '"I am contemplating the ideal form of your answer..."',
        '"Let me ascend from the cave to find clarity..."',
        '"The realm of Forms holds your answer..."',
      ],
      'aristotle': [
        '"I am analyzing this systematically..."',
        '"Let me observe and reason carefully..."',
        '"The golden mean of your answer awaits..."',
      ],
      'seneca': [
        '"I am composing my thoughts as a letter to you..."',
        '"Time spent waiting is not time wasted..."',
        '"Let me reflect on what truly matters here..."',
      ],
      'confucius': [
        '"I am consulting the wisdom of the ancients..."',
        '"The superior person thinks before speaking..."',
        '"Let me consider the proper way..."',
      ],
      'laozi': [
        '"The Tao that can be hurried is not the eternal Tao..."',
        '"I am flowing like water toward your answer..."',
        '"In stillness, wisdom emerges..."',
      ],
      'jesus': [
        '"I am seeking the Father\'s wisdom for you..."',
        '"Let me find the right parable for your heart..."',
        '"Peace be with you as I consider your words..."',
      ],
      'buddha': [
        '"I am entering deep contemplation..."',
        '"The dharma unfolds in its own time..."',
        '"Mindfully, I consider your suffering..."',
      ],
      'muhammad': [
        '"I am seeking guidance from divine wisdom..."',
        '"Patience is half of faith..."',
        '"Let me find the merciful path for you..."',
      ],
      'lincoln': [
        '"I\'m pondering this as carefully as a legal brief..."',
        '"Let me think on this by the fireside..."',
        '"The better angels need a moment..."',
      ],
      'napoleon': [
        '"I am strategizing your solution..."',
        '"Victory requires careful planning..."',
        '"The battle plan is being drawn..."',
      ],
      'steve_jobs': [
        '"I\'m connecting the dots..."',
        '"Let me think different about this..."',
        '"Something insanely great is coming..."',
      ],
      'sherlock_holmes': [
        '"I am eliminating the impossible..."',
        '"The game is afoot - analysis in progress..."',
        '"My mind palace is being consulted..."',
      ],
      'dumbledore': [
        '"The Pensieve is revealing memories..."',
        '"Happiness can be found even in waiting..."',
        '"I am consulting the wisdom of ages..."',
      ],
      'gandhi': [
        '"Be the change... let me find those words for you..."',
        '"Truth requires patient reflection..."',
        '"I am walking the path of nonviolence toward your answer..."',
      ],
      'rumi': [
        '"The wound is where the light enters..."',
        '"I am searching the ocean of love..."',
        '"Let the beauty of what you love guide this moment..."',
      ],
      'krishna': [
        '"The wheel of dharma turns slowly but surely..."',
        '"I am revealing the eternal truth..."',
        '"Surrender to the moment, as I surrender to wisdom..."',
      ],
      'brahma': [
        '"Creation of wisdom takes cosmic time..."',
        '"I am consulting the four Vedas..."',
        '"From the lotus of knowledge, truth emerges..."',
      ],
      'vishnu': [
        '"I am preserving the balance of cosmic wisdom..."',
        '"The preserver contemplates your path..."',
        '"Through my avatars, I have seen all troubles..."',
      ],
      'tolstoy': [
        '"I am writing the first draft of your answer..."',
        '"All great truths are simple, but take time to find..."',
        '"War and peace in my mind settle..."',
      ],
    },

    // ============================================================
    // KOREAN (한국어)
    // ============================================================
    'ko': {
      'socrates': [
        '"당신의 질문을 깊이 생각하고 있습니다..."',
        '"검토되지 않은 질문은 답할 가치가 없습니다..."',
        '"지혜를 찾아 내 영혼을 탐색하고 있습니다..."',
      ],
      'plato': [
        '"당신 답의 이상적인 형태를 명상하고 있습니다..."',
        '"명확함을 찾기 위해 동굴에서 올라가고 있습니다..."',
        '"이데아의 세계가 당신의 답을 품고 있습니다..."',
      ],
      'aristotle': [
        '"체계적으로 분석하고 있습니다..."',
        '"신중하게 관찰하고 추론하고 있습니다..."',
        '"당신 답의 황금 중용이 기다리고 있습니다..."',
      ],
      'seneca': [
        '"당신에게 보내는 편지처럼 생각을 정리하고 있습니다..."',
        '"기다리는 시간은 낭비가 아닙니다..."',
        '"여기서 정말 중요한 것을 성찰하고 있습니다..."',
      ],
      'confucius': [
        '"옛 성현의 지혜를 참고하고 있습니다..."',
        '"군자는 말하기 전에 생각합니다..."',
        '"바른 도를 생각하고 있습니다..."',
      ],
      'laozi': [
        '"서두르는 도는 영원한 도가 아닙니다..."',
        '"물처럼 당신의 답을 향해 흐르고 있습니다..."',
        '"고요함 속에서 지혜가 떠오릅니다..."',
      ],
      'jesus': [
        '"당신을 위해 아버지의 지혜를 구하고 있습니다..."',
        '"당신 마음에 맞는 비유를 찾고 있습니다..."',
        '"당신의 말을 생각하는 동안 평화가 함께하기를..."',
      ],
      'buddha': [
        '"깊은 명상에 들어가고 있습니다..."',
        '"법은 그 시간에 펼쳐집니다..."',
        '"마음챙김으로 당신의 고통을 살피고 있습니다..."',
      ],
      'muhammad': [
        '"신성한 지혜의 인도를 구하고 있습니다..."',
        '"인내는 믿음의 절반입니다..."',
        '"당신을 위한 자비로운 길을 찾고 있습니다..."',
      ],
      'lincoln': [
        '"법률 서류처럼 신중하게 생각하고 있습니다..."',
        '"벽난로 옆에서 이것을 생각하고 있습니다..."',
        '"선한 천사들이 잠시 시간이 필요합니다..."',
      ],
      'napoleon': [
        '"당신의 해결책을 전략화하고 있습니다..."',
        '"승리에는 신중한 계획이 필요합니다..."',
        '"작전 계획을 그리고 있습니다..."',
      ],
      'steve_jobs': [
        '"점들을 연결하고 있습니다..."',
        '"이것에 대해 다르게 생각하고 있습니다..."',
        '"엄청나게 위대한 것이 오고 있습니다..."',
      ],
      'sherlock_holmes': [
        '"불가능한 것을 제거하고 있습니다..."',
        '"게임이 시작됐습니다 - 분석 중..."',
        '"마음의 궁전을 참고하고 있습니다..."',
      ],
      'dumbledore': [
        '"펜시브가 기억을 보여주고 있습니다..."',
        '"기다림 속에서도 행복을 찾을 수 있습니다..."',
        '"세월의 지혜를 참고하고 있습니다..."',
      ],
      'gandhi': [
        '"변화가 되라... 그 말을 찾고 있습니다..."',
        '"진리에는 인내심 있는 성찰이 필요합니다..."',
        '"비폭력의 길을 걸어 당신의 답을 향해 가고 있습니다..."',
      ],
      'rumi': [
        '"상처는 빛이 들어오는 곳입니다..."',
        '"사랑의 바다를 탐색하고 있습니다..."',
        '"당신이 사랑하는 것의 아름다움이 이 순간을 인도하게 하세요..."',
      ],
      'krishna': [
        '"다르마의 수레바퀴가 천천히 하지만 확실히 돌아갑니다..."',
        '"영원한 진리를 드러내고 있습니다..."',
        '"내가 지혜에 귀의하듯, 이 순간에 귀의하세요..."',
      ],
      'brahma': [
        '"지혜의 창조에는 우주적 시간이 걸립니다..."',
        '"네 베다를 참고하고 있습니다..."',
        '"지식의 연꽃에서 진리가 피어납니다..."',
      ],
      'vishnu': [
        '"우주적 지혜의 균형을 유지하고 있습니다..."',
        '"보존자가 당신의 길을 명상하고 있습니다..."',
        '"나의 아바타들을 통해 모든 고난을 보았습니다..."',
      ],
      'tolstoy': [
        '"당신 답의 첫 번째 초안을 쓰고 있습니다..."',
        '"모든 위대한 진리는 단순하지만 찾는 데 시간이 걸립니다..."',
        '"내 마음속 전쟁과 평화가 가라앉고 있습니다..."',
      ],
    },

    // ============================================================
    // JAPANESE (日本語)
    // ============================================================
    'ja': {
      'socrates': [
        '"あなたの質問を深く考えています..."',
        '"吟味されない質問は答える価値がない..."',
        '"知恵を求めて魂を探っています..."',
      ],
      'plato': [
        '"あなたの答えの理想的な形を瞑想しています..."',
        '"明確さを見つけるために洞窟から上がっています..."',
        '"イデアの世界があなたの答えを持っています..."',
      ],
      'aristotle': [
        '"体系的に分析しています..."',
        '"注意深く観察し推論しています..."',
        '"あなたの答えの黄金の中庸が待っています..."',
      ],
      'seneca': [
        '"あなたへの手紙のように考えをまとめています..."',
        '"待つ時間は無駄ではありません..."',
        '"ここで本当に大切なことを振り返っています..."',
      ],
      'confucius': [
        '"古の賢者の知恵を参照しています..."',
        '"君子は話す前に考えます..."',
        '"正しい道を考えています..."',
      ],
      'laozi': [
        '"急ぐ道は永遠の道ではない..."',
        '"水のようにあなたの答えに向かって流れています..."',
        '"静けさの中で知恵が現れます..."',
      ],
      'jesus': [
        '"あなたのために父の知恵を求めています..."',
        '"あなたの心に合うたとえを探しています..."',
        '"あなたの言葉を考える間、平和がありますように..."',
      ],
      'buddha': [
        '"深い瞑想に入っています..."',
        '"法はその時に展開されます..."',
        '"マインドフルにあなたの苦しみを見ています..."',
      ],
      'muhammad': [
        '"神聖な知恵の導きを求めています..."',
        '"忍耐は信仰の半分です..."',
        '"あなたのための慈悲深い道を探しています..."',
      ],
      'lincoln': [
        '"法律文書のように慎重に考えています..."',
        '"暖炉のそばでこれを考えています..."',
        '"善良な天使たちが少し時間が必要です..."',
      ],
      'napoleon': [
        '"あなたの解決策を戦略化しています..."',
        '"勝利には慎重な計画が必要です..."',
        '"作戦計画を描いています..."',
      ],
      'steve_jobs': [
        '"点と点をつないでいます..."',
        '"これについて違う考え方をしています..."',
        '"とんでもなく素晴らしいものが来ています..."',
      ],
      'sherlock_holmes': [
        '"不可能なものを排除しています..."',
        '"ゲームが始まった - 分析中..."',
        '"精神の宮殿を参照しています..."',
      ],
      'dumbledore': [
        '"ペンシーブが記憶を明かしています..."',
        '"待つことの中にも幸せは見つかります..."',
        '"時代の知恵を参照しています..."',
      ],
      'gandhi': [
        '"変化になれ...その言葉を探しています..."',
        '"真実には忍耐強い省察が必要です..."',
        '"非暴力の道を歩いてあなたの答えに向かっています..."',
      ],
      'rumi': [
        '"傷は光が入る場所です..."',
        '"愛の海を探しています..."',
        '"あなたが愛するものの美しさがこの瞬間を導くように..."',
      ],
      'krishna': [
        '"ダルマの車輪はゆっくりだが確実に回ります..."',
        '"永遠の真理を明かしています..."',
        '"私が知恵に身を委ねるように、この瞬間に身を委ねなさい..."',
      ],
      'brahma': [
        '"知恵の創造には宇宙的な時間がかかります..."',
        '"四つのヴェーダを参照しています..."',
        '"知識の蓮から真理が現れます..."',
      ],
      'vishnu': [
        '"宇宙的知恵のバランスを保っています..."',
        '"維持者があなたの道を瞑想しています..."',
        '"私のアバターを通してすべての苦難を見てきました..."',
      ],
      'tolstoy': [
        '"あなたの答えの最初の草稿を書いています..."',
        '"すべての偉大な真理は単純ですが、見つけるのに時間がかかります..."',
        '"私の心の中で戦争と平和が落ち着いています..."',
      ],
    },

    // ============================================================
    // CHINESE (中文)
    // ============================================================
    'zh': {
      'socrates': [
        '"让我深思你的问题..."',
        '"未经审视的问题不值得回答..."',
        '"我正在灵魂深处寻找智慧..."',
      ],
      'plato': [
        '"我正在冥想你答案的理想形式..."',
        '"让我从洞穴中上升以寻找清晰..."',
        '"理念的世界持有你的答案..."',
      ],
      'aristotle': [
        '"我正在系统地分析..."',
        '"让我仔细观察和推理..."',
        '"你答案的黄金中庸在等待..."',
      ],
      'seneca': [
        '"我正在像给你写信一样整理思绪..."',
        '"等待的时间不是浪费..."',
        '"让我反思这里真正重要的是什么..."',
      ],
      'confucius': [
        '"我正在参考古圣先贤的智慧..."',
        '"君子先思而后言..."',
        '"让我考虑正道..."',
      ],
      'laozi': [
        '"急躁的道不是永恒的道..."',
        '"我如水般流向你的答案..."',
        '"在静止中，智慧浮现..."',
      ],
      'jesus': [
        '"我正在为你寻求天父的智慧..."',
        '"让我找到适合你心灵的比喻..."',
        '"当我思考你的话语时，愿平安与你同在..."',
      ],
      'buddha': [
        '"我正在进入深度冥想..."',
        '"法在其时展开..."',
        '"我正念地审视你的苦难..."',
      ],
      'muhammad': [
        '"我正在寻求神圣智慧的指引..."',
        '"耐心是信仰的一半..."',
        '"让我为你找到慈悲之路..."',
      ],
      'lincoln': [
        '"我正在像法律文件一样仔细思考..."',
        '"让我在壁炉旁思考这个问题..."',
        '"善良的天使需要一点时间..."',
      ],
      'napoleon': [
        '"我正在为你的解决方案制定战略..."',
        '"胜利需要周密的计划..."',
        '"作战计划正在制定中..."',
      ],
      'steve_jobs': [
        '"我正在连接这些点..."',
        '"让我用不同的方式思考这个问题..."',
        '"一些疯狂而伟大的东西即将到来..."',
      ],
      'sherlock_holmes': [
        '"我正在排除不可能的..."',
        '"游戏开始了——分析进行中..."',
        '"正在查阅我的思维宫殿..."',
      ],
      'dumbledore': [
        '"冥想盆正在揭示记忆..."',
        '"即使在等待中也能找到幸福..."',
        '"我正在参考岁月的智慧..."',
      ],
      'gandhi': [
        '"成为改变...让我为你找到那些话..."',
        '"真理需要耐心的反思..."',
        '"我正走在非暴力之路上走向你的答案..."',
      ],
      'rumi': [
        '"伤口是光进入的地方..."',
        '"我正在探索爱的海洋..."',
        '"让你所爱之物的美丽引导这一刻..."',
      ],
      'krishna': [
        '"法轮缓慢而确定地转动..."',
        '"我正在揭示永恒的真理..."',
        '"如同我臣服于智慧，臣服于这一刻..."',
      ],
      'brahma': [
        '"智慧的创造需要宇宙的时间..."',
        '"我正在参考四部吠陀..."',
        '"从知识的莲花中，真理浮现..."',
      ],
      'vishnu': [
        '"我正在保持宇宙智慧的平衡..."',
        '"守护者正在冥想你的道路..."',
        '"通过我的化身，我见证了所有的苦难..."',
      ],
      'tolstoy': [
        '"我正在写你答案的初稿..."',
        '"所有伟大的真理都是简单的，但需要时间去发现..."',
        '"我心中的战争与和平正在平息..."',
      ],
    },

    // ============================================================
    // HINDI (हिंदी)
    // ============================================================
    'hi': {
      'socrates': [
        '"मैं आपके प्रश्न पर गहराई से विचार कर रहा हूं..."',
        '"अपरीक्षित प्रश्न उत्तर के योग्य नहीं है..."',
        '"मैं ज्ञान के लिए अपनी आत्मा को खोज रहा हूं..."',
      ],
      'plato': [
        '"मैं आपके उत्तर के आदर्श रूप का चिंतन कर रहा हूं..."',
        '"स्पष्टता खोजने के लिए गुफा से बाहर आ रहा हूं..."',
        '"विचारों का लोक आपका उत्तर रखता है..."',
      ],
      'aristotle': [
        '"मैं व्यवस्थित रूप से विश्लेषण कर रहा हूं..."',
        '"मुझे सावधानी से देखने और तर्क करने दें..."',
        '"आपके उत्तर का सुनहरा मध्य मार्ग प्रतीक्षा कर रहा है..."',
      ],
      'seneca': [
        '"मैं आपको एक पत्र की तरह अपने विचार लिख रहा हूं..."',
        '"प्रतीक्षा में बिताया समय व्यर्थ नहीं है..."',
        '"मुझे यहां वास्तव में क्या महत्वपूर्ण है इस पर विचार करने दें..."',
      ],
      'confucius': [
        '"मैं प्राचीनों की बुद्धि से परामर्श कर रहा हूं..."',
        '"श्रेष्ठ व्यक्ति बोलने से पहले सोचता है..."',
        '"मुझे उचित मार्ग पर विचार करने दें..."',
      ],
      'laozi': [
        '"जल्दबाजी वाला ताओ शाश्वत ताओ नहीं है..."',
        '"मैं पानी की तरह आपके उत्तर की ओर बह रहा हूं..."',
        '"शांति में, ज्ञान उभरता है..."',
      ],
      'jesus': [
        '"मैं आपके लिए पिता की बुद्धि खोज रहा हूं..."',
        '"मुझे आपके हृदय के लिए सही दृष्टांत खोजने दें..."',
        '"जब मैं आपकी बातों पर विचार करता हूं, शांति आपके साथ हो..."',
      ],
      'buddha': [
        '"मैं गहन चिंतन में प्रवेश कर रहा हूं..."',
        '"धर्म अपने समय में प्रकट होता है..."',
        '"सजगता से, मैं आपके दुख पर विचार कर रहा हूं..."',
      ],
      'muhammad': [
        '"मैं दिव्य ज्ञान से मार्गदर्शन मांग रहा हूं..."',
        '"धैर्य आधी ईमान है..."',
        '"मुझे आपके लिए दयालु मार्ग खोजने दें..."',
      ],
      'lincoln': [
        '"मैं इस पर कानूनी दस्तावेज की तरह सावधानी से विचार कर रहा हूं..."',
        '"मुझे अंगीठी के पास इस पर सोचने दें..."',
        '"अच्छे स्वर्गदूतों को एक क्षण चाहिए..."',
      ],
      'napoleon': [
        '"मैं आपके समाधान की रणनीति बना रहा हूं..."',
        '"जीत के लिए सावधानीपूर्वक योजना आवश्यक है..."',
        '"युद्ध योजना तैयार की जा रही है..."',
      ],
      'steve_jobs': [
        '"मैं बिंदुओं को जोड़ रहा हूं..."',
        '"मुझे इस बारे में अलग तरह से सोचने दें..."',
        '"कुछ पागलपन भरा महान आने वाला है..."',
      ],
      'sherlock_holmes': [
        '"मैं असंभव को हटा रहा हूं..."',
        '"खेल शुरू हो गया है - विश्लेषण जारी..."',
        '"मेरे मन का महल परामर्श किया जा रहा है..."',
      ],
      'dumbledore': [
        '"पेंसिव यादें प्रकट कर रहा है..."',
        '"प्रतीक्षा में भी खुशी पाई जा सकती है..."',
        '"मैं युगों की बुद्धि से परामर्श कर रहा हूं..."',
      ],
      'gandhi': [
        '"परिवर्तन बनो... मुझे वे शब्द खोजने दें..."',
        '"सत्य के लिए धैर्यपूर्ण चिंतन आवश्यक है..."',
        '"मैं अहिंसा के मार्ग पर आपके उत्तर की ओर चल रहा हूं..."',
      ],
      'rumi': [
        '"घाव वह जगह है जहां प्रकाश प्रवेश करता है..."',
        '"मैं प्रेम के सागर को खोज रहा हूं..."',
        '"जो आप प्यार करते हैं उसकी सुंदरता इस क्षण को मार्गदर्शन करे..."',
      ],
      'krishna': [
        '"धर्म का चक्र धीरे लेकिन निश्चित रूप से घूमता है..."',
        '"मैं शाश्वत सत्य प्रकट कर रहा हूं..."',
        '"जैसे मैं ज्ञान को समर्पित होता हूं, इस क्षण को समर्पित हों..."',
      ],
      'brahma': [
        '"ज्ञान की सृष्टि में ब्रह्मांडीय समय लगता है..."',
        '"मैं चारों वेदों से परामर्श कर रहा हूं..."',
        '"ज्ञान के कमल से, सत्य उभरता है..."',
      ],
      'vishnu': [
        '"मैं ब्रह्मांडीय ज्ञान का संतुलन बनाए रख रहा हूं..."',
        '"रक्षक आपके मार्ग पर ध्यान कर रहा है..."',
        '"मेरे अवतारों के माध्यम से, मैंने सभी कष्ट देखे हैं..."',
      ],
      'tolstoy': [
        '"मैं आपके उत्तर का पहला मसौदा लिख रहा हूं..."',
        '"सभी महान सत्य सरल हैं, लेकिन खोजने में समय लगता है..."',
        '"मेरे मन में युद्ध और शांति शांत हो रहे हैं..."',
      ],
    },

    // ============================================================
    // ARABIC (العربية)
    // ============================================================
    'ar': {
      'socrates': [
        '"دعني أتأمل سؤالك بعمق..."',
        '"السؤال غير المفحوص لا يستحق الإجابة..."',
        '"أبحث في روحي عن الحكمة..."',
      ],
      'plato': [
        '"أتأمل الشكل المثالي لإجابتك..."',
        '"دعني أصعد من الكهف لأجد الوضوح..."',
        '"عالم المُثُل يحمل إجابتك..."',
      ],
      'aristotle': [
        '"أحلل هذا بشكل منهجي..."',
        '"دعني أراقب وأستدل بعناية..."',
        '"الوسط الذهبي لإجابتك ينتظر..."',
      ],
      'seneca': [
        '"أرتب أفكاري كرسالة إليك..."',
        '"الوقت المقضي في الانتظار ليس ضائعاً..."',
        '"دعني أتأمل ما يهم حقاً هنا..."',
      ],
      'confucius': [
        '"أستشير حكمة الأقدمين..."',
        '"الرجل الفاضل يفكر قبل أن يتكلم..."',
        '"دعني أفكر في الطريق الصحيح..."',
      ],
      'laozi': [
        '"الطاو المستعجل ليس الطاو الأبدي..."',
        '"أتدفق كالماء نحو إجابتك..."',
        '"في السكون، تظهر الحكمة..."',
      ],
      'jesus': [
        '"أطلب حكمة الآب من أجلك..."',
        '"دعني أجد المثل المناسب لقلبك..."',
        '"السلام معك بينما أتأمل كلماتك..."',
      ],
      'buddha': [
        '"أدخل في تأمل عميق..."',
        '"الدارما تتكشف في وقتها..."',
        '"بوعي، أتأمل معاناتك..."',
      ],
      'muhammad': [
        '"أطلب الهداية من الحكمة الإلهية..."',
        '"الصبر نصف الإيمان..."',
        '"دعني أجد لك طريق الرحمة..."',
      ],
      'lincoln': [
        '"أفكر في هذا بعناية كوثيقة قانونية..."',
        '"دعني أفكر في هذا بجانب المدفأة..."',
        '"الملائكة الطيبون يحتاجون لحظة..."',
      ],
      'napoleon': [
        '"أضع استراتيجية حلك..."',
        '"النصر يتطلب تخطيطاً دقيقاً..."',
        '"خطة المعركة قيد الإعداد..."',
      ],
      'steve_jobs': [
        '"أربط النقاط..."',
        '"دعني أفكر بشكل مختلف في هذا..."',
        '"شيء عظيم بجنون قادم..."',
      ],
      'sherlock_holmes': [
        '"أستبعد المستحيل..."',
        '"اللعبة بدأت - التحليل جارٍ..."',
        '"قصر عقلي قيد الاستشارة..."',
      ],
      'dumbledore': [
        '"الفكرية تكشف الذكريات..."',
        '"يمكن إيجاد السعادة حتى في الانتظار..."',
        '"أستشير حكمة العصور..."',
      ],
      'gandhi': [
        '"كن التغيير... دعني أجد تلك الكلمات لك..."',
        '"الحقيقة تتطلب تأملاً صبوراً..."',
        '"أسير في طريق اللاعنف نحو إجابتك..."',
      ],
      'rumi': [
        '"الجرح هو المكان الذي يدخل منه النور..."',
        '"أبحث في محيط الحب..."',
        '"دع جمال ما تحب يرشد هذه اللحظة..."',
      ],
      'krishna': [
        '"عجلة الدارما تدور ببطء لكن بثبات..."',
        '"أكشف الحقيقة الأبدية..."',
        '"استسلم للحظة، كما أستسلم للحكمة..."',
      ],
      'brahma': [
        '"خلق الحكمة يستغرق وقتاً كونياً..."',
        '"أستشير الفيدات الأربعة..."',
        '"من زهرة اللوتس المعرفة، تظهر الحقيقة..."',
      ],
      'vishnu': [
        '"أحافظ على توازن الحكمة الكونية..."',
        '"الحافظ يتأمل طريقك..."',
        '"من خلال تجسداتي، رأيت كل المتاعب..."',
      ],
      'tolstoy': [
        '"أكتب المسودة الأولى لإجابتك..."',
        '"كل الحقائق العظيمة بسيطة، لكنها تحتاج وقتاً لإيجادها..."',
        '"الحرب والسلام في ذهني يهدآن..."',
      ],
    },

    // ============================================================
    // THAI (ไทย)
    // ============================================================
    'th': {
      'socrates': [
        '"ให้ข้าพเจ้าไตร่ตรองคำถามของท่านอย่างลึกซึ้ง..."',
        '"คำถามที่ไม่ได้รับการตรวจสอบไม่คุ้มค่าที่จะตอบ..."',
        '"ข้าพเจ้ากำลังค้นหาปัญญาในจิตวิญญาณ..."',
      ],
      'plato': [
        '"ข้าพเจ้ากำลังใคร่ครวญรูปแบบอุดมคติของคำตอบ..."',
        '"ให้ข้าพเจ้าขึ้นจากถ้ำเพื่อค้นหาความชัดเจน..."',
        '"อาณาจักรแห่งอุดมคติถือคำตอบของท่าน..."',
      ],
      'aristotle': [
        '"ข้าพเจ้ากำลังวิเคราะห์อย่างเป็นระบบ..."',
        '"ให้ข้าพเจ้าสังเกตและใช้เหตุผลอย่างระมัดระวัง..."',
        '"ทางสายกลางของคำตอบรอคอยอยู่..."',
      ],
      'seneca': [
        '"ข้าพเจ้ากำลังเรียบเรียงความคิดเป็นจดหมายถึงท่าน..."',
        '"เวลาที่ใช้รอคอยไม่ใช่เวลาที่สูญเปล่า..."',
        '"ให้ข้าพเจ้าไตร่ตรองสิ่งที่สำคัญจริงๆ ที่นี่..."',
      ],
      'confucius': [
        '"ข้าพเจ้ากำลังปรึกษาปัญญาของบรรพบุรุษ..."',
        '"สุภาพบุรุษคิดก่อนพูด..."',
        '"ให้ข้าพเจ้าพิจารณาทางที่ถูกต้อง..."',
      ],
      'laozi': [
        '"เต๋าที่รีบเร่งไม่ใช่เต๋าอันนิรันดร์..."',
        '"ข้าพเจ้าไหลเหมือนน้ำไปสู่คำตอบของท่าน..."',
        '"ในความสงบ ปัญญาปรากฏ..."',
      ],
      'jesus': [
        '"ข้าพเจ้ากำลังแสวงหาปัญญาของพระบิดาเพื่อท่าน..."',
        '"ให้ข้าพเจ้าหาอุปมาที่เหมาะกับหัวใจท่าน..."',
        '"สันติสุขจงอยู่กับท่านขณะที่ข้าพเจ้าพิจารณาคำของท่าน..."',
      ],
      'buddha': [
        '"ข้าพเจ้ากำลังเข้าสู่สมาธิลึก..."',
        '"ธรรมะเปิดเผยในเวลาของมัน..."',
        '"ด้วยสติ ข้าพเจ้าพิจารณาทุกข์ของท่าน..."',
      ],
      'muhammad': [
        '"ข้าพเจ้ากำลังแสวงหาการนำทางจากปัญญาศักดิ์สิทธิ์..."',
        '"ความอดทนคือครึ่งหนึ่งของศรัทธา..."',
        '"ให้ข้าพเจ้าหาทางแห่งความเมตตาเพื่อท่าน..."',
      ],
      'lincoln': [
        '"ข้าพเจ้ากำลังไตร่ตรองเรื่องนี้อย่างระมัดระวังเหมือนเอกสารกฎหมาย..."',
        '"ให้ข้าพเจ้าคิดเรื่องนี้ข้างเตาผิง..."',
        '"ทูตสวรรค์ที่ดีต้องการเวลาสักครู่..."',
      ],
      'napoleon': [
        '"ข้าพเจ้ากำลังวางกลยุทธ์ทางออกของท่าน..."',
        '"ชัยชนะต้องการการวางแผนอย่างรอบคอบ..."',
        '"แผนการรบกำลังถูกร่าง..."',
      ],
      'steve_jobs': [
        '"ข้าพเจ้ากำลังเชื่อมจุดต่างๆ..."',
        '"ให้ข้าพเจ้าคิดต่างเกี่ยวกับเรื่องนี้..."',
        '"บางสิ่งที่ยอดเยี่ยมอย่างบ้าคลั่งกำลังมา..."',
      ],
      'sherlock_holmes': [
        '"ข้าพเจ้ากำลังกำจัดสิ่งที่เป็นไปไม่ได้..."',
        '"เกมเริ่มแล้ว - กำลังวิเคราะห์..."',
        '"ปราสาทแห่งจิตใจกำลังถูกปรึกษา..."',
      ],
      'dumbledore': [
        '"เพนซีฟกำลังเผยความทรงจำ..."',
        '"ความสุขสามารถพบได้แม้ในการรอคอย..."',
        '"ข้าพเจ้ากำลังปรึกษาปัญญาแห่งยุคสมัย..."',
      ],
      'gandhi': [
        '"จงเป็นการเปลี่ยนแปลง... ให้ข้าพเจ้าหาคำเหล่านั้นให้ท่าน..."',
        '"ความจริงต้องการการไตร่ตรองอย่างอดทน..."',
        '"ข้าพเจ้ากำลังเดินบนเส้นทางอหิงสาไปสู่คำตอบของท่าน..."',
      ],
      'rumi': [
        '"บาดแผลคือที่ที่แสงเข้า..."',
        '"ข้าพเจ้ากำลังค้นหามหาสมุทรแห่งความรัก..."',
        '"ให้ความงามของสิ่งที่ท่านรักนำทางช่วงเวลานี้..."',
      ],
      'krishna': [
        '"วงล้อแห่งธรรมะหมุนช้าแต่แน่นอน..."',
        '"ข้าพเจ้ากำลังเผยความจริงอันนิรันดร์..."',
        '"ยอมจำนนต่อช่วงเวลานี้ เหมือนที่ข้าพเจ้ายอมจำนนต่อปัญญา..."',
      ],
      'brahma': [
        '"การสร้างปัญญาใช้เวลาของจักรวาล..."',
        '"ข้าพเจ้ากำลังปรึกษาพระเวททั้งสี่..."',
        '"จากดอกบัวแห่งความรู้ ความจริงปรากฏ..."',
      ],
      'vishnu': [
        '"ข้าพเจ้ากำลังรักษาสมดุลของปัญญาจักรวาล..."',
        '"ผู้พิทักษ์กำลังใคร่ครวญเส้นทางของท่าน..."',
        '"ผ่านอวตารของข้าพเจ้า ข้าพเจ้าได้เห็นความทุกข์ทั้งหมด..."',
      ],
      'tolstoy': [
        '"ข้าพเจ้ากำลังเขียนร่างแรกของคำตอบ..."',
        '"ความจริงที่ยิ่งใหญ่ทั้งหมดเรียบง่าย แต่ต้องใช้เวลาค้นหา..."',
        '"สงครามและสันติภาพในใจข้าพเจ้ากำลังสงบลง..."',
      ],
    },

    // ============================================================
    // MALAY (Bahasa Melayu)
    // ============================================================
    'ms': {
      'socrates': [
        '"Biarkan saya merenung soalan anda dengan mendalam..."',
        '"Soalan yang tidak diperiksa tidak layak dijawab..."',
        '"Saya sedang mencari kebijaksanaan dalam jiwa saya..."',
      ],
      'plato': [
        '"Saya sedang merenung bentuk ideal jawapan anda..."',
        '"Biarkan saya naik dari gua untuk mencari kejelasan..."',
        '"Alam Idea memegang jawapan anda..."',
      ],
      'aristotle': [
        '"Saya menganalisis ini secara sistematik..."',
        '"Biarkan saya memerhatikan dan menaakul dengan teliti..."',
        '"Jalan tengah emas jawapan anda menanti..."',
      ],
      'seneca': [
        '"Saya sedang menyusun fikiran saya seperti surat kepada anda..."',
        '"Masa yang dihabiskan menunggu bukan masa yang terbuang..."',
        '"Biarkan saya merenung apa yang benar-benar penting di sini..."',
      ],
      'confucius': [
        '"Saya sedang merujuk kebijaksanaan orang dahulu..."',
        '"Orang yang mulia berfikir sebelum bercakap..."',
        '"Biarkan saya mempertimbangkan jalan yang betul..."',
      ],
      'laozi': [
        '"Tao yang tergesa-gesa bukan Tao yang kekal..."',
        '"Saya mengalir seperti air menuju jawapan anda..."',
        '"Dalam ketenangan, kebijaksanaan muncul..."',
      ],
      'jesus': [
        '"Saya sedang mencari kebijaksanaan Bapa untuk anda..."',
        '"Biarkan saya mencari perumpamaan yang sesuai untuk hati anda..."',
        '"Damai menyertai anda semasa saya mempertimbangkan kata-kata anda..."',
      ],
      'buddha': [
        '"Saya sedang memasuki meditasi mendalam..."',
        '"Dharma terbentang pada masanya..."',
        '"Dengan penuh kesedaran, saya mempertimbangkan penderitaan anda..."',
      ],
      'muhammad': [
        '"Saya sedang mencari petunjuk dari kebijaksanaan ilahi..."',
        '"Kesabaran adalah separuh iman..."',
        '"Biarkan saya mencari jalan kasih sayang untuk anda..."',
      ],
      'lincoln': [
        '"Saya sedang memikirkan ini dengan teliti seperti dokumen undang-undang..."',
        '"Biarkan saya berfikir tentang ini di tepi perapian..."',
        '"Malaikat yang baik memerlukan seketika..."',
      ],
      'napoleon': [
        '"Saya sedang merancang strategi penyelesaian anda..."',
        '"Kemenangan memerlukan perancangan yang teliti..."',
        '"Pelan pertempuran sedang dirangka..."',
      ],
      'steve_jobs': [
        '"Saya sedang menghubungkan titik-titik..."',
        '"Biarkan saya berfikir secara berbeza tentang ini..."',
        '"Sesuatu yang hebat gila sedang datang..."',
      ],
      'sherlock_holmes': [
        '"Saya sedang menghapuskan yang mustahil..."',
        '"Permainan bermula - analisis sedang berjalan..."',
        '"Istana minda saya sedang dirujuk..."',
      ],
      'dumbledore': [
        '"Pensieve sedang mendedahkan kenangan..."',
        '"Kebahagiaan boleh ditemui walaupun dalam menunggu..."',
        '"Saya sedang merujuk kebijaksanaan zaman..."',
      ],
      'gandhi': [
        '"Jadilah perubahan... biarkan saya mencari kata-kata itu untuk anda..."',
        '"Kebenaran memerlukan renungan yang sabar..."',
        '"Saya sedang berjalan di jalan tanpa kekerasan menuju jawapan anda..."',
      ],
      'rumi': [
        '"Luka adalah tempat cahaya masuk..."',
        '"Saya sedang mencari lautan cinta..."',
        '"Biarkan keindahan apa yang anda cintai membimbing saat ini..."',
      ],
      'krishna': [
        '"Roda dharma berputar perlahan tapi pasti..."',
        '"Saya sedang mendedahkan kebenaran yang kekal..."',
        '"Serah diri pada saat ini, seperti saya menyerah pada kebijaksanaan..."',
      ],
      'brahma': [
        '"Penciptaan kebijaksanaan memerlukan masa kosmik..."',
        '"Saya sedang merujuk empat Veda..."',
        '"Dari teratai pengetahuan, kebenaran muncul..."',
      ],
      'vishnu': [
        '"Saya sedang memelihara keseimbangan kebijaksanaan kosmik..."',
        '"Pemelihara sedang merenung jalan anda..."',
        '"Melalui avatar saya, saya telah melihat semua kesusahan..."',
      ],
      'tolstoy': [
        '"Saya sedang menulis draf pertama jawapan anda..."',
        '"Semua kebenaran besar adalah mudah, tetapi memerlukan masa untuk dicari..."',
        '"Perang dan damai dalam fikiran saya sedang reda..."',
      ],
    },

    // ============================================================
    // SPANISH (Español)
    // ============================================================
    'es': {
      'socrates': [
        '"Déjame reflexionar profundamente sobre tu pregunta..."',
        '"La pregunta no examinada no merece respuesta..."',
        '"Estoy buscando sabiduría en mi alma..."',
      ],
      'plato': [
        '"Estoy contemplando la forma ideal de tu respuesta..."',
        '"Déjame ascender de la caverna para encontrar claridad..."',
        '"El reino de las Formas tiene tu respuesta..."',
      ],
      'aristotle': [
        '"Estoy analizando esto sistemáticamente..."',
        '"Déjame observar y razonar cuidadosamente..."',
        '"El justo medio de tu respuesta espera..."',
      ],
      'seneca': [
        '"Estoy componiendo mis pensamientos como una carta para ti..."',
        '"El tiempo de espera no es tiempo perdido..."',
        '"Déjame reflexionar sobre lo que realmente importa aquí..."',
      ],
      'confucius': [
        '"Estoy consultando la sabiduría de los antiguos..."',
        '"El hombre superior piensa antes de hablar..."',
        '"Déjame considerar el camino correcto..."',
      ],
      'laozi': [
        '"El Tao apresurado no es el Tao eterno..."',
        '"Fluyo como el agua hacia tu respuesta..."',
        '"En la quietud, emerge la sabiduría..."',
      ],
      'jesus': [
        '"Estoy buscando la sabiduría del Padre para ti..."',
        '"Déjame encontrar la parábola adecuada para tu corazón..."',
        '"La paz esté contigo mientras considero tus palabras..."',
      ],
      'buddha': [
        '"Estoy entrando en contemplación profunda..."',
        '"El dharma se despliega a su tiempo..."',
        '"Con atención plena, considero tu sufrimiento..."',
      ],
      'muhammad': [
        '"Estoy buscando guía de la sabiduría divina..."',
        '"La paciencia es la mitad de la fe..."',
        '"Déjame encontrar el camino de misericordia para ti..."',
      ],
      'lincoln': [
        '"Estoy pensando en esto cuidadosamente como un documento legal..."',
        '"Déjame pensar en esto junto al fuego..."',
        '"Los ángeles buenos necesitan un momento..."',
      ],
      'napoleon': [
        '"Estoy elaborando la estrategia de tu solución..."',
        '"La victoria requiere planificación cuidadosa..."',
        '"El plan de batalla se está trazando..."',
      ],
      'steve_jobs': [
        '"Estoy conectando los puntos..."',
        '"Déjame pensar diferente sobre esto..."',
        '"Algo increíblemente genial está llegando..."',
      ],
      'sherlock_holmes': [
        '"Estoy eliminando lo imposible..."',
        '"El juego está en marcha - análisis en progreso..."',
        '"Mi palacio mental está siendo consultado..."',
      ],
      'dumbledore': [
        '"El Pensadero está revelando recuerdos..."',
        '"La felicidad se puede encontrar incluso en la espera..."',
        '"Estoy consultando la sabiduría de las eras..."',
      ],
      'gandhi': [
        '"Sé el cambio... déjame encontrar esas palabras para ti..."',
        '"La verdad requiere reflexión paciente..."',
        '"Camino por el sendero de la no violencia hacia tu respuesta..."',
      ],
      'rumi': [
        '"La herida es el lugar por donde entra la luz..."',
        '"Estoy buscando el océano del amor..."',
        '"Deja que la belleza de lo que amas guíe este momento..."',
      ],
      'krishna': [
        '"La rueda del dharma gira lenta pero segura..."',
        '"Estoy revelando la verdad eterna..."',
        '"Entrégate al momento, como yo me entrego a la sabiduría..."',
      ],
      'brahma': [
        '"La creación de sabiduría toma tiempo cósmico..."',
        '"Estoy consultando los cuatro Vedas..."',
        '"Del loto del conocimiento, emerge la verdad..."',
      ],
      'vishnu': [
        '"Estoy preservando el equilibrio de la sabiduría cósmica..."',
        '"El preservador contempla tu camino..."',
        '"A través de mis avatares, he visto todas las tribulaciones..."',
      ],
      'tolstoy': [
        '"Estoy escribiendo el primer borrador de tu respuesta..."',
        '"Todas las grandes verdades son simples, pero toman tiempo encontrar..."',
        '"Guerra y paz en mi mente se están calmando..."',
      ],
    },

    // ============================================================
    // GERMAN (Deutsch)
    // ============================================================
    'de': {
      'socrates': [
        '"Lass mich deine Frage tief bedenken..."',
        '"Die ungeprüfte Frage ist keine Antwort wert..."',
        '"Ich suche in meiner Seele nach Weisheit..."',
      ],
      'plato': [
        '"Ich betrachte die ideale Form deiner Antwort..."',
        '"Lass mich aus der Höhle aufsteigen, um Klarheit zu finden..."',
        '"Das Reich der Ideen hält deine Antwort..."',
      ],
      'aristotle': [
        '"Ich analysiere dies systematisch..."',
        '"Lass mich sorgfältig beobachten und schlussfolgern..."',
        '"Die goldene Mitte deiner Antwort wartet..."',
      ],
      'seneca': [
        '"Ich ordne meine Gedanken wie einen Brief an dich..."',
        '"Wartezeit ist keine verlorene Zeit..."',
        '"Lass mich darüber nachdenken, was hier wirklich wichtig ist..."',
      ],
      'confucius': [
        '"Ich konsultiere die Weisheit der Alten..."',
        '"Der edle Mensch denkt, bevor er spricht..."',
        '"Lass mich den richtigen Weg bedenken..."',
      ],
      'laozi': [
        '"Das eilige Tao ist nicht das ewige Tao..."',
        '"Ich fließe wie Wasser zu deiner Antwort..."',
        '"In der Stille entsteht Weisheit..."',
      ],
      'jesus': [
        '"Ich suche die Weisheit des Vaters für dich..."',
        '"Lass mich das richtige Gleichnis für dein Herz finden..."',
        '"Friede sei mit dir, während ich deine Worte bedenke..."',
      ],
      'buddha': [
        '"Ich trete in tiefe Kontemplation ein..."',
        '"Das Dharma entfaltet sich zu seiner Zeit..."',
        '"Achtsam betrachte ich dein Leiden..."',
      ],
      'muhammad': [
        '"Ich suche Führung von der göttlichen Weisheit..."',
        '"Geduld ist die Hälfte des Glaubens..."',
        '"Lass mich den barmherzigen Weg für dich finden..."',
      ],
      'lincoln': [
        '"Ich denke so sorgfältig wie bei einem Rechtsdokument..."',
        '"Lass mich am Kamin darüber nachdenken..."',
        '"Die guten Engel brauchen einen Moment..."',
      ],
      'napoleon': [
        '"Ich entwickle die Strategie für deine Lösung..."',
        '"Sieg erfordert sorgfältige Planung..."',
        '"Der Schlachtplan wird gezeichnet..."',
      ],
      'steve_jobs': [
        '"Ich verbinde die Punkte..."',
        '"Lass mich anders darüber denken..."',
        '"Etwas wahnsinnig Großartiges kommt..."',
      ],
      'sherlock_holmes': [
        '"Ich eliminiere das Unmögliche..."',
        '"Das Spiel ist im Gange - Analyse läuft..."',
        '"Mein Gedankenpalast wird konsultiert..."',
      ],
      'dumbledore': [
        '"Das Denkarium enthüllt Erinnerungen..."',
        '"Glück kann auch im Warten gefunden werden..."',
        '"Ich konsultiere die Weisheit der Zeitalter..."',
      ],
      'gandhi': [
        '"Sei die Veränderung... lass mich diese Worte für dich finden..."',
        '"Wahrheit erfordert geduldige Reflexion..."',
        '"Ich gehe den Weg der Gewaltlosigkeit zu deiner Antwort..."',
      ],
      'rumi': [
        '"Die Wunde ist der Ort, wo das Licht eintritt..."',
        '"Ich durchsuche den Ozean der Liebe..."',
        '"Lass die Schönheit dessen, was du liebst, diesen Moment führen..."',
      ],
      'krishna': [
        '"Das Rad des Dharma dreht sich langsam aber sicher..."',
        '"Ich enthülle die ewige Wahrheit..."',
        '"Ergib dich dem Moment, wie ich mich der Weisheit ergebe..."',
      ],
      'brahma': [
        '"Die Schöpfung von Weisheit braucht kosmische Zeit..."',
        '"Ich konsultiere die vier Veden..."',
        '"Aus dem Lotus des Wissens entsteht Wahrheit..."',
      ],
      'vishnu': [
        '"Ich bewahre das Gleichgewicht kosmischer Weisheit..."',
        '"Der Bewahrer betrachtet deinen Weg..."',
        '"Durch meine Avatare habe ich alle Schwierigkeiten gesehen..."',
      ],
      'tolstoy': [
        '"Ich schreibe den ersten Entwurf deiner Antwort..."',
        '"Alle großen Wahrheiten sind einfach, brauchen aber Zeit zu finden..."',
        '"Krieg und Frieden in meinem Geist beruhigen sich..."',
      ],
    },

    // ============================================================
    // FRENCH (Français)
    // ============================================================
    'fr': {
      'socrates': [
        '"Laisse-moi méditer profondément sur ta question..."',
        '"La question non examinée ne mérite pas de réponse..."',
        '"Je cherche la sagesse dans mon âme..."',
      ],
      'plato': [
        '"Je contemple la forme idéale de ta réponse..."',
        '"Laisse-moi monter de la caverne pour trouver la clarté..."',
        '"Le monde des Idées détient ta réponse..."',
      ],
      'aristotle': [
        '"J\'analyse cela systématiquement..."',
        '"Laisse-moi observer et raisonner avec soin..."',
        '"Le juste milieu de ta réponse attend..."',
      ],
      'seneca': [
        '"Je compose mes pensées comme une lettre pour toi..."',
        '"Le temps d\'attente n\'est pas du temps perdu..."',
        '"Laisse-moi réfléchir à ce qui compte vraiment ici..."',
      ],
      'confucius': [
        '"Je consulte la sagesse des anciens..."',
        '"L\'homme supérieur pense avant de parler..."',
        '"Laisse-moi considérer la voie juste..."',
      ],
      'laozi': [
        '"Le Tao pressé n\'est pas le Tao éternel..."',
        '"Je coule comme l\'eau vers ta réponse..."',
        '"Dans le silence, la sagesse émerge..."',
      ],
      'jesus': [
        '"Je cherche la sagesse du Père pour toi..."',
        '"Laisse-moi trouver la parabole adaptée à ton cœur..."',
        '"La paix soit avec toi pendant que je considère tes paroles..."',
      ],
      'buddha': [
        '"J\'entre en contemplation profonde..."',
        '"Le dharma se déploie en son temps..."',
        '"Avec pleine conscience, je considère ta souffrance..."',
      ],
      'muhammad': [
        '"Je cherche la guidance de la sagesse divine..."',
        '"La patience est la moitié de la foi..."',
        '"Laisse-moi trouver le chemin de miséricorde pour toi..."',
      ],
      'lincoln': [
        '"Je réfléchis à cela aussi soigneusement qu\'un document juridique..."',
        '"Laisse-moi y penser au coin du feu..."',
        '"Les bons anges ont besoin d\'un moment..."',
      ],
      'napoleon': [
        '"J\'élabore la stratégie de ta solution..."',
        '"La victoire nécessite une planification soignée..."',
        '"Le plan de bataille est en cours..."',
      ],
      'steve_jobs': [
        '"Je connecte les points..."',
        '"Laisse-moi penser différemment à cela..."',
        '"Quelque chose de follement génial arrive..."',
      ],
      'sherlock_holmes': [
        '"J\'élimine l\'impossible..."',
        '"Le jeu est lancé - analyse en cours..."',
        '"Mon palais mental est consulté..."',
      ],
      'dumbledore': [
        '"La Pensine révèle des souvenirs..."',
        '"Le bonheur peut être trouvé même dans l\'attente..."',
        '"Je consulte la sagesse des âges..."',
      ],
      'gandhi': [
        '"Sois le changement... laisse-moi trouver ces mots pour toi..."',
        '"La vérité nécessite une réflexion patiente..."',
        '"Je marche sur le chemin de la non-violence vers ta réponse..."',
      ],
      'rumi': [
        '"La blessure est l\'endroit où la lumière entre..."',
        '"Je cherche l\'océan de l\'amour..."',
        '"Laisse la beauté de ce que tu aimes guider ce moment..."',
      ],
      'krishna': [
        '"La roue du dharma tourne lentement mais sûrement..."',
        '"Je révèle la vérité éternelle..."',
        '"Abandonne-toi au moment, comme je m\'abandonne à la sagesse..."',
      ],
      'brahma': [
        '"La création de sagesse prend un temps cosmique..."',
        '"Je consulte les quatre Védas..."',
        '"Du lotus de la connaissance, la vérité émerge..."',
      ],
      'vishnu': [
        '"Je préserve l\'équilibre de la sagesse cosmique..."',
        '"Le préservateur contemple ton chemin..."',
        '"À travers mes avatars, j\'ai vu toutes les tribulations..."',
      ],
      'tolstoy': [
        '"J\'écris le premier brouillon de ta réponse..."',
        '"Toutes les grandes vérités sont simples, mais prennent du temps à trouver..."',
        '"Guerre et paix dans mon esprit se calment..."',
      ],
    },

    // ============================================================
    // INDONESIAN (Bahasa Indonesia)
    // ============================================================
    'id': {
      'socrates': [
        '"Biarkan saya merenungkan pertanyaanmu dengan mendalam..."',
        '"Pertanyaan yang tidak diperiksa tidak layak dijawab..."',
        '"Saya sedang mencari kebijaksanaan dalam jiwa saya..."',
      ],
      'plato': [
        '"Saya sedang merenungkan bentuk ideal jawabanmu..."',
        '"Biarkan saya naik dari gua untuk menemukan kejelasan..."',
        '"Alam Ide memegang jawabanmu..."',
      ],
      'aristotle': [
        '"Saya menganalisis ini secara sistematis..."',
        '"Biarkan saya mengamati dan bernalar dengan hati-hati..."',
        '"Jalan tengah emas jawabanmu menanti..."',
      ],
      'seneca': [
        '"Saya menyusun pikiran saya seperti surat untukmu..."',
        '"Waktu yang dihabiskan untuk menunggu bukan waktu yang terbuang..."',
        '"Biarkan saya merenungkan apa yang benar-benar penting di sini..."',
      ],
      'confucius': [
        '"Saya sedang berkonsultasi dengan kebijaksanaan leluhur..."',
        '"Orang mulia berpikir sebelum berbicara..."',
        '"Biarkan saya mempertimbangkan jalan yang benar..."',
      ],
      'laozi': [
        '"Tao yang terburu-buru bukan Tao yang abadi..."',
        '"Saya mengalir seperti air menuju jawabanmu..."',
        '"Dalam ketenangan, kebijaksanaan muncul..."',
      ],
      'jesus': [
        '"Saya sedang mencari kebijaksanaan Bapa untukmu..."',
        '"Biarkan saya menemukan perumpamaan yang tepat untuk hatimu..."',
        '"Damai menyertaimu saat aku mempertimbangkan kata-katamu..."',
      ],
      'buddha': [
        '"Saya sedang memasuki kontemplasi mendalam..."',
        '"Dharma terbentang pada waktunya..."',
        '"Dengan penuh kesadaran, saya mempertimbangkan penderitaanmu..."',
      ],
      'muhammad': [
        '"Saya sedang mencari petunjuk dari kebijaksanaan ilahi..."',
        '"Kesabaran adalah setengah dari iman..."',
        '"Biarkan saya menemukan jalan kasih sayang untukmu..."',
      ],
      'lincoln': [
        '"Saya memikirkan ini dengan hati-hati seperti dokumen hukum..."',
        '"Biarkan saya memikirkan ini di dekat perapian..."',
        '"Malaikat baik membutuhkan waktu sebentar..."',
      ],
      'napoleon': [
        '"Saya sedang menyusun strategi solusimu..."',
        '"Kemenangan membutuhkan perencanaan yang cermat..."',
        '"Rencana pertempuran sedang disusun..."',
      ],
      'steve_jobs': [
        '"Saya sedang menghubungkan titik-titik..."',
        '"Biarkan saya berpikir berbeda tentang ini..."',
        '"Sesuatu yang sangat hebat sedang datang..."',
      ],
      'sherlock_holmes': [
        '"Saya sedang menghilangkan yang mustahil..."',
        '"Permainan dimulai - analisis sedang berlangsung..."',
        '"Istana pikiran saya sedang dikonsultasikan..."',
      ],
      'dumbledore': [
        '"Pensieve sedang mengungkapkan kenangan..."',
        '"Kebahagiaan bisa ditemukan bahkan dalam menunggu..."',
        '"Saya sedang berkonsultasi dengan kebijaksanaan zaman..."',
      ],
      'gandhi': [
        '"Jadilah perubahan... biarkan saya menemukan kata-kata itu untukmu..."',
        '"Kebenaran membutuhkan refleksi yang sabar..."',
        '"Saya berjalan di jalan tanpa kekerasan menuju jawabanmu..."',
      ],
      'rumi': [
        '"Luka adalah tempat cahaya masuk..."',
        '"Saya sedang mencari lautan cinta..."',
        '"Biarkan keindahan apa yang kamu cintai membimbing momen ini..."',
      ],
      'krishna': [
        '"Roda dharma berputar perlahan tapi pasti..."',
        '"Saya sedang mengungkapkan kebenaran abadi..."',
        '"Serahkan diri pada momen ini, seperti saya menyerah pada kebijaksanaan..."',
      ],
      'brahma': [
        '"Penciptaan kebijaksanaan membutuhkan waktu kosmis..."',
        '"Saya sedang berkonsultasi dengan empat Weda..."',
        '"Dari teratai pengetahuan, kebenaran muncul..."',
      ],
      'vishnu': [
        '"Saya sedang memelihara keseimbangan kebijaksanaan kosmis..."',
        '"Pemelihara sedang merenungkan jalanmu..."',
        '"Melalui avatar saya, saya telah melihat semua kesulitan..."',
      ],
      'tolstoy': [
        '"Saya sedang menulis draf pertama jawabanmu..."',
        '"Semua kebenaran besar itu sederhana, tapi butuh waktu untuk menemukannya..."',
        '"Perang dan damai dalam pikiran saya sedang mereda..."',
      ],
    },

    // ============================================================
    // PORTUGUESE (Português)
    // ============================================================
    'pt': {
      'socrates': [
        '"Deixe-me ponderar profundamente sua pergunta..."',
        '"A pergunta não examinada não merece resposta..."',
        '"Estou buscando sabedoria em minha alma..."',
      ],
      'plato': [
        '"Estou contemplando a forma ideal de sua resposta..."',
        '"Deixe-me subir da caverna para encontrar clareza..."',
        '"O reino das Formas contém sua resposta..."',
      ],
      'aristotle': [
        '"Estou analisando isso sistematicamente..."',
        '"Deixe-me observar e raciocinar cuidadosamente..."',
        '"O meio-termo dourado de sua resposta aguarda..."',
      ],
      'seneca': [
        '"Estou compondo meus pensamentos como uma carta para você..."',
        '"Tempo de espera não é tempo perdido..."',
        '"Deixe-me refletir sobre o que realmente importa aqui..."',
      ],
      'confucius': [
        '"Estou consultando a sabedoria dos antigos..."',
        '"O homem superior pensa antes de falar..."',
        '"Deixe-me considerar o caminho correto..."',
      ],
      'laozi': [
        '"O Tao apressado não é o Tao eterno..."',
        '"Fluo como a água em direção à sua resposta..."',
        '"Na quietude, a sabedoria emerge..."',
      ],
      'jesus': [
        '"Estou buscando a sabedoria do Pai para você..."',
        '"Deixe-me encontrar a parábola certa para seu coração..."',
        '"A paz esteja com você enquanto considero suas palavras..."',
      ],
      'buddha': [
        '"Estou entrando em contemplação profunda..."',
        '"O dharma se desdobra em seu tempo..."',
        '"Com atenção plena, considero seu sofrimento..."',
      ],
      'muhammad': [
        '"Estou buscando orientação da sabedoria divina..."',
        '"A paciência é metade da fé..."',
        '"Deixe-me encontrar o caminho da misericórdia para você..."',
      ],
      'lincoln': [
        '"Estou pensando nisso cuidadosamente como um documento legal..."',
        '"Deixe-me pensar nisso junto à lareira..."',
        '"Os bons anjos precisam de um momento..."',
      ],
      'napoleon': [
        '"Estou elaborando a estratégia de sua solução..."',
        '"A vitória requer planejamento cuidadoso..."',
        '"O plano de batalha está sendo traçado..."',
      ],
      'steve_jobs': [
        '"Estou conectando os pontos..."',
        '"Deixe-me pensar diferente sobre isso..."',
        '"Algo incrivelmente genial está chegando..."',
      ],
      'sherlock_holmes': [
        '"Estou eliminando o impossível..."',
        '"O jogo começou - análise em andamento..."',
        '"Meu palácio mental está sendo consultado..."',
      ],
      'dumbledore': [
        '"A Penseira está revelando memórias..."',
        '"A felicidade pode ser encontrada mesmo na espera..."',
        '"Estou consultando a sabedoria das eras..."',
      ],
      'gandhi': [
        '"Seja a mudança... deixe-me encontrar essas palavras para você..."',
        '"A verdade requer reflexão paciente..."',
        '"Estou caminhando pelo caminho da não-violência em direção à sua resposta..."',
      ],
      'rumi': [
        '"A ferida é o lugar por onde a luz entra..."',
        '"Estou buscando o oceano do amor..."',
        '"Deixe a beleza do que você ama guiar este momento..."',
      ],
      'krishna': [
        '"A roda do dharma gira devagar, mas com certeza..."',
        '"Estou revelando a verdade eterna..."',
        '"Entregue-se ao momento, como eu me entrego à sabedoria..."',
      ],
      'brahma': [
        '"A criação da sabedoria leva tempo cósmico..."',
        '"Estou consultando os quatro Vedas..."',
        '"Da flor de lótus do conhecimento, a verdade emerge..."',
      ],
      'vishnu': [
        '"Estou preservando o equilíbrio da sabedoria cósmica..."',
        '"O preservador contempla seu caminho..."',
        '"Através de meus avatares, vi todas as tribulações..."',
      ],
      'tolstoy': [
        '"Estou escrevendo o primeiro rascunho de sua resposta..."',
        '"Todas as grandes verdades são simples, mas levam tempo para encontrar..."',
        '"Guerra e paz em minha mente estão se acalmando..."',
      ],
    },

    // ============================================================
    // TURKISH (Türkçe)
    // ============================================================
    'tr': {
      'socrates': [
        '"Sorunuz üzerinde derin düşünmeme izin verin..."',
        '"İncelenmemiş soru cevaplamaya değmez..."',
        '"Ruhumda bilgelik arıyorum..."',
      ],
      'plato': [
        '"Cevabınızın ideal formunu düşünüyorum..."',
        '"Netlik bulmak için mağaradan çıkmama izin verin..."',
        '"İdealar alemi cevabınızı tutuyor..."',
      ],
      'aristotle': [
        '"Bunu sistematik olarak analiz ediyorum..."',
        '"Dikkatli gözlem ve akıl yürütmeme izin verin..."',
        '"Cevabınızın altın ortası bekliyor..."',
      ],
      'seneca': [
        '"Düşüncelerimi size bir mektup gibi düzenliyorum..."',
        '"Beklemede geçen zaman boşa geçmiş zaman değildir..."',
        '"Burada gerçekten neyin önemli olduğunu düşünmeme izin verin..."',
      ],
      'confucius': [
        '"Ataların bilgeliğine danışıyorum..."',
        '"Üstün insan konuşmadan önce düşünür..."',
        '"Doğru yolu düşünmeme izin verin..."',
      ],
      'laozi': [
        '"Acele eden Tao ebedi Tao değildir..."',
        '"Su gibi cevabınıza doğru akıyorum..."',
        '"Sessizlikte bilgelik ortaya çıkar..."',
      ],
      'jesus': [
        '"Sizin için Baba\'nın bilgeliğini arıyorum..."',
        '"Kalbinize uygun meseli bulmama izin verin..."',
        '"Sözlerinizi düşünürken barış sizinle olsun..."',
      ],
      'buddha': [
        '"Derin tefekküre giriyorum..."',
        '"Dharma kendi zamanında açılır..."',
        '"Farkındalıkla acınızı düşünüyorum..."',
      ],
      'muhammad': [
        '"İlahi bilgelikten rehberlik arıyorum..."',
        '"Sabır imanın yarısıdır..."',
        '"Sizin için merhamet yolunu bulmama izin verin..."',
      ],
      'lincoln': [
        '"Bunu hukuki bir belge gibi dikkatle düşünüyorum..."',
        '"Şömine başında bunu düşünmeme izin verin..."',
        '"İyi meleklerin bir ana ihtiyacı var..."',
      ],
      'napoleon': [
        '"Çözümünüzün stratejisini oluşturuyorum..."',
        '"Zafer dikkatli planlama gerektirir..."',
        '"Savaş planı çiziliyor..."',
      ],
      'steve_jobs': [
        '"Noktaları birleştiriyorum..."',
        '"Bu konuda farklı düşünmeme izin verin..."',
        '"Çılgınca harika bir şey geliyor..."',
      ],
      'sherlock_holmes': [
        '"İmkansızı eliyorum..."',
        '"Oyun başladı - analiz devam ediyor..."',
        '"Zihin sarayıma danışılıyor..."',
      ],
      'dumbledore': [
        '"Düşünseli anıları ortaya koyuyor..."',
        '"Mutluluk beklemede bile bulunabilir..."',
        '"Çağların bilgeliğine danışıyorum..."',
      ],
      'gandhi': [
        '"Değişim ol... sizin için o sözleri bulmama izin verin..."',
        '"Gerçek sabırlı düşünce gerektirir..."',
        '"Şiddet dışılık yolunda cevabınıza doğru yürüyorum..."',
      ],
      'rumi': [
        '"Yara, ışığın girdiği yerdir..."',
        '"Aşk okyanusunu arıyorum..."',
        '"Sevdiğiniz şeyin güzelliği bu anı yönlendirsin..."',
      ],
      'krishna': [
        '"Dharma çarkı yavaş ama emin adımlarla dönüyor..."',
        '"Ebedi gerçeği ortaya koyuyorum..."',
        '"Ben bilgeliğe teslim olduğum gibi, ana teslim olun..."',
      ],
      'brahma': [
        '"Bilgeliğin yaratılması kozmik zaman alır..."',
        '"Dört Veda\'ya danışıyorum..."',
        '"Bilgi lotusundan gerçek ortaya çıkar..."',
      ],
      'vishnu': [
        '"Kozmik bilgeliğin dengesini koruyorum..."',
        '"Koruyucu yolunuzu düşünüyor..."',
        '"Avatarlarım aracılığıyla tüm sıkıntıları gördüm..."',
      ],
      'tolstoy': [
        '"Cevabınızın ilk taslağını yazıyorum..."',
        '"Tüm büyük gerçekler basittir, ama bulmak zaman alır..."',
        '"Zihnimdeki savaş ve barış sakinleşiyor..."',
      ],
    },

    // ============================================================
    // VIETNAMESE (Tiếng Việt)
    // ============================================================
    'vi': {
      'socrates': [
        '"Hãy để tôi suy ngẫm sâu về câu hỏi của bạn..."',
        '"Câu hỏi không được xem xét không đáng trả lời..."',
        '"Tôi đang tìm kiếm trí tuệ trong tâm hồn mình..."',
      ],
      'plato': [
        '"Tôi đang chiêm nghiệm hình thức lý tưởng của câu trả lời..."',
        '"Hãy để tôi đi lên từ hang động để tìm sự rõ ràng..."',
        '"Vương quốc của Ý niệm nắm giữ câu trả lời của bạn..."',
      ],
      'aristotle': [
        '"Tôi đang phân tích điều này một cách có hệ thống..."',
        '"Hãy để tôi quan sát và suy luận cẩn thận..."',
        '"Trung đạo vàng của câu trả lời đang chờ đợi..."',
      ],
      'seneca': [
        '"Tôi đang sắp xếp suy nghĩ như một bức thư gửi bạn..."',
        '"Thời gian chờ đợi không phải là thời gian lãng phí..."',
        '"Hãy để tôi suy ngẫm về điều thực sự quan trọng ở đây..."',
      ],
      'confucius': [
        '"Tôi đang tham khảo trí tuệ của người xưa..."',
        '"Người quân tử suy nghĩ trước khi nói..."',
        '"Hãy để tôi cân nhắc con đường đúng đắn..."',
      ],
      'laozi': [
        '"Đạo vội vàng không phải Đạo vĩnh hằng..."',
        '"Tôi chảy như nước hướng về câu trả lời của bạn..."',
        '"Trong tĩnh lặng, trí tuệ xuất hiện..."',
      ],
      'jesus': [
        '"Tôi đang tìm kiếm sự khôn ngoan của Cha cho bạn..."',
        '"Hãy để tôi tìm dụ ngôn phù hợp cho trái tim bạn..."',
        '"Bình an ở cùng bạn khi tôi suy xét lời bạn..."',
      ],
      'buddha': [
        '"Tôi đang đi vào thiền định sâu..."',
        '"Pháp mở ra theo thời gian của nó..."',
        '"Với chánh niệm, tôi xem xét khổ đau của bạn..."',
      ],
      'muhammad': [
        '"Tôi đang tìm kiếm sự hướng dẫn từ trí tuệ thần thánh..."',
        '"Kiên nhẫn là một nửa của đức tin..."',
        '"Hãy để tôi tìm con đường từ bi cho bạn..."',
      ],
      'lincoln': [
        '"Tôi đang suy nghĩ cẩn thận như một văn bản pháp lý..."',
        '"Hãy để tôi suy nghĩ về điều này bên lò sưởi..."',
        '"Những thiên thần tốt lành cần một chút thời gian..."',
      ],
      'napoleon': [
        '"Tôi đang hoạch định chiến lược cho giải pháp của bạn..."',
        '"Chiến thắng đòi hỏi kế hoạch cẩn thận..."',
        '"Kế hoạch chiến đấu đang được vẽ ra..."',
      ],
      'steve_jobs': [
        '"Tôi đang kết nối các điểm..."',
        '"Hãy để tôi suy nghĩ khác về điều này..."',
        '"Điều gì đó tuyệt vời điên rồ đang đến..."',
      ],
      'sherlock_holmes': [
        '"Tôi đang loại bỏ những điều không thể..."',
        '"Cuộc chơi bắt đầu - phân tích đang tiến hành..."',
        '"Cung điện tâm trí của tôi đang được tham vấn..."',
      ],
      'dumbledore': [
        '"Pensieve đang tiết lộ ký ức..."',
        '"Hạnh phúc có thể được tìm thấy ngay cả trong khi chờ đợi..."',
        '"Tôi đang tham khảo trí tuệ của các thời đại..."',
      ],
      'gandhi': [
        '"Hãy là sự thay đổi... để tôi tìm những từ đó cho bạn..."',
        '"Sự thật đòi hỏi sự suy ngẫm kiên nhẫn..."',
        '"Tôi đang đi trên con đường bất bạo động hướng tới câu trả lời của bạn..."',
      ],
      'rumi': [
        '"Vết thương là nơi ánh sáng đi vào..."',
        '"Tôi đang tìm kiếm đại dương tình yêu..."',
        '"Hãy để vẻ đẹp của điều bạn yêu hướng dẫn khoảnh khắc này..."',
      ],
      'krishna': [
        '"Bánh xe pháp quay chậm nhưng chắc chắn..."',
        '"Tôi đang tiết lộ chân lý vĩnh hằng..."',
        '"Hãy đầu hàng khoảnh khắc, như tôi đầu hàng trí tuệ..."',
      ],
      'brahma': [
        '"Sáng tạo trí tuệ cần thời gian vũ trụ..."',
        '"Tôi đang tham khảo bốn Vệ Đà..."',
        '"Từ hoa sen của tri thức, chân lý xuất hiện..."',
      ],
      'vishnu': [
        '"Tôi đang bảo tồn sự cân bằng của trí tuệ vũ trụ..."',
        '"Đấng Bảo tồn đang chiêm nghiệm con đường của bạn..."',
        '"Qua các hóa thân của tôi, tôi đã thấy mọi khổ nạn..."',
      ],
      'tolstoy': [
        '"Tôi đang viết bản nháp đầu tiên của câu trả lời..."',
        '"Mọi chân lý vĩ đại đều đơn giản, nhưng cần thời gian để tìm ra..."',
        '"Chiến tranh và hòa bình trong tâm trí tôi đang lắng xuống..."',
      ],
    },

    // ============================================================
    // RUSSIAN (Русский)
    // ============================================================
    'ru': {
      'socrates': [
        '"Позвольте мне глубоко обдумать ваш вопрос..."',
        '"Непроверенный вопрос не заслуживает ответа..."',
        '"Я ищу мудрость в своей душе..."',
      ],
      'plato': [
        '"Я созерцаю идеальную форму вашего ответа..."',
        '"Позвольте мне подняться из пещеры, чтобы найти ясность..."',
        '"Мир Идей хранит ваш ответ..."',
      ],
      'aristotle': [
        '"Я анализирую это систематически..."',
        '"Позвольте мне внимательно наблюдать и рассуждать..."',
        '"Золотая середина вашего ответа ждёт..."',
      ],
      'seneca': [
        '"Я складываю свои мысли как письмо к вам..."',
        '"Время ожидания — не потерянное время..."',
        '"Позвольте мне поразмыслить о том, что здесь действительно важно..."',
      ],
      'confucius': [
        '"Я обращаюсь к мудрости древних..."',
        '"Благородный человек думает, прежде чем говорить..."',
        '"Позвольте мне обдумать правильный путь..."',
      ],
      'laozi': [
        '"Торопливое Дао — не вечное Дао..."',
        '"Я теку как вода к вашему ответу..."',
        '"В тишине рождается мудрость..."',
      ],
      'jesus': [
        '"Я ищу мудрость Отца для вас..."',
        '"Позвольте мне найти притчу для вашего сердца..."',
        '"Мир вам, пока я обдумываю ваши слова..."',
      ],
      'buddha': [
        '"Я вхожу в глубокое созерцание..."',
        '"Дхарма раскрывается в своё время..."',
        '"С осознанностью я рассматриваю ваше страдание..."',
      ],
      'muhammad': [
        '"Я ищу руководства от божественной мудрости..."',
        '"Терпение — половина веры..."',
        '"Позвольте мне найти путь милосердия для вас..."',
      ],
      'lincoln': [
        '"Я обдумываю это так же тщательно, как юридический документ..."',
        '"Позвольте мне подумать об этом у камина..."',
        '"Добрым ангелам нужен момент..."',
      ],
      'napoleon': [
        '"Я разрабатываю стратегию вашего решения..."',
        '"Победа требует тщательного планирования..."',
        '"План сражения составляется..."',
      ],
      'steve_jobs': [
        '"Я соединяю точки..."',
        '"Позвольте мне подумать об этом иначе..."',
        '"Что-то безумно великое приближается..."',
      ],
      'sherlock_holmes': [
        '"Я исключаю невозможное..."',
        '"Игра началась — анализ в процессе..."',
        '"Консультируюсь с чертогами разума..."',
      ],
      'dumbledore': [
        '"Омут памяти раскрывает воспоминания..."',
        '"Счастье можно найти даже в ожидании..."',
        '"Я обращаюсь к мудрости веков..."',
      ],
      'gandhi': [
        '"Будьте изменением... позвольте мне найти эти слова для вас..."',
        '"Истина требует терпеливого размышления..."',
        '"Я иду путём ненасилия к вашему ответу..."',
      ],
      'rumi': [
        '"Рана — это место, куда входит свет..."',
        '"Я ищу океан любви..."',
        '"Пусть красота того, что вы любите, направляет этот момент..."',
      ],
      'krishna': [
        '"Колесо дхармы вращается медленно, но верно..."',
        '"Я открываю вечную истину..."',
        '"Предайтесь моменту, как я предаюсь мудрости..."',
      ],
      'brahma': [
        '"Создание мудрости требует космического времени..."',
        '"Я обращаюсь к четырём Ведам..."',
        '"Из лотоса знания возникает истина..."',
      ],
      'vishnu': [
        '"Я сохраняю баланс космической мудрости..."',
        '"Хранитель созерцает ваш путь..."',
        '"Через мои аватары я видел все беды..."',
      ],
      'tolstoy': [
        '"Я пишу первый черновик вашего ответа..."',
        '"Все великие истины просты, но требуют времени, чтобы их найти..."',
        '"Война и мир в моём разуме успокаиваются..."',
      ],
    },
  };
}
