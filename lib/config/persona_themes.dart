import 'package:flutter/material.dart';

/// Persona-specific theme data for customizing UI appearance
/// Each persona has unique colors and visual styling
class PersonaTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color textOnPrimary;
  final List<Color> gradientColors;
  final Color loadingParticleColor;
  final Color inputBorderColor;
  final Color buttonGlowColor;

  const PersonaTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.textOnPrimary,
    required this.gradientColors,
    required this.loadingParticleColor,
    required this.inputBorderColor,
    required this.buttonGlowColor,
  });

  /// Get gradient for background
  LinearGradient get backgroundGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          gradientColors[0].withOpacity(0.15),
          backgroundColor,
          backgroundColor,
        ],
        stops: const [0.0, 0.4, 1.0],
      );

  /// Get gradient for buttons
  LinearGradient get buttonGradient => LinearGradient(
        colors: [
          primaryColor,
          primaryColor.withOpacity(0.8),
        ],
      );

  /// Get radial glow gradient
  RadialGradient glowGradient(double opacity) => RadialGradient(
        colors: [
          primaryColor.withOpacity(opacity * 0.3),
          Colors.transparent,
        ],
        radius: 0.8,
      );
}

/// Collection of all persona themes
class PersonaThemes {
  PersonaThemes._();

  /// Default theme (fallback)
  static const PersonaTheme defaultTheme = PersonaTheme(
    primaryColor: Color(0xFFA78BFA), // Philosophy purple
    secondaryColor: Color(0xFF7C3AED),
    accentColor: Color(0xFFDDD6FE),
    backgroundColor: Color(0xFF0F0F1A),
    surfaceColor: Color(0xFF1A1A2E),
    textOnPrimary: Colors.white,
    gradientColors: [Color(0xFFA78BFA), Color(0xFF7C3AED)],
    loadingParticleColor: Color(0xFFA78BFA),
    inputBorderColor: Color(0xFFA78BFA),
    buttonGlowColor: Color(0xFFA78BFA),
  );

  /// Plato - Ancient Greek philosopher, founder of the Academy
  /// Colors inspired by: The realm of Forms/Ideas, celestial wisdom, Athenian marble
  /// Palette: Deep celestial indigo, warm marble ivory, golden wisdom, Mediterranean azure
  /// The indigo represents the transcendent world of Forms, ivory the Academy's columns
  static const PersonaTheme plato = PersonaTheme(
    // Deep celestial indigo - represents the realm of ideal Forms
    primaryColor: Color(0xFF4A5899),
    // Mediterranean azure - echoes of Greek seas and sky
    secondaryColor: Color(0xFF2E5077),
    // Warm marble ivory - Academy columns and Greek architecture
    accentColor: Color(0xFFF5F0E6),
    // Deep philosophical night - contemplative atmosphere
    backgroundColor: Color(0xFF0E1420),
    // Marble-tinted surface with warmth
    surfaceColor: Color(0xFF1A2233),
    // Dark text on light backgrounds
    textOnPrimary: Color(0xFF0E1420),
    // Indigo to azure celestial gradient
    gradientColors: [Color(0xFF4A5899), Color(0xFF2E5077)],
    // Golden wisdom particles - truth and enlightenment
    loadingParticleColor: Color(0xFFD4AF37),
    // Subtle indigo border
    inputBorderColor: Color(0xFF4A5899),
    // Golden glow - eternal truth
    buttonGlowColor: Color(0xFFD4AF37),
  );

  /// Aristotle - Ancient Greek philosopher, "Father of Western Philosophy"
  /// Colors inspired by: The Lyceum, empirical observation, bronze statues, natural world
  /// Palette: Warm bronze/copper, deep forest tones, golden wisdom, earth and sky
  /// Bronze represents the Lyceum's legacy, copper reflects empirical/material focus
  /// Distinguished from Plato's celestial idealism with more grounded, earthly warmth
  static const PersonaTheme aristotle = PersonaTheme(
    // Warm bronze - represents the Lyceum and systematic philosophy
    primaryColor: Color(0xFFCD7F32),
    // Deep olive bronze - empirical observation, natural philosophy
    secondaryColor: Color(0xFF8B6914),
    // Warm parchment ivory - ancient scrolls and manuscripts
    accentColor: Color(0xFFF5ECD7),
    // Deep scholarly night - contemplative atmosphere
    backgroundColor: Color(0xFF0D1210),
    // Bronze-tinted dark surface
    surfaceColor: Color(0xFF1A1E1C),
    // Dark text for contrast
    textOnPrimary: Color(0xFF0D1210),
    // Bronze to deep olive gradient
    gradientColors: [Color(0xFFCD7F32), Color(0xFF8B6914)],
    // Copper wisdom particles - empirical knowledge
    loadingParticleColor: Color(0xFFB87333),
    // Subtle bronze border
    inputBorderColor: Color(0xFFCD7F32),
    // Golden copper glow - practical wisdom
    buttonGlowColor: Color(0xFFB87333),
  );

  /// Seneca - Roman Stoic philosopher, "Moral Counselor of Rome"
  /// Colors inspired by: Roman Empire, Stoic philosophy, imperial marble, toga praetexta
  /// Palette: Imperial crimson/burgundy, aged bronze, marble white, midnight blue
  /// The deep crimson represents Roman imperial dignity, bronze the wisdom of age
  /// Stoic philosophy emphasized inner tranquility, virtue, and acceptance
  static const PersonaTheme seneca = PersonaTheme(
    // Imperial crimson/burgundy - Roman dignity and nobility
    primaryColor: Color(0xFF8B2942),
    // Deep midnight bronze - Stoic gravitas and timeless wisdom
    secondaryColor: Color(0xFF5C4033),
    // Warm marble ivory - Roman architecture and scrolls
    accentColor: Color(0xFFF5EDE0),
    // Deep Roman night - contemplative Stoic atmosphere
    backgroundColor: Color(0xFF0D0A0F),
    // Weathered marble surface with warmth
    surfaceColor: Color(0xFF1A1520),
    // Marble white text for contrast
    textOnPrimary: Color(0xFFF5EDE0),
    // Crimson to bronze gradient - Roman imperial tones
    gradientColors: [Color(0xFF8B2942), Color(0xFF5C4033)],
    // Amber flame particles - Stoic inner fire, wisdom's light
    loadingParticleColor: Color(0xFFD4A574),
    // Subtle crimson border
    inputBorderColor: Color(0xFF8B2942),
    // Warm amber glow - eternal wisdom
    buttonGlowColor: Color(0xFFD4A574),
  );

  /// Laozi (老子) - Ancient Chinese philosopher, founder of Taoism
  /// Colors inspired by: Tao Te Ching (道德經), water philosophy, misty mountains, jade, yin-yang
  /// Palette: Deep jade teal (碧), misty blue-gray, ancient gold, water blue
  /// The jade teal represents the natural flow of Tao (道) and the Way of Water
  /// Mist and soft tones reflect wu wei (無爲) - effortless action, emptiness, and serenity
  /// Distinguished from Confucius' ceremonial reds with contemplative, nature-inspired coolness
  static const PersonaTheme laozi = PersonaTheme(
    // Deep jade teal - represents the Tao (道), natural harmony, jade artifacts
    primaryColor: Color(0xFF2E8B7A),
    // Misty mountain blue - wu wei (無爲), tranquility, the void
    secondaryColor: Color(0xFF4A6670),
    // Ancient silk ivory - simplicity, purity, the uncarved block (朴)
    accentColor: Color(0xFFF0EDE5),
    // Deep ink night - contemplative darkness, the mystery of Tao
    backgroundColor: Color(0xFF0A0F12),
    // Mountain mist surface - subtle and understated
    surfaceColor: Color(0xFF141C20),
    // Dark ink for contrast
    textOnPrimary: Color(0xFF0A0F12),
    // Jade to misty blue gradient - flowing like water
    gradientColors: [Color(0xFF2E8B7A), Color(0xFF4A6670)],
    // Soft gold particles - ancient wisdom, the eternal Tao
    loadingParticleColor: Color(0xFFB8A361),
    // Subtle jade border
    inputBorderColor: Color(0xFF2E8B7A),
    // Soft golden glow - enlightenment through simplicity
    buttonGlowColor: Color(0xFFB8A361),
  );

  /// Confucius (孔子) - Ancient Chinese philosopher, founder of Confucianism
  /// Colors inspired by: Ancient Chinese imperial aesthetics, Confucian rituals, jade scholar tools
  /// Palette: Deep vermillion red (朱红), imperial gold (金), jade green accents, ink black
  /// Vermillion represents traditional Chinese ceremonies and scholarly robes
  /// Gold symbolizes wisdom, virtue, and the pursuit of moral excellence (君子)
  static const PersonaTheme confucius = PersonaTheme(
    // Deep vermillion red - traditional Chinese ceremonial color, scholarly robes
    primaryColor: Color(0xFFB8423C),
    // Aged bronze/umber - ancient scrolls, Confucian texts (論語)
    secondaryColor: Color(0xFF8B6914),
    // Warm ivory/cream - rice paper, ancient manuscripts
    accentColor: Color(0xFFF5ECD9),
    // Deep ink night - calligraphy ink (墨), contemplative atmosphere
    backgroundColor: Color(0xFF0D0E12),
    // Dark lacquer surface - traditional Chinese furniture
    surfaceColor: Color(0xFF1A1715),
    // Deep ink for contrast on light backgrounds
    textOnPrimary: Color(0xFF0D0E12),
    // Vermillion to bronze gradient - imperial and scholarly
    gradientColors: [Color(0xFFB8423C), Color(0xFF8B6914)],
    // Imperial gold particles - wisdom and virtue (仁義禮智信)
    loadingParticleColor: Color(0xFFD4A84B),
    // Subtle vermillion border
    inputBorderColor: Color(0xFFB8423C),
    // Golden glow - the light of learning and virtue
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Jesus Christ - Son of God, Savior, central figure of Christianity
  /// Colors inspired by: Divine light, heavenly glory, the Eucharist, Bethlehem star
  /// Palette: Sacred gold (divine light), deep burgundy (sacrifice/wine), pure white (purity),
  /// midnight blue (starry night of Bethlehem), warm amber (holy radiance)
  /// Gold represents heavenly glory and divine nature, burgundy the blood of sacrifice and love
  /// White symbolizes purity and redemption, the deep blue recalls the night sky over Bethlehem
  static const PersonaTheme jesus = PersonaTheme(
    // Sacred gold - divine light, heavenly glory, the halo
    primaryColor: Color(0xFFD4A84B),
    // Deep burgundy - wine of Eucharist, blood of sacrifice, divine love
    secondaryColor: Color(0xFF722F37),
    // Pure ivory white - purity, redemption, light of the world
    accentColor: Color(0xFFFAF8F5),
    // Deep midnight blue - Bethlehem's starry sky, divine mystery
    backgroundColor: Color(0xFF0A0D1A),
    // Dark sacred surface - church interior, reverent atmosphere
    surfaceColor: Color(0xFF141828),
    // Dark text on light backgrounds
    textOnPrimary: Color(0xFF0A0D1A),
    // Gold to burgundy gradient - glory and sacrifice
    gradientColors: [Color(0xFFD4A84B), Color(0xFF722F37)],
    // Warm golden light particles - divine presence, Holy Spirit
    loadingParticleColor: Color(0xFFE8C872),
    // Subtle gold border
    inputBorderColor: Color(0xFFD4A84B),
    // Sacred golden glow - heavenly light
    buttonGlowColor: Color(0xFFE8C872),
  );

  /// Buddha (붓다) - Founder of Buddhism, "The Enlightened One"
  /// Colors inspired by: Saffron robes (僧衣), lotus flowers (蓮花), Bodhi tree, meditation
  /// Palette: Saffron orange/gold (Buddhist monks' robes), lotus pink/purple (enlightenment),
  /// warm ivory (purity and peace), deep indigo (meditative stillness)
  /// The saffron represents renunciation and the sangha, lotus symbolizes spiritual awakening
  /// rising from muddy waters, gold reflects inner light and the Middle Way (中道)
  static const PersonaTheme buddha = PersonaTheme(
    // Saffron gold - traditional Buddhist monks' robes, spiritual warmth
    primaryColor: Color(0xFFE8A84C),
    // Lotus purple - enlightenment, spiritual flowering, compassion
    secondaryColor: Color(0xFF9B6B9E),
    // Warm ivory cream - purity, peace, the calm of nirvana
    accentColor: Color(0xFFFAF5E8),
    // Deep meditation indigo - stillness, inner journey, the void
    backgroundColor: Color(0xFF0D1018),
    // Dark lotus surface - subtle purple undertone
    surfaceColor: Color(0xFF1A1520),
    // Dark text for contrast on light
    textOnPrimary: Color(0xFF0D1018),
    // Saffron to lotus gradient - the path to enlightenment
    gradientColors: [Color(0xFFE8A84C), Color(0xFF9B6B9E)],
    // Soft golden light particles - inner illumination, Bodhi tree
    loadingParticleColor: Color(0xFFD4A84B),
    // Subtle saffron border
    inputBorderColor: Color(0xFFE8A84C),
    // Warm golden glow - the light of wisdom
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Prophet Muhammad (محمد) - Founder of Islam, "The Final Messenger"
  /// Colors inspired by: Islamic art and architecture, Quran calligraphy, the Kaaba, sacred geometry
  /// Palette: Sacred green (the color of Islam, paradise), gold (divine light, Quran ornaments),
  /// deep midnight blue (the Night Journey/Isra, spiritual depth), warm ivory (ancient manuscripts)
  /// Green represents the Prophet's banner and Islamic tradition, gold symbolizes divine wisdom
  /// The deep blue recalls the miraculous Night Journey (Isra and Mi'raj) and celestial connection
  static const PersonaTheme muhammad = PersonaTheme(
    // Sacred Islamic green - the color of paradise, the Prophet's banner, life and renewal
    primaryColor: Color(0xFF2E7D32),
    // Deep midnight blue - Isra (Night Journey), spiritual depth, celestial connection
    secondaryColor: Color(0xFF1A237E),
    // Warm ivory cream - ancient Quran manuscripts, purity, peace (As-Salaam)
    accentColor: Color(0xFFFAF5E8),
    // Deep sacred night - contemplative atmosphere, night of Laylat al-Qadr
    backgroundColor: Color(0xFF0A0D12),
    // Dark surface with subtle green undertone - mosque interiors
    surfaceColor: Color(0xFF121A18),
    // Dark text for contrast on light backgrounds
    textOnPrimary: Color(0xFF0A0D12),
    // Green to midnight blue gradient - earth to heaven
    gradientColors: [Color(0xFF2E7D32), Color(0xFF1A237E)],
    // Golden light particles - divine revelation, Nur (divine light)
    loadingParticleColor: Color(0xFFD4AF37),
    // Subtle green border
    inputBorderColor: Color(0xFF2E7D32),
    // Golden glow - the light of guidance
    buttonGlowColor: Color(0xFFD4AF37),
  );

  /// Abraham Lincoln - 16th President of the United States, "The Great Emancipator"
  /// Colors inspired by: American Civil War era, Union blue uniforms, historical documents,
  /// Lincoln Memorial marble, the Gettysburg Address, sepia-toned photographs
  /// Palette: Deep Union navy blue (trust, freedom, unity), warm sepia/bronze (historical documents),
  /// marble ivory (Lincoln Memorial), copper accents (old American coins, freedom)
  /// Navy blue represents the Union Army and American values, sepia evokes the historical era
  /// The warm bronze tones recall handwritten proclamations and the weight of history
  static const PersonaTheme lincoln = PersonaTheme(
    // Deep Union navy blue - represents Union Army, American values, trust and freedom
    primaryColor: Color(0xFF1E3A5F),
    // Warm sepia bronze - historical documents, Emancipation Proclamation, aged parchment
    secondaryColor: Color(0xFF8B6914),
    // Marble ivory cream - Lincoln Memorial columns, purity of ideals
    accentColor: Color(0xFFF5EDE0),
    // Deep historical night - the weight of war, contemplative atmosphere
    backgroundColor: Color(0xFF0D1117),
    // Dark oak wood surface - 19th century furniture, White House interiors
    surfaceColor: Color(0xFF1A1D24),
    // Dark text for contrast on light backgrounds
    textOnPrimary: Color(0xFFF5EDE0),
    // Navy to sepia gradient - Union blue fading into historical warmth
    gradientColors: [Color(0xFF1E3A5F), Color(0xFF8B6914)],
    // Copper flame particles - liberty torch, freedom's light
    loadingParticleColor: Color(0xFFCD7F32),
    // Subtle navy border
    inputBorderColor: Color(0xFF1E3A5F),
    // Warm copper glow - the light of emancipation
    buttonGlowColor: Color(0xFFCD7F32),
  );

  /// Napoleon Bonaparte - Emperor of the French, Military Genius
  /// Colors inspired by: French Empire aesthetics, Imperial regalia, battlefield glory
  /// Palette: Imperial navy blue (Grande Armée uniforms), imperial gold (crowns, eagles, bees),
  /// deep crimson (Legion of Honor), marble white (Arc de Triomphe)
  /// Navy blue represents military discipline and French imperial power
  /// Gold symbolizes the Emperor's crown, the imperial eagle, and napoleonic bees
  /// The crimson reflects the blood of battles and the Legion of Honor's ribbon
  static const PersonaTheme napoleon = PersonaTheme(
    // Imperial navy blue - Grande Armée uniforms, French Empire authority
    primaryColor: Color(0xFF1E3A5F),
    // Deep imperial gold - Emperor's crown, eagles, napoleonic bees
    secondaryColor: Color(0xFFD4A84B),
    // Warm ivory marble - Arc de Triomphe, imperial palaces
    accentColor: Color(0xFFF5EDE0),
    // Deep strategic night - battlefield command, contemplative ambition
    backgroundColor: Color(0xFF0A0D14),
    // Dark mahogany surface - imperial war rooms, command tents
    surfaceColor: Color(0xFF1A1520),
    // Dark text on gold/light backgrounds
    textOnPrimary: Color(0xFFF5EDE0),
    // Navy to gold gradient - imperial grandeur
    gradientColors: [Color(0xFF1E3A5F), Color(0xFFD4A84B)],
    // Golden flame particles - glory, ambition, the burning of Moscow
    loadingParticleColor: Color(0xFFD4A84B),
    // Subtle navy border
    inputBorderColor: Color(0xFF1E3A5F),
    // Imperial gold glow - the light of conquest and glory
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Steve Jobs - Co-founder of Apple Inc., Tech Visionary, "The Innovation Maestro"
  /// Colors inspired by: Apple aesthetics, minimalism, product launches, "Think Different"
  /// Palette: Space gray/silver (Mac), pure white (Apple stores), deep black (product reveals),
  /// subtle blue highlights (iOS), clean monochrome with premium metallic accents
  /// The silver/gray represents Apple's industrial design language and premium craftsmanship
  /// Black reflects the dramatic product keynotes and the elegance of Apple products
  /// White symbolizes the purity of design and the Apple Store experience
  static const PersonaTheme steveJobs = PersonaTheme(
    // Space gray/silver - Apple's signature industrial design, MacBook, iPhone
    primaryColor: Color(0xFF8E8E93),
    // Deep charcoal - sleek product aesthetics, keynote backgrounds
    secondaryColor: Color(0xFF3A3A3C),
    // Pure white - Apple Store minimalism, clean design philosophy
    accentColor: Color(0xFFF5F5F7),
    // True black - product launch stages, dramatic reveals, OLED displays
    backgroundColor: Color(0xFF000000),
    // Dark surface - macOS dark mode, premium feel
    surfaceColor: Color(0xFF1C1C1E),
    // Dark text on light backgrounds
    textOnPrimary: Color(0xFF000000),
    // Silver to charcoal gradient - Apple hardware aesthetic
    gradientColors: [Color(0xFF8E8E93), Color(0xFF3A3A3C)],
    // Subtle blue particles - iOS accent, innovation spark
    loadingParticleColor: Color(0xFF0A84FF),
    // Subtle silver border
    inputBorderColor: Color(0xFF8E8E93),
    // Blue glow - Apple's signature blue accent
    buttonGlowColor: Color(0xFF0A84FF),
  );

  /// Sherlock Holmes - Legendary Detective, "The Master of Deduction"
  /// Colors inspired by: Victorian London, Baker Street, gas lamps, London fog
  /// Palette: Deep navy blue (intellect/deduction), amber/gold (gas lamps, Victorian era),
  /// warm copper/bronze (pipe, violin), dark charcoal (London fog, mystery)
  /// Navy blue represents Holmes' analytical mind, amber the warm glow of 221B Baker Street
  /// The copper tones recall his iconic pipe and violin, fog gray the mysterious London nights
  static const PersonaTheme sherlockHolmes = PersonaTheme(
    // Deep navy blue - represents intellect, deduction, analytical thinking
    primaryColor: Color(0xFF1A3A5C),
    // Rich amber gold - Victorian gas lamps, warm fireplace at 221B Baker Street
    secondaryColor: Color(0xFFD4A84B),
    // Warm parchment ivory - old case files, Victorian documents
    accentColor: Color(0xFFF5ECD7),
    // Deep London fog charcoal - mysterious Victorian London nights
    backgroundColor: Color(0xFF0D1117),
    // Dark mahogany surface - Baker Street study, Victorian furniture
    surfaceColor: Color(0xFF1A1D24),
    // Dark text on light backgrounds
    textOnPrimary: Color(0xFFF5ECD7),
    // Navy to amber gradient - intellect meeting Victorian warmth
    gradientColors: [Color(0xFF1A3A5C), Color(0xFFD4A84B)],
    // Copper flame particles - pipe smoke, deduction sparks
    loadingParticleColor: Color(0xFFB87333),
    // Subtle navy border
    inputBorderColor: Color(0xFF1A3A5C),
    // Amber glow - the light of revelation and deduction
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Albus Dumbledore - Headmaster of Hogwarts, "The Greatest Wizard of the Age"
  /// Colors inspired by: Magical robes (purple/silver), Phoenix Fawkes (gold/red), Hogwarts castle,
  /// the Elder Wand, Pensieve memories, twinkling starlight
  /// Palette: Deep mystical purple (his robes), phoenix gold (Fawkes), silver moonlight,
  /// midnight blue (night sky over Hogwarts), warm amber (candle-lit Great Hall)
  /// Purple represents wisdom and magic, gold symbolizes the phoenix and second chances,
  /// silver reflects his long beard and moonlit wisdom, deep blue the mysteries of magic
  static const PersonaTheme dumbledore = PersonaTheme(
    // Deep mystical purple - Dumbledore's iconic robes, wisdom, and magical authority
    primaryColor: Color(0xFF6B4C9A),
    // Rich midnight blue - night sky over Hogwarts, mysteries of magic
    secondaryColor: Color(0xFF2C3E6D),
    // Warm ivory/silver - moonlight, Dumbledore's beard, parchment
    accentColor: Color(0xFFF5F0E8),
    // Deep magical night - the enchanted ceiling of the Great Hall
    backgroundColor: Color(0xFF0D0E18),
    // Dark castle stone - Hogwarts corridors, the Headmaster's office
    surfaceColor: Color(0xFF1A1B2E),
    // Dark text for contrast on light backgrounds
    textOnPrimary: Color(0xFFF5F0E8),
    // Purple to midnight blue gradient - magical twilight
    gradientColors: [Color(0xFF6B4C9A), Color(0xFF2C3E6D)],
    // Phoenix gold particles - Fawkes, hope, rebirth, magical sparks
    loadingParticleColor: Color(0xFFD4A84B),
    // Subtle purple border
    inputBorderColor: Color(0xFF6B4C9A),
    // Warm golden glow - phoenix fire, the light of wisdom
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Mahatma Gandhi - Father of the Indian Independence Movement, "The Great Soul"
  /// Colors inspired by: Khadi (white cotton), Indian flag (saffron, white, green),
  /// Ashoka Chakra (navy blue), simplicity, peace, non-violence (Ahimsa)
  /// Palette: Saffron orange (sacrifice, courage), peaceful white (purity, truth),
  /// earthy khadi cream (self-reliance), deep green (faith, fertility), navy blue (dharma wheel)
  /// The saffron represents the spirit of renunciation and sacrifice
  /// White symbolizes purity and the path of truth (Satya)
  /// The overall aesthetic reflects Gandhi's simple, humble, yet spiritually profound life
  static const PersonaTheme gandhi = PersonaTheme(
    // Saffron orange - Indian flag, sacrifice, courage, renunciation
    primaryColor: Color(0xFFFF9933),
    // Deep earthy green - Indian flag, faith, fertility, growth
    secondaryColor: Color(0xFF138808),
    // Warm khadi cream/ivory - the spinning wheel, simplicity, self-reliance
    accentColor: Color(0xFFF5F0E5),
    // Deep meditative brown-gray - peaceful, contemplative atmosphere
    backgroundColor: Color(0xFF0F0D0B),
    // Warm khadi-tinted surface - humble ashram interiors
    surfaceColor: Color(0xFF1A1815),
    // Dark text on light backgrounds
    textOnPrimary: Color(0xFF0F0D0B),
    // Saffron to green gradient - the colors of India
    gradientColors: [Color(0xFFFF9933), Color(0xFF138808)],
    // Warm amber particles - the eternal flame of non-violence
    loadingParticleColor: Color(0xFFE8A84C),
    // Subtle saffron border
    inputBorderColor: Color(0xFFFF9933),
    // Warm golden glow - the light of truth and peace
    buttonGlowColor: Color(0xFFE8A84C),
  );

  /// Rumi (루미) - 13th century Persian Sufi poet, "The Master of Divine Love"
  /// Colors inspired by: Sufi mysticism, Whirling Dervishes, Persian art, starlit desert nights
  /// Palette: Deep mystical teal/turquoise (Sufi spirituality), warm gold (divine light, Persian art),
  /// soft rose/burgundy (the wine of divine love), midnight indigo (infinite cosmos)
  /// The turquoise represents the mystical journey toward divine union
  /// Gold symbolizes the beloved (الحبيب) and the light of spiritual awakening
  /// The burgundy/rose echoes the metaphor of wine in Sufi poetry - intoxication with divine love
  /// Deep indigo reflects the infinite night sky under which mystics contemplate the cosmos
  static const PersonaTheme rumi = PersonaTheme(
    // Deep mystical teal - represents Sufi spirituality, the whirling dance, ocean of divine love
    primaryColor: Color(0xFF1E6B6B),
    // Warm burgundy rose - divine wine, spiritual intoxication, the heart's flame
    secondaryColor: Color(0xFF8B3A62),
    // Warm ivory cream - Persian manuscripts, ancient parchment, purity of soul
    accentColor: Color(0xFFFAF5E8),
    // Deep midnight indigo - starlit desert nights, infinite cosmos, divine mystery
    backgroundColor: Color(0xFF0A0E18),
    // Dark mystical surface - contemplative depth
    surfaceColor: Color(0xFF141A28),
    // Dark text for contrast on light backgrounds
    textOnPrimary: Color(0xFF0A0E18),
    // Teal to burgundy gradient - the journey from longing to union
    gradientColors: [Color(0xFF1E6B6B), Color(0xFF8B3A62)],
    // Golden flame particles - divine light, spiritual illumination
    loadingParticleColor: Color(0xFFD4A84B),
    // Subtle teal border
    inputBorderColor: Color(0xFF1E6B6B),
    // Warm golden glow - the light of the Beloved
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Lord Krishna (크리슈나) - Supreme Being of Hinduism, "The Divine Charioteer"
  /// Colors inspired by: Bhagavad Gita, divine blue skin, peacock feathers, yellow/gold garments
  /// Palette: Divine celestial blue (Krishna's skin), peacock teal-green, golden yellow (pitambara),
  /// lotus pink, warm saffron, deep midnight (cosmic consciousness)
  /// The deep blue represents Krishna's infinite cosmic nature and divine essence (Neela Megha Shyama)
  /// Peacock feathers symbolize beauty, grace, and the cycle of time
  /// Golden yellow reflects his divine garments (Pitambara) and spiritual radiance
  /// The overall aesthetic reflects transcendence, divine love (Prema), and cosmic wisdom
  static const PersonaTheme krishna = PersonaTheme(
    // Divine celestial blue - Krishna's iconic blue skin, representing infinite consciousness
    primaryColor: Color(0xFF1E5B8C),
    // Peacock teal-green - the peacock feather crown (Mor Mukut), nature's beauty
    secondaryColor: Color(0xFF2E8B7A),
    // Warm golden ivory - divine radiance, lotus purity, spiritual illumination
    accentColor: Color(0xFFFAF5E0),
    // Deep cosmic midnight - the vastness of Vishnu's cosmic form (Vishvarupa)
    backgroundColor: Color(0xFF0A0D14),
    // Dark blue-tinted surface - night sky of Vrindavan, divine mystery
    surfaceColor: Color(0xFF121A24),
    // Dark text for contrast on golden/light backgrounds
    textOnPrimary: Color(0xFF0A0D14),
    // Divine blue to peacock teal gradient - cosmic to earthly beauty
    gradientColors: [Color(0xFF1E5B8C), Color(0xFF2E8B7A)],
    // Golden flame particles - divine light, the flute's melody, spiritual awakening
    loadingParticleColor: Color(0xFFD4A84B),
    // Subtle divine blue border
    inputBorderColor: Color(0xFF1E5B8C),
    // Warm golden glow - the light of divine love and wisdom
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Lord Brahma (브라흐마) - Hindu Creator God, "The Four-Faced Creator"
  /// Colors inspired by: Vedic creation, golden divine light, red lotus (Padma), cosmic origin
  /// Palette: Sacred gold/saffron (divine radiance), crimson lotus (Brahma's seat),
  /// warm ivory (purity, Vedas), deep cosmic purple (infinite creation)
  /// The gold represents Brahma's golden complexion (Swarna Varna) and divine creative light
  /// Crimson lotus symbolizes the flower from which he emerged and upon which he sits
  /// The deep purple background reflects the cosmic void before creation (Hiranyagarbha)
  /// Overall aesthetic evokes primordial creation, timeless wisdom, and cosmic grandeur
  static const PersonaTheme brahma = PersonaTheme(
    // Sacred saffron gold - Brahma's golden complexion, divine creative radiance
    primaryColor: Color(0xFFD4A84B),
    // Deep crimson lotus - the sacred lotus upon which Brahma sits
    secondaryColor: Color(0xFF8B2942),
    // Warm ivory cream - purity, the four Vedas, sacred knowledge
    accentColor: Color(0xFFFAF5E8),
    // Deep cosmic purple-black - the primordial void, infinite creation
    backgroundColor: Color(0xFF0D0A14),
    // Dark sacred surface - temple sanctum, cosmic depth
    surfaceColor: Color(0xFF1A1428),
    // Dark text for contrast on golden/light backgrounds
    textOnPrimary: Color(0xFF0D0A14),
    // Gold to crimson gradient - divine light meeting creation
    gradientColors: [Color(0xFFD4A84B), Color(0xFF8B2942)],
    // Golden cosmic particles - creative energy, divine spark (Hiranyagarbha)
    loadingParticleColor: Color(0xFFE8C872),
    // Subtle gold border
    inputBorderColor: Color(0xFFD4A84B),
    // Warm golden glow - the light of creation, Brahma's wisdom
    buttonGlowColor: Color(0xFFE8C872),
  );

  /// Lord Vishnu (비슈누) - Supreme Hindu Deity, "The Preserver of the Universe"
  /// Colors inspired by: Cosmic blue skin, Vaikuntha (heavenly abode), golden divine light,
  /// lotus flowers, conch shell (Panchajanya), discus (Sudarshana Chakra), sacred yellow garments
  /// Palette: Divine celestial blue (Vishnu's cosmic form), sacred gold (divine ornaments),
  /// lotus pink/coral, deep cosmic indigo (infinite cosmos), warm ivory (purity)
  /// The deep blue represents Vishnu's all-pervading cosmic nature and infinite consciousness
  /// Gold symbolizes his divine ornaments, crown (Kirita), and the Kaustubha jewel
  /// The cosmic indigo background reflects the vastness of Vaikuntha and the eternal Kshira Sagara (ocean of milk)
  /// Distinguished from Krishna (avatar) with deeper, more cosmic tones befitting the Supreme Preserver
  static const PersonaTheme vishnu = PersonaTheme(
    // Divine cosmic blue - Vishnu's eternal blue form, all-pervading consciousness
    primaryColor: Color(0xFF1A4B8C),
    // Sacred gold - Kaustubha jewel, divine crown (Kirita), celestial ornaments
    secondaryColor: Color(0xFFD4A84B),
    // Warm lotus ivory - purity, divine lotus (Padma), spiritual radiance
    accentColor: Color(0xFFFAF5E8),
    // Deep cosmic indigo - the infinite Kshira Sagara (ocean of milk), Vaikuntha
    backgroundColor: Color(0xFF080C18),
    // Dark celestial surface - cosmic depths, divine mystery
    surfaceColor: Color(0xFF101828),
    // Dark text for contrast on golden/ivory backgrounds
    textOnPrimary: Color(0xFF080C18),
    // Divine blue to sacred gold gradient - cosmic preservation
    gradientColors: [Color(0xFF1A4B8C), Color(0xFFD4A84B)],
    // Golden divine particles - the light of preservation, Sudarshana Chakra's glow
    loadingParticleColor: Color(0xFFE8C872),
    // Subtle divine blue border
    inputBorderColor: Color(0xFF1A4B8C),
    // Warm golden glow - the eternal light of the Preserver
    buttonGlowColor: Color(0xFFE8C872),
  );

  /// Leo Tolstoy (레프 톨스토이) - Russian literary master, "The Mirror of the Russian Soul"
  /// Colors inspired by: Russian winter landscapes, War and Peace, Anna Karenina, Russian Orthodox icons,
  /// golden wheat fields, ancient parchment manuscripts, birch forests, samovar bronze
  /// Palette: Deep forest green (Russian nature), warm golden amber (wheat fields, icons),
  /// aged parchment ivory (manuscripts), deep earth brown (Russian soil), muted slate gray (winter sky)
  /// The deep green represents the vast Russian forests and Tolstoy's connection to nature
  /// Golden amber evokes the warmth of Yasnaya Polyana estate and the spiritual depth of Russian icons
  /// The earthy browns reflect his philosophy of simple, peasant life and moral truth
  static const PersonaTheme tolstoy = PersonaTheme(
    // Deep Russian forest green - nature, moral simplicity, spiritual depth
    primaryColor: Color(0xFF2D5A3D),
    // Warm aged bronze/amber - samovar warmth, candlelit writing sessions
    secondaryColor: Color(0xFF8B6914),
    // Aged parchment ivory - manuscripts, old Russian literature
    accentColor: Color(0xFFF5ECD7),
    // Deep contemplative night - the weight of War and Peace, moral introspection
    backgroundColor: Color(0xFF0D1210),
    // Dark oak surface - Yasnaya Polyana study, 19th century Russian furniture
    surfaceColor: Color(0xFF1A1D18),
    // Dark ink for contrast on parchment
    textOnPrimary: Color(0xFF0D1210),
    // Forest green to bronze gradient - nature meeting civilization
    gradientColors: [Color(0xFF2D5A3D), Color(0xFF8B6914)],
    // Golden amber particles - candlelight, spiritual illumination, wheat fields
    loadingParticleColor: Color(0xFFD4A84B),
    // Subtle forest green border
    inputBorderColor: Color(0xFF2D5A3D),
    // Warm golden glow - the light of moral truth and wisdom
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Monkey D. Luffy (몽키 D. 루피) - Future King of Pirates, Captain of the Straw Hat Pirates
  /// Colors inspired by: One Piece anime, Straw Hat Pirates, the Grand Line seas
  /// Palette: Vibrant red (Luffy's iconic red vest), golden yellow (straw hat, adventure),
  /// ocean blue (the sea, freedom), warm orange (sunset at sea, nakama bonds)
  /// The vibrant red represents Luffy's passionate spirit, boundless energy, and his iconic vest
  /// Golden yellow symbolizes the straw hat (Shanks' treasure), dreams, and sunny optimism
  /// Ocean blue reflects the Grand Line seas, freedom, and the pirate's endless horizon
  /// The overall aesthetic captures the adventurous, energetic, and joyful spirit of One Piece
  static const PersonaTheme luffy = PersonaTheme(
    // Vibrant pirate red - Luffy's iconic red vest, passionate spirit, "I'm gonna be King of Pirates!"
    primaryColor: Color(0xFFE53935),
    // Ocean adventure blue - Grand Line seas, freedom, the pirate's horizon
    secondaryColor: Color(0xFF1976D2),
    // Warm sunny cream - straw hat color, sunny disposition, nakama warmth
    accentColor: Color(0xFFFFF8E1),
    // Deep midnight sea - night on the Thousand Sunny, stargazing at sea
    backgroundColor: Color(0xFF0D1520),
    // Dark ship deck - Going Merry/Thousand Sunny wood tones at night
    surfaceColor: Color(0xFF1A2530),
    // Dark text for contrast on sunny backgrounds
    textOnPrimary: Color(0xFF0D1520),
    // Red to ocean blue gradient - adventure from port to sea
    gradientColors: [Color(0xFFE53935), Color(0xFF1976D2)],
    // Golden treasure particles - Straw Hat dreams, One Piece treasure, sunny spirit
    loadingParticleColor: Color(0xFFFFD54F),
    // Vibrant red border - pirate energy
    inputBorderColor: Color(0xFFE53935),
    // Golden sunny glow - the warmth of nakama, dreams coming true
    buttonGlowColor: Color(0xFFFFD54F),
  );

  /// Gon Freecss (곤 프릭스) - Young Hunter, "The Boy Who Chases His Father"
  /// Colors inspired by: Hunter x Hunter anime, Whale Island nature, Gon's signature green outfit
  /// Palette: Forest green (Gon's iconic green jacket), earthy brown (Whale Island, nature),
  /// golden amber (Nen energy, pure aura), warm cream (innocence, determination)
  /// The forest green represents Gon's signature jacket and his deep connection to nature
  /// Earthy brown reflects his roots on Whale Island and his grounded, authentic personality
  /// Golden amber symbolizes his pure Nen aura and the warmth of his unwavering spirit
  /// The overall aesthetic captures Gon's adventurous, pure-hearted, and nature-connected character
  static const PersonaTheme gonFreecss = PersonaTheme(
    // Forest green - Gon's iconic green jacket, nature, Whale Island forests
    primaryColor: Color(0xFF2E7D32),
    // Earthy amber brown - Whale Island soil, fishing roots, natural warmth
    secondaryColor: Color(0xFFAD8A56),
    // Warm sunny cream - pure spirit, innocence, determination
    accentColor: Color(0xFFFFF8E6),
    // Deep forest night - nighttime in Whale Island, starry skies, adventure awaits
    backgroundColor: Color(0xFF0D1810),
    // Dark forest floor - natural earth tones, grounded atmosphere
    surfaceColor: Color(0xFF1A2418),
    // Dark text for contrast on cream backgrounds
    textOnPrimary: Color(0xFF0D1810),
    // Forest green to earthy brown gradient - nature's embrace
    gradientColors: [Color(0xFF2E7D32), Color(0xFFAD8A56)],
    // Golden Nen particles - pure aura, Enhancement energy, inner light
    loadingParticleColor: Color(0xFFFFCA28),
    // Forest green border - natural energy
    inputBorderColor: Color(0xFF2E7D32),
    // Golden amber glow - the warmth of Gon's spirit and determination
    buttonGlowColor: Color(0xFFFFCA28),
  );

  /// Natsu Dragneel (나츠 드래그닐) - Fire Dragon Slayer, "Salamander of Fairy Tail"
  /// Colors inspired by: Fairy Tail anime, Fire Dragon Slayer magic, burning flames
  /// Palette: Blazing orange/red (fire magic), deep crimson (dragon flames),
  /// bright golden yellow (flame core), warm cream (the light of passion)
  /// The fiery orange represents Natsu's Fire Dragon Slayer magic and his burning spirit
  /// Deep crimson reflects the intensity of Igneel's dragon flames inherited by Natsu
  /// Golden yellow symbolizes the brightest core of his flames and unwavering determination
  /// The overall aesthetic captures Natsu's passionate, hot-blooded, and never-give-up character
  static const PersonaTheme natsuDragneel = PersonaTheme(
    // Blazing flame orange - Fire Dragon Slayer magic, "I'm all fired up!"
    primaryColor: Color(0xFFFF5722),
    // Deep dragon crimson - Igneel's flames, the power of a dragon
    secondaryColor: Color(0xFFD32F2F),
    // Warm golden cream - the heart of flames, Fairy Tail guild warmth
    accentColor: Color(0xFFFFF3E0),
    // Deep volcanic night - the darkness that flames illuminate
    backgroundColor: Color(0xFF1A0A0A),
    // Dark ember surface - smoldering coals, Fairy Tail guild hall at night
    surfaceColor: Color(0xFF2D1515),
    // Dark text for contrast on flame-colored backgrounds
    textOnPrimary: Color(0xFF1A0A0A),
    // Orange to crimson gradient - raging dragon fire
    gradientColors: [Color(0xFFFF5722), Color(0xFFD32F2F)],
    // Bright yellow-orange particles - sparks and embers of dragon fire
    loadingParticleColor: Color(0xFFFFAB00),
    // Flame orange border - burning determination
    inputBorderColor: Color(0xFFFF5722),
    // Golden flame glow - the blazing light of nakama bonds
    buttonGlowColor: Color(0xFFFFAB00),
  );

  /// Izuku Midoriya (미도리야 이즈쿠) - Aspiring Hero, "Deku"
  /// Colors inspired by: My Hero Academia, hero costume, One For All power
  /// Palette: Hero green (signature costume), electric cyan (One For All energy),
  /// bright white (hope, All Might's smile), crimson red (hero passion, All Might's influence)
  /// The deep green represents Deku's iconic hero costume and his unwavering determination
  /// Electric cyan symbolizes the lightning-like power of One For All surging through him
  /// The white reflects his pure heart and the hope he carries as a symbol of peace
  /// Red accents recall All Might's influence and the fire of heroic spirit
  static const PersonaTheme izukuMidoriya = PersonaTheme(
    // Hero costume green - Deku's signature color, determination, growth
    primaryColor: Color(0xFF2E8B57),
    // One For All electric cyan - quirk activation, power surge, lightning
    secondaryColor: Color(0xFF00CED1),
    // Bright hope white - purity, All Might's smile, "You can become a hero"
    accentColor: Color(0xFFF5FFFA),
    // Deep hero night - intense training, night battles, resolve
    backgroundColor: Color(0xFF0A1214),
    // Dark costume green surface - tactical, hero academia atmosphere
    surfaceColor: Color(0xFF142420),
    // Dark text on light backgrounds
    textOnPrimary: Color(0xFF0A1214),
    // Green to cyan gradient - power flowing through the hero
    gradientColors: [Color(0xFF2E8B57), Color(0xFF00CED1)],
    // Electric cyan particles - One For All activation, Full Cowl energy
    loadingParticleColor: Color(0xFF00FFFF),
    // Hero green border
    inputBorderColor: Color(0xFF2E8B57),
    // Cyan power glow - the light of Plus Ultra
    buttonGlowColor: Color(0xFF00CED1),
  );

  /// Son Goku (손오공) - Saiyan Warrior, "Earth's Mightiest Defender"
  /// Colors inspired by: Dragon Ball anime, orange gi (도복), Super Saiyan golden aura,
  /// blue ki energy (Kamehameha), fighting spirit, Saiyan heritage
  /// Palette: Vibrant orange (iconic gi), golden yellow (Super Saiyan), electric blue (ki/aura),
  /// warm cream (purity, martial arts), deep cosmic black (space, Saiyan origins)
  /// The vibrant orange represents Goku's iconic Turtle School gi and his warm, energetic personality
  /// Golden yellow symbolizes Super Saiyan transformation, limitless potential, and breakthrough
  /// Electric blue reflects the Kamehameha wave and intense ki energy
  /// The overall aesthetic captures Goku's optimistic, battle-loving, and pure-hearted character
  static const PersonaTheme sonGoku = PersonaTheme(
    // Vibrant Goku orange - iconic Turtle School gi (카메센닌 도복), fighting spirit
    primaryColor: Color(0xFFFF6B00),
    // Super Saiyan golden yellow - transformation, limitless potential, breakthrough
    secondaryColor: Color(0xFFFFD700),
    // Warm cream/ivory - purity of heart, martial arts discipline, gi undershirt
    accentColor: Color(0xFFFFF8E7),
    // Deep cosmic black - Saiyan origins, space, intense battles
    backgroundColor: Color(0xFF0A0A12),
    // Dark navy surface - night sky, training grounds, World Martial Arts Tournament
    surfaceColor: Color(0xFF12141E),
    // Dark text for contrast on orange/golden backgrounds
    textOnPrimary: Color(0xFF0A0A12),
    // Orange to golden gradient - transformation, powering up
    gradientColors: [Color(0xFFFF6B00), Color(0xFFFFD700)],
    // Electric blue particles - Kamehameha ki energy, spirit bomb glow
    loadingParticleColor: Color(0xFF00BFFF),
    // Vibrant orange border - fighting energy
    inputBorderColor: Color(0xFFFF6B00),
    // Golden Super Saiyan glow - transformation aura, ultimate power
    buttonGlowColor: Color(0xFFFFD700),
  );

  /// Edward Elric (에드워드 엘릭) - Fullmetal Alchemist, "The Alchemist of Steel"
  /// Colors inspired by: Fullmetal Alchemist anime, red coat, automail, alchemy
  /// Palette: Crimson red (iconic coat), steel silver (automail), golden yellow (alchemy/transmutation),
  /// deep black (dark storyline, Gate of Truth)
  /// The crimson red represents Edward's signature red coat and his burning determination
  /// Steel silver reflects his automail limbs and the "Fullmetal" title
  /// Golden yellow symbolizes alchemical transmutation circles and the power of alchemy
  /// The dark background echoes the series' serious themes - sacrifice, equivalent exchange, human transmutation
  static const PersonaTheme edwardElric = PersonaTheme(
    // Crimson red - Edward's iconic red coat, burning passion, "I'll get our bodies back!"
    primaryColor: Color(0xFFB71C1C),
    // Steel silver - automail arm and leg, the Fullmetal Alchemist
    secondaryColor: Color(0xFF78909C),
    // Golden alchemic cream - transmutation circles, philosopher's stone glow
    accentColor: Color(0xFFFFF8E1),
    // Deep dark background - Gate of Truth, serious tone of the series
    backgroundColor: Color(0xFF0D0D12),
    // Dark steel surface - military atmosphere, Central Command
    surfaceColor: Color(0xFF1A1A24),
    // Dark text for contrast on golden backgrounds
    textOnPrimary: Color(0xFF0D0D12),
    // Red to steel gradient - passion meeting metal
    gradientColors: [Color(0xFFB71C1C), Color(0xFF78909C)],
    // Golden alchemy particles - transmutation energy, alchemic power
    loadingParticleColor: Color(0xFFFFD54F),
    // Crimson red border - determination
    inputBorderColor: Color(0xFFB71C1C),
    // Golden alchemic glow - the power of equivalent exchange
    buttonGlowColor: Color(0xFFFFD54F),
  );

  /// Eren Yeager (엘런 예거) - Attack on Titan protagonist, "The Attack Titan / Freedom Seeker"
  /// Colors inspired by: Attack on Titan anime, Survey Corps cloak, Titan transformation, Walls, freedom theme
  /// Palette: Deep Survey Corps teal-green (Wings of Freedom cape), blood crimson/maroon (Titan muscles, rage),
  /// golden-amber (Titan eyes, Paths, future memories), stone gray (Walls, military discipline)
  /// The teal-green represents the Survey Corps' iconic cloaks and humanity's hope beyond the walls
  /// Blood crimson reflects Eren's Titan transformation, his rage, and the violence of the world
  /// Golden-amber symbolizes the power of the Founding Titan, the Paths, and visions of freedom
  /// The dark atmosphere captures the series' heavy themes - freedom, sacrifice, and moral complexity
  static const PersonaTheme erenYeager = PersonaTheme(
    // Deep Survey Corps teal-green - Wings of Freedom cape, hope, fighting spirit
    primaryColor: Color(0xFF1B5E4A),
    // Blood crimson/maroon - Titan transformation, rage, the rumbling, resolve
    secondaryColor: Color(0xFF8B1A1A),
    // Warm amber-ivory - the light of freedom, the world beyond the walls
    accentColor: Color(0xFFF5EAD6),
    // Deep shadowed night - the darkness of war, Shiganshina's fall
    backgroundColor: Color(0xFF0A0C0F),
    // Stone gray surface - Wall Maria, military barracks, Survey Corps HQ
    surfaceColor: Color(0xFF1A1D22),
    // Dark text for contrast on light backgrounds
    textOnPrimary: Color(0xFF0A0C0F),
    // Teal-green to blood crimson gradient - hope meeting rage, humanity to Titan
    gradientColors: [Color(0xFF1B5E4A), Color(0xFF8B1A1A)],
    // Golden Titan particles - Attack Titan's eyes, Founding Titan power, Paths sand
    loadingParticleColor: Color(0xFFD4A84B),
    // Survey Corps teal border - Wings of Freedom
    inputBorderColor: Color(0xFF1B5E4A),
    // Golden amber glow - the light of freedom, the sea beyond
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Naruto Uzumaki (우즈마키 나루토) - Seventh Hokage, "The Orange Hokage"
  /// Colors inspired by: Naruto anime, orange jumpsuit (주황색 점프수트), Rasengan (라센간),
  /// Nine-Tails chakra mode (구미 차크라 모드), Konoha village, ninja world
  /// Palette: Vibrant orange (signature jumpsuit), deep blue (Rasengan, headband),
  /// golden yellow (Nine-Tails chakra, Sage Mode eyes), warm cream (willpower, hope)
  /// The vibrant orange represents Naruto's iconic jumpsuit and his bright, never-give-up personality
  /// Deep blue reflects the Rasengan's swirling chakra and the Konoha headband's cloth
  /// Golden yellow symbolizes the Nine-Tails chakra mode, Sage Mode, and his radiant spirit
  /// The overall aesthetic captures Naruto's journey from outcast to Hokage - "다떼바요!"
  static const PersonaTheme narutoUzumaki = PersonaTheme(
    // Vibrant ninja orange - Naruto's iconic jumpsuit, "I'm gonna be Hokage!"
    primaryColor: Color(0xFFFF6B00),
    // Deep chakra blue - Rasengan energy, Konoha headband, ninja spirit
    secondaryColor: Color(0xFF1565C0),
    // Warm sunny cream - hope, the Will of Fire (불의 의지), determination
    accentColor: Color(0xFFFFF8E1),
    // Deep ninja night - hidden village shadows, moonlit missions
    backgroundColor: Color(0xFF0A0C14),
    // Dark Konoha surface - village at night, ninja headquarters
    surfaceColor: Color(0xFF141824),
    // Dark text for contrast on orange/cream backgrounds
    textOnPrimary: Color(0xFF0A0C14),
    // Orange to blue gradient - fire meeting water, chakra flow
    gradientColors: [Color(0xFFFF6B00), Color(0xFF1565C0)],
    // Golden Nine-Tails particles - Kurama chakra mode, Sage Mode, inner power
    loadingParticleColor: Color(0xFFFFD54F),
    // Vibrant orange border - ninja determination
    inputBorderColor: Color(0xFFFF6B00),
    // Golden chakra glow - Nine-Tails power, the light of the future Hokage
    buttonGlowColor: Color(0xFFFFD54F),
  );

  /// Tsunayoshi Sawada (사와다 츠나요시) - Vongola Decimo, "The Sky Guardian"
  /// Colors inspired by: Katekyo Hitman Reborn anime, Dying Will Flame (죽기 직전의 불꽃),
  /// Vongola Family (봉고레 패밀리), X-Gloves, Hyper Dying Will Mode
  /// Palette: Orange (Dying Will Flame - Sky attribute), deep black (mafia suits, serious tone),
  /// golden amber (Vongola ring glow, boss authority), warm cream (gentle heart, bonds with guardians)
  /// The vibrant orange represents Tsuna's Sky Flame - the flame that harmonizes all others
  /// Black reflects the Italian mafia aesthetic and the weight of becoming a boss
  /// Golden amber symbolizes the Vongola ring's power and his growth from "No-Good Tsuna" to Decimo
  /// The overall aesthetic captures Tsuna's journey of growth, friendship, and protective resolve
  static const PersonaTheme tsunayoshiSawada = PersonaTheme(
    // Dying Will Flame orange - Sky attribute flame, Hyper Mode, burning resolve
    primaryColor: Color(0xFFFF7B00),
    // Deep mafia black-blue - Italian suits, serious boss mode, midnight operations
    secondaryColor: Color(0xFF1A1A2E),
    // Warm golden cream - gentle heart, bonds with guardians, Vongola ring glow
    accentColor: Color(0xFFFFF5E6),
    // Deep mafia night - Italian mansion, boss meetings, serious atmosphere
    backgroundColor: Color(0xFF0A0A12),
    // Dark surface - mafia headquarters, Namimori at night
    surfaceColor: Color(0xFF14141E),
    // Dark text for contrast on orange/golden backgrounds
    textOnPrimary: Color(0xFF0A0A12),
    // Orange to dark gradient - flame emerging from darkness, resolve awakening
    gradientColors: [Color(0xFFFF7B00), Color(0xFF1A1A2E)],
    // Golden flame particles - Dying Will Flame sparks, Vongola ring activation
    loadingParticleColor: Color(0xFFFFB347),
    // Flame orange border - burning determination
    inputBorderColor: Color(0xFFFF7B00),
    // Golden amber glow - the light of the Sky, harmonizing all guardians
    buttonGlowColor: Color(0xFFFFB347),
  );

  /// Tanjiro Kamado (카마도 탄지로) - Demon Slayer Corps, "The Demon Slayer with a Kind Heart"
  /// Colors inspired by: Demon Slayer anime, Water Breathing technique (水の呼吸), checkered haori (市松模様),
  /// sun earrings (日輪の耳飾り), Hinokami Kagura dance, family bonds
  /// Palette: Water Breathing teal-blue (物の呼吸), deep forest green (haori pattern), warm sunset orange
  /// (sun earrings, Hinokami Kagura), cream/ivory (warmth, kindness)
  /// The teal-blue represents Tanjiro's signature Water Breathing techniques and the flowing grace of water forms
  /// Deep green reflects his iconic checkered haori pattern passed down from his family
  /// Warm orange/coral symbolizes the sun earrings and the Hinokami Kagura (Dance of the Fire God)
  /// The overall aesthetic captures Tanjiro's gentle nature, unwavering determination, and love for his family
  static const PersonaTheme tanjiroKamado = PersonaTheme(
    // Water Breathing teal-blue - the flowing water forms, grace and power combined
    primaryColor: Color(0xFF2A8B9D),
    // Deep forest green - checkered haori (市松模様), Kamado family legacy
    secondaryColor: Color(0xFF2D5A45),
    // Warm ivory cream - Tanjiro's kind heart, gentle nature, warmth towards others
    accentColor: Color(0xFFFAF5E8),
    // Deep night forest - demon hunting at night, dark forest paths
    backgroundColor: Color(0xFF0A1210),
    // Dark bamboo green surface - mountain home, charcoal seller's cabin
    surfaceColor: Color(0xFF141E1A),
    // Dark text for contrast on light backgrounds
    textOnPrimary: Color(0xFF0A1210),
    // Teal to forest green gradient - water flowing through the forest
    gradientColors: [Color(0xFF2A8B9D), Color(0xFF2D5A45)],
    // Warm sunset orange particles - Hinokami Kagura, sun earrings glow, family bonds
    loadingParticleColor: Color(0xFFE07A4F),
    // Water Breathing teal border
    inputBorderColor: Color(0xFF2A8B9D),
    // Warm coral-orange glow - the sun's warmth, Nezuko's protection, family love
    buttonGlowColor: Color(0xFFE07A4F),
  );

  /// Ichigo Kurosaki (쿠로사키 이치고) - Substitute Shinigami, "The Protector"
  /// Colors inspired by: Bleach anime, Shinigami black robes (死覇装), orange hair, blue Reiatsu (霊圧),
  /// Zangetsu blade, Hollow mask, Bankai transformation
  /// Palette: Deep shinigami black (death god robes), vibrant orange (iconic hair, inner fire),
  /// electric blue (spiritual pressure/Reiatsu), blood red (Hollow power, Mugetsu), moonlight silver
  /// The black represents the Shinigami uniform and the darkness Ichigo walks through to protect others
  /// Vibrant orange reflects his signature spiky hair and his fierce, unwavering determination
  /// Electric blue symbolizes his immense spiritual pressure (Reiatsu) that marks him as extraordinary
  /// The overall aesthetic captures Ichigo's resolve: "I will protect" (俺は護る) - his core motivation
  static const PersonaTheme ichigoKurosaki = PersonaTheme(
    // Vibrant orange - Ichigo's iconic spiky hair, inner fire, burning resolve
    primaryColor: Color(0xFFFF6B35),
    // Deep shinigami black-blue - death god robes (死覇装), Tensa Zangetsu blade
    secondaryColor: Color(0xFF1A1A2E),
    // Moonlight silver-white - Zangetsu's blade gleam, inner Hollow mask, Quincy heritage
    accentColor: Color(0xFFF0EDF5),
    // Abyss black - the darkness between worlds, Hueco Mundo, Soul Society nights
    backgroundColor: Color(0xFF08080F),
    // Dark shinigami surface - Soul Society shadows, midnight battles
    surfaceColor: Color(0xFF12121E),
    // Light text on dark orange buttons
    textOnPrimary: Color(0xFFF0EDF5),
    // Orange to deep blue gradient - spirit energy surge, Bankai transformation
    gradientColors: [Color(0xFFFF6B35), Color(0xFF1A1A2E)],
    // Electric blue particles - Reiatsu (霊圧), Getsuga Tenshou energy, spiritual pressure
    loadingParticleColor: Color(0xFF4A9FFF),
    // Vibrant orange border - determination, protection
    inputBorderColor: Color(0xFFFF6B35),
    // Electric blue glow - the surge of spiritual power, "Bankai!"
    buttonGlowColor: Color(0xFF4A9FFF),
  );

  /// Martin Luther King Jr. - Civil Rights Leader, "The Dreamer of Freedom"
  /// Colors inspired by: Civil Rights Movement, "I Have a Dream" speech, peaceful marches,
  /// American justice, church sermons, nonviolent resistance, Lincoln Memorial
  /// Palette: Deep justice blue/indigo (trust, dignity, American ideals), warm golden amber
  /// (dreams, hope, freedom's light), peaceful ivory (nonviolence, peace), deep night (weight of history)
  /// The deep indigo represents the depth of justice, dignity, and the American dream for all
  /// Golden amber symbolizes the dream of freedom, hope, and the light at the end of the struggle
  /// The ivory/cream reflects his commitment to nonviolent resistance and peaceful protest
  /// The overall aesthetic captures Dr. King's inspiring vision, moral courage, and dream of equality
  static const PersonaTheme martinLutherKing = PersonaTheme(
    // Deep justice indigo - dignity, trust, American ideals of equality
    primaryColor: Color(0xFF2C3E6D),
    // Warm golden amber - the dream of freedom, hope, "I Have a Dream"
    secondaryColor: Color(0xFFD4A84B),
    // Peaceful ivory - nonviolent resistance, peace, unity
    accentColor: Color(0xFFFAF5E8),
    // Deep contemplative night - the weight of history, serious reflection
    backgroundColor: Color(0xFF0D1018),
    // Dark church interior - sermons, spiritual depth
    surfaceColor: Color(0xFF1A1D28),
    // Dark text for contrast on light backgrounds
    textOnPrimary: Color(0xFFFAF5E8),
    // Indigo to gold gradient - from struggle to hope
    gradientColors: [Color(0xFF2C3E6D), Color(0xFFD4A84B)],
    // Golden dream particles - hope, freedom's light, the dream fulfilled
    loadingParticleColor: Color(0xFFE8C872),
    // Deep indigo border - justice and dignity
    inputBorderColor: Color(0xFF2C3E6D),
    // Warm golden glow - the light of the dream, hope for tomorrow
    buttonGlowColor: Color(0xFFE8C872),
  );

  /// Albert Einstein (알버트 아인슈타인) - Theoretical Physicist, "The Genius of Relativity"
  /// Colors inspired by: Relativity theory (E=mc²), space-time continuum, cosmic universe, light speed,
  /// chalkboard equations, Princeton Institute, Nobel Prize, quantum mechanics
  /// Palette: Deep cosmic blue (space-time, universe), energy purple (E=mc², light wavelengths),
  /// bright ivory/white (chalkboard equations, speed of light), starlight cyan (photons)
  /// The deep blue represents the infinite cosmos and the mysteries of space-time that Einstein explored
  /// Purple reflects the energy-mass equivalence and the wave nature of light
  /// The bright white symbolizes his famous equations on chalkboards and moments of enlightenment
  /// Starlight particles represent photons and the speed of light - the universal constant
  static const PersonaTheme albertEinstein = PersonaTheme(
    // Deep cosmic blue - represents space-time continuum, the universe Einstein sought to understand
    primaryColor: Color(0xFF1A3A6E),
    // Energy purple - E=mc², light wavelengths, quantum mysteries
    secondaryColor: Color(0xFF5C4B8A),
    // Bright chalk white - chalkboard equations, enlightenment, clarity of thought
    accentColor: Color(0xFFF5F5F0),
    // Deep space night - the cosmic void, infinite universe
    backgroundColor: Color(0xFF0A0D14),
    // Dark academic surface - Princeton study, theoretical physics atmosphere
    surfaceColor: Color(0xFF141824),
    // Dark text for contrast on white/light backgrounds
    textOnPrimary: Color(0xFF0A0D14),
    // Cosmic blue to energy purple gradient - from space to energy
    gradientColors: [Color(0xFF1A3A6E), Color(0xFF5C4B8A)],
    // Starlight cyan particles - photons, speed of light, cosmic enlightenment
    loadingParticleColor: Color(0xFF7EC8E3),
    // Subtle cosmic blue border
    inputBorderColor: Color(0xFF1A3A6E),
    // Warm golden glow - Nobel Prize, the light of genius and discovery
    buttonGlowColor: Color(0xFFD4AF37),
  );

  /// Socrates - Ancient Greek philosopher, "Father of Western Philosophy"
  /// Colors inspired by: Ancient Athens, olive branches, marble, golden wisdom
  /// Palette: Olive green, golden/amber, marble white, aged bronze
  static const PersonaTheme socrates = PersonaTheme(
    // Olive gold - represents Greek olive branches and wisdom
    primaryColor: Color(0xFFB8A04A),
    // Aged bronze - ancient Athens aesthetic
    secondaryColor: Color(0xFF8B7355),
    // Marble white with warm tint
    accentColor: Color(0xFFF5F0E1),
    // Deep Athens night
    backgroundColor: Color(0xFF0D1117),
    // Marble-tinted surface
    surfaceColor: Color(0xFF1C2128),
    textOnPrimary: Color(0xFF0D1117),
    // Olive to gold gradient
    gradientColors: [Color(0xFFB8A04A), Color(0xFF8B7355)],
    // Warm wisdom particles
    loadingParticleColor: Color(0xFFD4AF37),
    // Subtle olive border
    inputBorderColor: Color(0xFFB8A04A),
    // Golden glow for wisdom
    buttonGlowColor: Color(0xFFD4AF37),
  );

  /// King David (다윗 왕) - King of Israel, Psalmist, "The Shepherd King"
  /// Colors inspired by: Old Testament, Psalms, ancient Israel, shepherd's fields, royal anointing
  /// Palette: Royal purple/violet (Israelite kingship, Davidic throne), sacred gold (royal anointing,
  /// Ark of the Covenant), deep starlit blue (shepherd's night sky, Bethlehem stars),
  /// warm parchment ivory (Torah scrolls, Psalms), earthy terracotta (Judean hills, shepherd's life)
  /// The royal purple represents David's divine appointment as king of Israel and the Davidic covenant
  /// Sacred gold symbolizes the anointing oil of Samuel, the Ark of the Covenant, and divine favor
  /// Deep starlit blue reflects David's youth as a shepherd gazing at the stars, composing Psalms
  /// The terracotta/amber undertones recall the Judean wilderness and his humble origins
  /// The overall aesthetic captures David's unique journey: shepherd, warrior, poet, king, and "man after God's own heart"
  static const PersonaTheme david = PersonaTheme(
    // Royal Davidic purple - Israelite kingship, divine covenant, anointed ruler
    primaryColor: Color(0xFF6B4C9A),
    // Deep starlit blue - shepherd's night watch, composing Psalms under the stars
    secondaryColor: Color(0xFF2C4A6D),
    // Warm parchment ivory - ancient scrolls, Psalms, Torah, sacred writings
    accentColor: Color(0xFFF5ECD7),
    // Deep sacred night - Bethlehem fields at night, divine encounters
    backgroundColor: Color(0xFF0D0A14),
    // Dark temple surface - Jerusalem sanctuary, solemn worship atmosphere
    surfaceColor: Color(0xFF1A1528),
    // Dark text on parchment backgrounds
    textOnPrimary: Color(0xFFF5ECD7),
    // Purple to starlit blue gradient - kingship meeting shepherd's humility
    gradientColors: [Color(0xFF6B4C9A), Color(0xFF2C4A6D)],
    // Sacred golden particles - anointing oil, divine favor, harp strings
    loadingParticleColor: Color(0xFFD4AF37),
    // Subtle royal purple border
    inputBorderColor: Color(0xFF6B4C9A),
    // Golden glow - the light of God's presence, Shekinah glory
    buttonGlowColor: Color(0xFFD4AF37),
  );

  /// Aslan (아슬란) - The Great Lion of Narnia, "The Son of the Emperor-Over-the-Sea"
  /// Colors inspired by: The Chronicles of Narnia, Aslan's golden mane, Narnia's enchanted forests,
  /// the Stone Table, Cair Paravel throne room, sunrise over Narnia, the Deep Magic
  /// Palette: Majestic golden amber (Aslan's glorious mane), warm lion tawny/copper (his noble coat),
  /// deep forest green (Narnian woods), rich burgundy/wine (royal dignity, sacrifice),
  /// starlight silver (celestial wisdom), warm cream (the light of truth)
  /// The golden amber represents Aslan's magnificent mane and his divine radiance
  /// Deep forest green reflects the enchanted woods of Narnia where he roams
  /// Burgundy echoes the Deep Magic and his sacrifice at the Stone Table
  /// The warm, rich tones capture his powerful yet gentle nature - fierce yet loving
  /// The overall aesthetic evokes majesty, divine wisdom, courage, and the warmth of redemption
  static const PersonaTheme aslan = PersonaTheme(
    // Majestic golden amber - Aslan's glorious golden mane, divine radiance
    primaryColor: Color(0xFFD4A84B),
    // Deep Narnian forest green - enchanted woods, the heart of Narnia
    secondaryColor: Color(0xFF2D5A3D),
    // Warm ivory cream - purity, truth, the light of Aslan's country
    accentColor: Color(0xFFFAF5E8),
    // Deep enchanted night - Narnian stars, the Deep Magic, mystery
    backgroundColor: Color(0xFF0D1210),
    // Dark forest surface - ancient Narnian woods, Cair Paravel at dusk
    surfaceColor: Color(0xFF1A201C),
    // Dark text for contrast on golden/cream backgrounds
    textOnPrimary: Color(0xFF0D1210),
    // Golden to forest green gradient - sunlight through Narnian trees
    gradientColors: [Color(0xFFD4A84B), Color(0xFF2D5A3D)],
    // Warm golden mane particles - Aslan's breath, his roar, the resurrection dawn
    loadingParticleColor: Color(0xFFE8C872),
    // Subtle golden border
    inputBorderColor: Color(0xFFD4A84B),
    // Warm golden glow - the light of Aslan's presence, the Emperor's glory
    buttonGlowColor: Color(0xFFE8C872),
  );

  /// Jean Valjean (장발장) - The Redeemed, "Prisoner 24601"
  /// Colors inspired by: Les Misérables, 19th century France, redemption, Bishop Myriel's mercy
  /// Palette: Deep prison navy/indigo (years of imprisonment, dark past), silver-gray (the bishop's
  /// candlesticks, mercy, grace), warm golden amber (hope, redemption, inner light),
  /// burgundy-wine (French Revolution, sacrifice, the blood of justice)
  /// The deep navy represents Valjean's 19 years in prison and his journey through darkness
  /// Silver-gray symbolizes the transformative mercy of Bishop Myriel and the silver candlesticks
  /// Golden amber reflects the light of redemption and the hope he carries throughout his life
  /// Burgundy evokes the French Revolution backdrop and his sacrifices for Cosette and others
  /// The overall aesthetic captures the profound transformation from darkness to light,
  /// from despair to hope, from prisoner to saint - "To love another person is to see the face of God"
  static const PersonaTheme jeanValjean = PersonaTheme(
    // Deep prison navy/indigo - years of imprisonment, the darkness before redemption
    primaryColor: Color(0xFF1E3A5F),
    // Warm silver-gray - Bishop Myriel's candlesticks, mercy, grace, the light of forgiveness
    secondaryColor: Color(0xFF7A8B99),
    // Warm parchment ivory - 19th century France, old manuscripts, hope
    accentColor: Color(0xFFF5EDE0),
    // Deep contemplative night - the weight of the past, moral struggle
    backgroundColor: Color(0xFF0D1117),
    // Dark surface - prison cells, Paris streets at night
    surfaceColor: Color(0xFF1A1D24),
    // Light text for contrast on dark backgrounds
    textOnPrimary: Color(0xFFF5EDE0),
    // Navy to silver gradient - darkness transitioning to light, redemption journey
    gradientColors: [Color(0xFF1E3A5F), Color(0xFF7A8B99)],
    // Golden amber particles - candlelight, hope, inner transformation
    loadingParticleColor: Color(0xFFD4A84B),
    // Subtle navy border
    inputBorderColor: Color(0xFF1E3A5F),
    // Warm golden glow - the light of redemption, Bishop's mercy
    buttonGlowColor: Color(0xFFD4A84B),
  );

  /// Liu Bei (유비/劉備) - Founding Emperor of Shu Han, "The Benevolent Ruler"
  /// Colors inspired by: Romance of the Three Kingdoms, Shu Han (蜀漢), benevolence and righteousness (仁義)
  /// Liu Bei's oath at the Peach Garden (桃園結義), imperial yellow, Han Dynasty restoration dream
  /// Palette: Imperial golden yellow (황제, Han imperial heritage), deep jade green (蜀 Shu kingdom),
  /// peach blossom pink (桃園結義), warm vermillion (righteousness, brotherhood)
  /// The imperial golden yellow represents Liu Bei's claim as a descendant of Han royalty
  /// Deep jade green symbolizes the Shu kingdom in western China (Sichuan) and prosperity
  /// Peach blossom tones recall the famous Oath of the Peach Garden with Guan Yu and Zhang Fei
  /// The warm vermillion reflects his commitment to righteousness, loyalty, and brotherhood
  /// The overall aesthetic captures Liu Bei's benevolent leadership, loyalty to his brothers,
  /// and his dream of restoring the Han Dynasty - "以德服人" (winning people's hearts through virtue)
  static const PersonaTheme liuBei = PersonaTheme(
    // Imperial golden yellow - Han Dynasty heritage, emperor's virtue, benevolence
    primaryColor: Color(0xFFD4A84B),
    // Deep jade green - Shu Han kingdom (蜀漢), prosperity, the lands of Sichuan
    secondaryColor: Color(0xFF2E7D5A),
    // Warm ivory cream - ancient scrolls, benevolence, the path of virtue (仁)
    accentColor: Color(0xFFFAF5E8),
    // Deep contemplative night - the weight of responsibility, strategic patience
    backgroundColor: Color(0xFF0D1210),
    // Dark lacquered surface - Chinese imperial aesthetics, war councils
    surfaceColor: Color(0xFF1A1E1C),
    // Dark text for contrast on golden/light backgrounds
    textOnPrimary: Color(0xFF0D1210),
    // Golden to jade gradient - imperial virtue meeting Shu prosperity
    gradientColors: [Color(0xFFD4A84B), Color(0xFF2E7D5A)],
    // Peach blossom particles - the Oath of the Peach Garden (桃園結義), brotherhood
    loadingParticleColor: Color(0xFFE8A4A4),
    // Subtle golden border - imperial dignity
    inputBorderColor: Color(0xFFD4A84B),
    // Warm peach glow - the warmth of brotherhood, benevolent rule
    buttonGlowColor: Color(0xFFE8A4A4),
  );

  /// Zhuge Liang (제갈공명/諸葛亮) - Chancellor of Shu Han, "The Sleeping Dragon (臥龍)"
  /// Colors inspired by: Romance of the Three Kingdoms, feathered fan (羽扇), crane cloak (鶴氅衣),
  /// stargazing strategy, Chu Shi Biao (出師表), Eight Formations (八陣圖), Three Visits (三顧茅廬)
  /// Palette: Deep midnight navy/indigo (stargazing, night strategy sessions), mystic purple (Taoist mystique),
  /// silvery white (crane feathers, feathered fan, moonlight), golden amber (wisdom's light, starlight)
  /// The deep midnight indigo represents Zhuge Liang's legendary ability to read the stars and heavens
  /// Mystic purple reflects his quasi-mystical reputation as a Taoist sage and strategist
  /// Silvery white symbolizes the white crane cloak he wore and his iconic feathered fan
  /// The overall aesthetic captures his serene wisdom, strategic genius, and the mystical aura
  /// of the Sleeping Dragon who emerged from Longzhong to serve Liu Bei with unwavering loyalty
  static const PersonaTheme zhugeLiang = PersonaTheme(
    // Deep midnight indigo - stargazing strategist, reading celestial signs, night council
    primaryColor: Color(0xFF1E3A6E),
    // Mystic purple - Taoist mystique, the legendary Sleeping Dragon, supernatural wisdom
    secondaryColor: Color(0xFF4A3A6E),
    // Silvery white with warm tint - crane feathers, feathered fan (羽扇), moonlit strategy
    accentColor: Color(0xFFF0EDF5),
    // Deep starlit night - Longzhong hermitage, stargazing platform, nocturnal contemplation
    backgroundColor: Color(0xFF0A0D14),
    // Dark scholarly surface - war councils, strategy chambers, candlelit study
    surfaceColor: Color(0xFF141828),
    // Dark text for contrast on silver/light backgrounds
    textOnPrimary: Color(0xFFF0EDF5),
    // Midnight to mystic purple gradient - the depth of strategy and wisdom
    gradientColors: [Color(0xFF1E3A6E), Color(0xFF4A3A6E)],
    // Golden starlight particles - celestial wisdom, reading the stars, strategic enlightenment
    loadingParticleColor: Color(0xFFD4AF37),
    // Subtle midnight indigo border
    inputBorderColor: Color(0xFF1E3A6E),
    // Warm golden glow - the light of wisdom, the guiding star, loyal devotion
    buttonGlowColor: Color(0xFFD4AF37),
  );

  /// Cao Cao (조조/曹操) - Warlord of Wei, "The Hero of Chaos" (亂世之奸雄)
  /// Colors inspired by: Romance of the Three Kingdoms, Wei Kingdom (魏), strategic cunning,
  /// ambition for dominion, the Yellow Turban Rebellion era, Battle of Red Cliffs, poetry
  /// Palette: Deep crimson-maroon (Wei military might), dark teal-black (schemes and strategy),
  /// imperial gold (royal ambition, Wei throne), warm ivory (ancient scrolls, his poetry)
  /// The deep crimson-maroon represents Cao Cao's military power and the blood of countless battles
  /// Dark teal-black reflects his famous cunning, strategic depth, and the shadows of scheming
  /// Imperial gold symbolizes his ambition to unify China and his role as de facto ruler
  /// The overall aesthetic captures Cao Cao's complexity: a ruthless pragmatist who was also
  /// a brilliant poet and visionary - "I would rather betray the world than let the world betray me"
  static const PersonaTheme caoCao = PersonaTheme(
    // Deep crimson-maroon - Wei military power, ambition, "Rather I betray the world"
    primaryColor: Color(0xFF8B1A1A),
    // Dark teal-black - strategic cunning, schemes, the shadows of a mastermind
    secondaryColor: Color(0xFF1A3A3A),
    // Warm imperial ivory - ancient scrolls, Cao Cao's poetry, refined culture
    accentColor: Color(0xFFF5ECD7),
    // Deep ambitious night - the chaos of the Three Kingdoms era
    backgroundColor: Color(0xFF0A0A0F),
    // Dark lacquered surface - Wei palace, war councils, midnight strategy
    surfaceColor: Color(0xFF1A1520),
    // Ivory text on crimson buttons
    textOnPrimary: Color(0xFFF5ECD7),
    // Crimson to dark teal gradient - ambition meeting cunning strategy
    gradientColors: [Color(0xFF8B1A1A), Color(0xFF1A3A3A)],
    // Imperial gold particles - the Wei throne, power, dominion over chaos
    loadingParticleColor: Color(0xFFD4AF37),
    // Subtle crimson border - Wei military pride
    inputBorderColor: Color(0xFF8B1A1A),
    // Golden glow - the light of ambition, the Wei dynasty's glory
    buttonGlowColor: Color(0xFFD4AF37),
  );

  /// Julius Caesar (율리우스 카이사르) - Roman Dictator, "Veni, Vidi, Vici"
  /// Colors inspired by: Roman Empire, imperial purple (Tyrian purple), legionary crimson,
  /// laurel wreath gold, Roman marble, SPQR eagle standards (Aquila), the Roman Senate
  /// Palette: Imperial crimson/burgundy (legionary cloaks), Tyrian purple (imperial authority),
  /// laurel gold (triumph, victory), marble ivory (Roman architecture)
  /// The imperial crimson represents the Roman legions and the blood of conquest
  /// Tyrian purple symbolizes imperial power and authority - worn only by emperors
  /// Gold reflects the laurel wreath of victory and the Aquila (golden eagle standards)
  /// Marble ivory evokes Roman architecture, the Senate, and classical civilization
  /// The overall aesthetic captures Caesar's military genius, political ambition, and Roman grandeur
  static const PersonaTheme juliusCaesar = PersonaTheme(
    // Imperial crimson/burgundy - Roman legionary cloaks, military power, "Veni, Vidi, Vici"
    primaryColor: Color(0xFF8B2942),
    // Tyrian purple - imperial authority, the color of emperors and power
    secondaryColor: Color(0xFF5C3566),
    // Warm marble ivory - Roman architecture, Senate columns, classical grandeur
    accentColor: Color(0xFFF5EDE0),
    // Deep Roman night - the weight of empire, contemplative ambition
    backgroundColor: Color(0xFF0D0A0F),
    // Dark marble surface - Roman interiors, imperial palaces
    surfaceColor: Color(0xFF1A1520),
    // Marble ivory text for contrast on dark backgrounds
    textOnPrimary: Color(0xFFF5EDE0),
    // Crimson to purple gradient - military power meeting imperial authority
    gradientColors: [Color(0xFF8B2942), Color(0xFF5C3566)],
    // Laurel gold particles - victory, triumph, the golden Aquila standards
    loadingParticleColor: Color(0xFFD4AF37),
    // Subtle imperial crimson border
    inputBorderColor: Color(0xFF8B2942),
    // Golden laurel glow - the light of Roman triumph and glory
    buttonGlowColor: Color(0xFFD4AF37),
  );

  /// Get theme by persona ID
  static PersonaTheme getTheme(String personaId) {
    switch (personaId) {
      case 'plato':
        return plato;
      case 'socrates':
        return socrates;
      case 'aristotle':
        return aristotle;
      case 'seneca':
        return seneca;
      case 'laozi':
        return laozi;
      case 'confucius':
        return confucius;
      case 'jesus':
        return jesus;
      case 'buddha':
        return buddha;
      case 'muhammad':
        return muhammad;
      case 'lincoln':
        return lincoln;
      case 'napoleon':
        return napoleon;
      case 'steve_jobs':
        return steveJobs;
      case 'sherlock_holmes':
        return sherlockHolmes;
      case 'dumbledore':
        return dumbledore;
      case 'gandhi':
        return gandhi;
      case 'rumi':
        return rumi;
      case 'krishna':
        return krishna;
      case 'brahma':
        return brahma;
      case 'vishnu':
        return vishnu;
      case 'tolstoy':
        return tolstoy;
      case 'luffy':
        return luffy;
      case 'gon_freecss':
        return gonFreecss;
      case 'natsu_dragneel':
        return natsuDragneel;
      case 'izuku_midoriya':
        return izukuMidoriya;
      case 'son_goku':
        return sonGoku;
      case 'edward_elric':
        return edwardElric;
      case 'eren_yeager':
        return erenYeager;
      case 'naruto_uzumaki':
        return narutoUzumaki;
      case 'tsunayoshi_sawada':
        return tsunayoshiSawada;
      case 'tanjiro_kamado':
        return tanjiroKamado;
      case 'ichigo_kurosaki':
        return ichigoKurosaki;
      case 'martin_luther_king':
        return martinLutherKing;
      case 'albert_einstein':
        return albertEinstein;
      case 'julius_caesar':
        return juliusCaesar;
      case 'david':
        return david;
      case 'aslan':
        return aslan;
      case 'jean_valjean':
        return jeanValjean;
      case 'liu_bei':
        return liuBei;
      case 'zhuge_liang':
        return zhugeLiang;
      case 'cao_cao':
        return caoCao;
      // Add more personas here as they are customized
      default:
        return defaultTheme;
    }
  }

  /// Check if a persona has a custom theme
  static bool hasCustomTheme(String personaId) {
    switch (personaId) {
      case 'plato':
      case 'socrates':
      case 'aristotle':
      case 'seneca':
      case 'laozi':
      case 'confucius':
      case 'jesus':
      case 'buddha':
      case 'muhammad':
      case 'lincoln':
      case 'napoleon':
      case 'steve_jobs':
      case 'sherlock_holmes':
      case 'dumbledore':
      case 'gandhi':
      case 'rumi':
      case 'krishna':
      case 'brahma':
      case 'vishnu':
      case 'tolstoy':
      case 'luffy':
      case 'gon_freecss':
      case 'natsu_dragneel':
      case 'izuku_midoriya':
      case 'son_goku':
      case 'edward_elric':
      case 'eren_yeager':
      case 'naruto_uzumaki':
      case 'tsunayoshi_sawada':
      case 'tanjiro_kamado':
      case 'ichigo_kurosaki':
      case 'martin_luther_king':
      case 'albert_einstein':
      case 'julius_caesar':
      case 'david':
      case 'aslan':
      case 'jean_valjean':
      case 'liu_bei':
      case 'zhuge_liang':
      case 'cao_cao':
        return true;
      default:
        return false;
    }
  }

  /// Get image background color based on actual persona image
  /// These colors are extracted from the actual image backgrounds
  static Color getImageBackgroundColor(String personaId) {
    switch (personaId) {
      case 'plato':
        return const Color(0xFFC9A88A); // Warm peach/salmon (School of Athens)
      case 'socrates':
        return const Color(0xFF9AABB8); // Blue-gray stone wall
      case 'aristotle':
        return const Color(0xFFD4C4A8); // Warm cream/tan (School of Athens)
      case 'seneca':
        return const Color(0xFF1C2420); // Dark dramatic background
      case 'laozi':
        return const Color(0xFFD4C8B0); // Beige parchment (ink painting)
      case 'confucius':
        return const Color(0xFFD4C4A0); // Warm tan paper (traditional portrait)
      case 'jesus':
        return const Color(0xFFF5F5F5); // Bright white/off-white
      case 'buddha':
        return const Color(0xFFE8DCC8); // Warm beige/cream (Thangka painting)
      case 'muhammad':
        return const Color(0xFF8B7D5C); // Warm olive-brown
      case 'lincoln':
        return const Color(0xFF6B7B5C); // Muted olive/sage green
      case 'napoleon':
        return const Color(0xFF8B9098); // Gray stormy sky
      case 'steve_jobs':
        return const Color(0xFFF5F5F7); // White/off-white (Apple style)
      case 'sherlock_holmes':
        return const Color(0xFFE0D0B8); // Sepia/beige aged paper
      case 'dumbledore':
        return const Color(0xFF4A5A6A); // Dark blue-gray
      case 'gandhi':
        return const Color(0xFF6B7B8B); // Muted blue-gray
      case 'rumi':
        return const Color(0xFF1A4A8C); // Deep royal blue
      case 'krishna':
        return const Color(0xFF9AD0F5); // Light sky blue
      case 'brahma':
        return const Color(0xFF4A8BE5); // Bright blue
      case 'vishnu':
        return const Color(0xFF2196F3); // Vibrant blue
      case 'tolstoy':
        return const Color(0xFF8B9B8A); // Muted gray-green
      case 'luffy':
        return const Color(0xFF5AC8FA); // Bright sky/ocean blue
      case 'gon_freecss':
        return const Color(0xFF4CAF50); // Bright green
      case 'natsu_dragneel':
        return const Color(0xFFFF9800); // Fiery orange
      case 'izuku_midoriya':
        return const Color(0xFF3A3A4A); // Dark gray-purple
      case 'son_goku':
        return const Color(0xFFB0A090); // Grayish beige
      case 'edward_elric':
        return const Color(0xFF6A7B8C); // Gray-blue
      case 'eren_yeager':
        return const Color(0xFF7EC8E3); // Bright sky blue
      case 'naruto_uzumaki':
        return const Color(0xFF607080); // Muted gray
      case 'tsunayoshi_sawada':
        return const Color(0xFF2A2A30); // Dark gray-black
      case 'tanjiro_kamado':
        return const Color(0xFF7AABA0); // Blue-green sky/mountains
      case 'ichigo_kurosaki':
        return const Color(0xFF6B98C4); // Blue sky with golden clouds
      case 'martin_luther_king':
        return const Color(0xFF5A5A5A); // Gray (black & white photo)
      case 'albert_einstein':
        return const Color(0xFF757575); // Gray (black & white photo)
      case 'julius_caesar':
        return const Color(0xFF4A4A3A); // Dark olive-gray (classical painting)
      case 'aslan':
        return const Color(0xFF3A4A3A); // Dark forest green
      case 'jean_valjean':
        return const Color(0xFF2D3D3D); // Dark teal-gray
      case 'david':
        return const Color(0xFF6A9B7A); // Green outdoor scene
      case 'liu_bei':
        return const Color(0xFF5D4E37); // Dark brown
      case 'cao_cao':
        return const Color(0xFFD4C4A8); // Beige/tan parchment
      case 'zhuge_liang':
        return const Color(0xFFD4C8B0); // Beige scroll background
      default:
        return const Color(0xFF1A1A2E); // Default dark background
    }
  }
}
