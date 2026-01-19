/// Barrel file for son_goku prompts
/// Exports all language variants for this persona

import 'prompt_en.dart';
import 'prompt_ko.dart';
import 'prompt_ja.dart';
import 'prompt_zh.dart';
import 'prompt_zh_tw.dart';
import 'prompt_ar.dart';
import 'prompt_th.dart';
import 'prompt_ms.dart';
import 'prompt_es.dart';
import 'prompt_de.dart';
import 'prompt_fr.dart';
import 'prompt_hi.dart';
import 'prompt_id.dart';
import 'prompt_pt.dart';
import 'prompt_tr.dart';
import 'prompt_vi.dart';
import 'prompt_ru.dart';
import 'prompt_it.dart';
import 'prompt_pl.dart';
import 'prompt_nl.dart';
import 'prompt_uk.dart';

/// All prompts for son_goku indexed by language code
const Map<String, String> sonGokuPrompts = {
  'en': promptEn,
  'ko': promptKo,
  'ja': promptJa,
  'zh': promptZh,
  'zh_TW': promptZhTw,
  'ar': promptAr,
  'th': promptTh,
  'ms': promptMs,
  'es': promptEs,
  'de': promptDe,
  'fr': promptFr,
  'hi': promptHi,
  'id': promptId,
  'pt': promptPt,
  'tr': promptTr,
  'vi': promptVi,
  'ru': promptRu,
  'it': promptIt,
  'pl': promptPl,
  'nl': promptNl,
  'uk': promptUk,
};
