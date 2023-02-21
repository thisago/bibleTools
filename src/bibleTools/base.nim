from std/strutils import toLowerAscii, Letters, Digits, strip
from pkg/util/forStr import removeAccent

type
  BibleBook* = enum
    ## List of bible books in Cepher
    Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Jubilees, Enoch, Jasher,
        Joshua, Judges, Samuel1, Samuel2, Kings1, Kings2, Isaiah, Jeremiah,
        EpistleOfJeremiah, Ezekiel, Tobit, Baruk1, Baruk2, Hosea, Joel, Amos,
        Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah,
        Malachi, Psalms, Proverbs, Job, WisdomOfSolomon, Sirach,
        SongOfSolomon, Ruth, Lamentations, Ecclesiastes, Esther,
        AdditionsToEsther, Judith, Chronicles1, Chronicles2, PrayerOfManasseh,
        Daniel, PrayerOfAzariah, Susanna, BelAndTheDragon, Ezra, Nehemiah,
        Ezra3, Ezra4, Maccabees1, Maccabees2, Maccabees3, Maccabees4, Matthew,
        Mark, Luke, Acts, James, Peter1, Peter2, Jude, Timothy1, Titus,
        Thessalonians1, Thessalonians2, Romans, Galatians, Timothy2,
        Corinthians1, Corinthians2, Ephesians, Philippians, Colossians,
        Philemon, Hebrews, John, John1, John2, John3, Revelation, Unknown

func normalize*(s: string): string {.inline.} =
  for ch in s.removeAccent.toLowerAscii:
    if ch in Letters + Digits:
      result.add ch
