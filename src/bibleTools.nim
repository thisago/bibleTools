
import bibleTools/base
import bibleTools/[
  he, en, pt
]

export he, en, pt

const canonBooks* = [Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, Samuel1, Samuel2, Kings1, Kings2, Chronicles1, Chronicles2, Ezra, Nehemiah, Esther, Job, Psalms, Proverbs, Ecclesiastes, SongOfSolomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, Corinthians1, Corinthians2, Galatians, Ephesians, Philippians, Colossians, Thessalonians1, Thessalonians2, Timothy1, Timothy2, Titus, Philemon, Hebrews, James, Peter1, Peter2, John1, John2, John3, Jude, Revelation]
const deuterocanonical* = [Tobit, Judith, Maccabees1, Maccabees2, WisdomOfSolomon, Sirach, Baruk1]

func isCanon*(self: BibleBook; catholic = false): bool =
  ## Returns if book is canonical
  result = self in canonBooks
  if not result and catholic:
    result = self in deuterocanonical

type
  IdentifyBookNameLang* = enum
    English, Portuguese

func identifyBookNameAllLangs*(s: string): BibleBook =
  ## Try to indentify the book name in all supported languages
  result = s.identifyBibleBookEn
  if result != Unknown: return
  result = s.identifyBibleBookPt


when isMainModule:
  const abbreviations = ["Gn", "Gen", "GENESIS", "Êx", "Ex", "Exo", "EXODUS", "Lv", "Lev", "LEVITICUS", "Nm", "Num", "NUMBERS", "Dt", "Deu", "Deut", "DEUTERONOMY", "Js", "Jos", "Josh", "JOSHUA", "Jz", "Jdg", "Judg", "JUDGES", "Rt", "Ru", "Ruth", "RUT", "RUTH", "1Sm", "1 Sm", "1Sam", "1SA", "1 Sam", "1 SAMUEL", "2Sm", "2 Sm", "2Sam", "2SA", "2 Sam", "2 SAMUEL", "1Rs", "1 Rs", "1Kg", "1Kin", "1 Kin", "1KI", "1Kgs", "1 KINGS", "2Rs", "2 Rs", "2Kg", "2Kin", "2 Kin", "2KI", "2Kgs", "2 KINGS", "1Cr", "1 Cr", "1Ch", "1Chr", "1 Chr", "1CH", "1 CHRONICLES", "2Cr", "2 Cr", "2Ch", "2Chr", "2 Chr", "2CH", "2 CHRONICLES", "Ed", "Esd", "Ezr", "Ezra", "EZRA", "Ne", "Neh", "NEHEMIAH", "1Esd", "1 Esd", "3ES", "Tob", "TOBIT", "Judi", "Judith", "JDT", "JUDITH", "Et", "Est", "Esth", "ESTHER", "Esth Gr", "ESG", "Sl", "Ps", "PSA", "PSALMS", "Pv", "Pr", "Prov", "PRO", "PROVERBS", "Jó", "Jb", "Job", "JOB", "Ec", "Eccl", "ECC", "Eccles", "Ecl", "ECCLESIASTES", "Wis", "Sb", "WISDOM OF SOLOMON", "Eclo", "Sir", "Ecclus", "ECCLESIASTICUS", "Ct", "Sg", "Song", "SNG", "SONG OF SOLOMON", "Is", "ISA", "ISAIAH", "Jr", "Jer", "JEREMIAH", "Lm", "Lam", "LAMENTATIONS", "Epi", "Bar", "Sus", "Ez", "Ezk", "Ezek", "EZEKIEL", "Dn", "Dan", "DANIEL", "Bel", "BEL AND THE DRAGON", "Os", "Hs", "Hos", "HOSEA", "Jl", "Joel", "JOL", "JOEL", "Am", "AMO", "Amos", "AMOS", "Ob", "Obad", "OBA", "Ab", "OBADIAH", "Jn", "Jnh", "JON", "Jonah", "Jona", "JONAH", "Mq", "Mc", "Mic", "MICAH", "Na", "Nah", "NAM", "NAHUM", "Hc", "Hab", "HABAKKUK", "Sf", "Zph", "ZEP", "Zeph", "ZEPHANIAH", "Ag", "Hg", "Hag", "HAGGAI", "Zc", "Zch", "ZEC", "Zech", "ZECHARIAH", "Ml", "Mal", "MALACHI", "Mt", "Mat", "MATTHEW", "Mc", "Mk", "Mark", "MARK", "Lc", "Lk", "LUK", "Luke", "LUKE", "Jo", "Jn", "JOHN", "At", "Ac", "Acts", "ACT", "ACTS", "Rm", "ROM", "ROMANS", "1Co", "1 Co", "1Cor", "1 Cor", "1 CORINTHIANS", "2Co", "2 Co", "2Cor", "2 Cor", "2 CORINTHIANS", "Gl", "Gal", "GALATIANS", "Ef", "Eph", "EPHESIANS", "Fp", "Php", "Phil", "Fl", "PHILIPPIANS", "Cl", "Col", "COLOSSIANS", "1Ts", "1 Ts", "1Th", "1Ths", "1 Thes", "1 THESSALONIANS", "2Ts", "2 Ts", "2Th", "2Ths", "2 Thes", "2 THESSALONIANS", "1Tm", "1 Tm", "1 Tim", "1TI", "1Tim", "1 TIMOTHY", "2Tm", "2 Tm", "2 Tim", "1TI", "2Tim", "2 TIMOTHY", "Tt", "Ti", "Tit", "Titus", "TITUS", "Fm", "Phm", "Phlm", "Philem", "PHILEMON", "Hb", "Heb", "HEBREWS", "Tg", "Jms", "James", "Jas", "Jam", "JAMES", "1Pe", "1 Pe", "1Pt", "1Pet", "1Pd", "1 Pet", "1 PETER", "2Pe", "2 Pe", "2Pt", "2Pet", "2Pd", "2 Pet", "2 PETER", "1Jo", "1 Jo", "1Jn", "1 John", "1 JOHN", "2Jo", "2 Jo", "2Jn", "2 John", "2 JOHN", "3Jo", "3 Jo", "3Jn", "3 John", "3 JOHN", "Jd", "Jude", "Jud", "JUDE", "Ap", "Rv", "Rev", "REVELATION", "MAN", "PrMan", "PRAYER OF MANASSEH", "1MA", "1Mac", "1Mc", "1Mb", "1 MACCABEES", "2MA", "2Mac", "2Mc", "2Mb", "2 MACCABEES"]
  for abbr in abbreviations:
    let book = abbr.identifyBookNameAllLangs
    echo book
    if book == Unknown:
      echo abbr.normalize & " - " & abbr
      quit()
