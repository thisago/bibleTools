import std/unittest
import bibleTools

suite "Verses":
  test "Parse verse":
    require "Mt 5:17-20".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Matthew, ALPortuguese),
      chapter: 5,
      verses: @[17, 18, 19, 20],
      translation: "",
      error: false
    )
    require "Rm 2:12 pt_yah".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Romans, ALPortuguese),
      chapter: 2,
      verses: @[12],
      translation: "pt_yah",
      error: false
    )
    require "Rm 8:2-4 pt_yah".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Romans, ALPortuguese),
      chapter: 8,
      verses: @[2, 3, 4],
      translation: "pt_yah",
      error: false
    )
    require "Mt 6:5 pt_kja2001".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Matthew, ALPortuguese),
      chapter: 6,
      verses: @[5],
      translation: "pt_kja2001",
      error: false
    )
    require "Is 4 pt_kja2001".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Isaiah, ALPortuguese),
      chapter: 4,
      verses: @[],
      translation: "pt_kja2001",
      error: false
    )
    require "2Tm 4:14".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Timothy2, ALPortuguese),
      chapter: 4,
      verses: @[14],
      translation: "",
      error: false
    )
  test "Parse verses":
    let found = "Gen 1:1; exod 2:2; Lv 3:3; êx 3:6".parseBibleVerses
    require found[2].parsed.book.lang == ALPortuguese
    require found[0].parsed.book.lang == ALEnglish
    require $found[1].parsed == "Exo 2:2"
    require found[1].raw == "exod 2:2"
    require $found[3].parsed == "Êx 3:6"
    require $"os 1; 1Co 2".parseBibleVerses[0].parsed == "Os 1"
  test "In Ozzuu Bible URL":
    require "Exo 8:5".parseBibleVerse.inOzzuuBible[24..^1] == "en_KJV1769D/Exo/8#5"
    require "Ex 9:7".parseBibleVerse.inOzzuuBible[24..^1] == "pt_yah/Êx/9#7"
    require "Rev 14:12".parseBibleVerse.inOzzuuBible("en_wyc2014")[24..^1] == "en_wyc2014/Rev/14#12"
  test "Stringify":
    require $BibleVerse(
      book:  (Proverbs, ALPortuguese),
      chapter: 29,
      verses: @[27],
      translation: "",
      error: false
    ) == "Pv 29:27"
    require `$`(
      BibleVerse(
        book: (John1, ALPortuguese),
        chapter: 2,
        verses: @[6],
        translation: "pt_yah",
        error: false
      ),
      hebrewTransliteration = false,
      addTranslation = true
    ) == "1Jo 2:6 pt_yah"
    require `$`(
      BibleVerse(
        book: (Acts, ALPortuguese),
        chapter: 2,
        verses: @[21],
        translation: "pt_yah",
        error: false
      ),
      hebrewTransliteration = true
    ) == "Ma'asiym (At) 2:21"
    require `$`(
      BibleVerse(
        book: (Matthew, ALPortuguese),
        chapter: 6,
        verses: @[5],
        translation: "",
        error: false
      ),
      hebrewTransliteration = true,
      shortBook = false
    ) == "Mattithyahu (Mateus) 6:5"
    require `$`(
      BibleVerse(
        book: (Revelation, ALPortuguese),
        chapter: 1,
        verses: @[1,2,3,4,5,6,7,8,9],
        translation: "",
        error: false
      ),
      hebrewTransliteration = true,
      shortBook = false
    ) == "Chizayon (Revelação) 1:1-9"
    require `$`(
      "Jr 31:31-34".parseBibleVerse,
      hebrewTransliteration = true,
      forceLang = ALPortuguese,
      shortBook = false
    ) == "Yirmeyahu (Jeremias) 31:31,32,33,34"
  test "Verse book correction":
    require $"Jona 1:2".parseBibleVerse == "Jon 1:2" 
    require $"Zph 2:3".parseBibleVerse == "Zep 2:3" 
    require $"Zch 3:4".parseBibleVerse == "Zec 3:4" 
    require $"Esdr 4:5".parseBibleVerse == "1Ez 4:5" 
    require $"Ap. 4:5".parseBibleVerse == "Ap 4:5" 
