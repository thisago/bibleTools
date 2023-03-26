from std/strutils import toLowerAscii, Letters, Digits, strip, parseInt,
                          contains, split
from std/unicode import toRunes, `$`
export contains

from pkg/util/forStr import removeAccent

type
  BibleBook* = enum
    ## List of bible books in Cepher
    UnknownBook, Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Jubilees,
      Enoch, Jasher, Joshua, Judges, Samuel1, Samuel2, Kings1, Kings2, Isaiah,
      Jeremiah, EpistleOfJeremiah, Ezekiel, Tobit, Baruk1, Baruk2, Hosea, Joel,
      Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai,
      Zechariah, Malachi, Psalms, Proverbs, Job, WisdomOfSolomon, Sirach,
      SongOfSolomon, Ruth, Lamentations, Ecclesiastes, Esther,
      AdditionsToEsther, Judith, Chronicles1, Chronicles2, PrayerOfManasseh,
      Daniel, PrayerOfAzariah, Susanna, BelAndTheDragon, Ezra, Nehemiah, Ezra3,
      Ezra4, Maccabees1, Maccabees2, Maccabees3, Maccabees4, Matthew, Mark,
      Luke, Acts, James, Peter1, Peter2, Jude, Timothy1, Titus, Thessalonians1,
      Thessalonians2, Romans, Galatians, Timothy2, Corinthians1, Corinthians2,
      Ephesians, Philippians, Colossians, Laodiceans, Philemon, Hebrews, John,
      John1, John2, John3, Revelation
type
  AvailableLanguages* = enum
    ## Available languages for book identifying
    ALUnknown, ALEnglish, ALPortuguese

# Parsing tools

type NormalizedText* = tuple
  text: string
  numbers: string
  removed: string

func normalize*(s: string): NormalizedText =
  for rune in s.toLowerAscii.toRunes:
    let letter = $rune
    if letter.len == 1:
      let ch = letter[0]
      if ch in Letters:
        result.text.add ch
      elif ch in Digits:
        result.numbers.add ch
    else:
      result.removed.add letter.strip
      for ch in letter.removeAccent:
        if ch in Letters:
          result.text.add ch.toLowerAscii

func getCorrectByNum*(s: NormalizedText;
                        opts: varargs[BibleBook]): BibleBook {.inline.} =
  try: opts[s.numbers.parseInt - 1]
  except ValueError, IndexDefect: UnknownBook

func getCorrectByNum*(s: NormalizedText;
                        opts: openArray[(BibleBook, int)]): BibleBook =
  result = UnknownBook
  try:
    for (book, num) in opts:
      if s.numbers.parseInt == num:
        return book
  except ValueError:
    discard

func isANumber*(s: var NormalizedText; text: string; num: int) =
  ## Remove `text` of `s.text` and add `num` to `s.numbers`
  let parts = s.text.split text
  if parts.len > 1:
    var newText = ""
    s.numbers.add $num
    for part in parts:
      newText.add part
    s.text = newText

func noNum*(s: var NormalizedText; book: BibleBook): BibleBook {.inline.} =
  ## Returns the book if there's no number in `s`
  if s.numbers.len == 0: book
  else: UnknownBook
