from bibleTools/books/base import BibleBook, AvailableLanguages
export BibleBook, AvailableLanguages

import bibleTools/books/[
  hebrew, english, portuguese
]
export hebrew, english, portuguese

const canonBooks* = [Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua,
    Judges, Ruth, Samuel1, Samuel2, Kings1, Kings2, Chronicles1, Chronicles2,
    Ezra, Nehemiah, Esther, Job, Psalms, Proverbs, Ecclesiastes, SongOfSolomon,
    Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah,
    Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi,
    Matthew, Mark, Luke, John, Acts, Romans, Corinthians1, Corinthians2,
    Galatians, Ephesians, Philippians, Colossians, Thessalonians1,
    Thessalonians2, Timothy1, Timothy2, Titus, Philemon, Hebrews, James, Peter1,
    Peter2, John1, John2, John3, Jude, Revelation]
const deuterocanonical* = [Tobit, Judith, Maccabees1, Maccabees2,
    WisdomOfSolomon, Sirach, Baruk1]

func isCanon*(self: BibleBook; catholic = false): bool =
  ## Returns if book is canonical
  result = self in canonBooks
  if not result and catholic:
    result = self in deuterocanonical

type AnyLangBook* = tuple
  book: BibleBook
  lang: AvailableLanguages

func identifyBibleBook*(s: string; lang = ALUnknown): AnyLangBook =
  ## Try to identify the book name in all supported languages
  const parsers = {
    ALPortuguese: identifyBibleBookPt,
    ALEnglish: identifyBibleBookEn,
  }
  result = (UnknownBook, ALUnknown)
  for (parserLanguage, parse) in parsers:
    if lang != ALUnknown and lang != parserLanguage: continue
    result.book = parse s
    result.lang = parserLanguage
    if result.book != UnknownBook: return

func name*(self: AnyLangBook): string =
  ## Get the full name of book based on it's language
  case self.lang:
  of ALEnglish: self.book.en
  of ALPortuguese: self.book.pt
  of ALUnknown: "Unknown book language"

func abbr*(self: AnyLangBook): string =
  ## Get the abbreviation of book based on it's language
  case self.lang:
  of ALEnglish: self.book.enAbbr
  of ALPortuguese: self.book.ptAbbr
  of ALUnknown: "?"
