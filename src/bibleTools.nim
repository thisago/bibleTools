
import bibleTools/base
import bibleTools/[
  he, en, pt
]

export he, en, pt, BibleBook

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

func identifyBibleBookAllLangs*(s: string): BibleBook =
  ## Try to indentify the book name in all supported languages
  result = s.identifyBibleBookEn
  if result != Unknown: return
  result = s.identifyBibleBookPt
