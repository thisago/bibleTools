import std/unittest
import bibleTools

suite "Verses":
  test "Parse verse":
    require "Mt 5:17-20".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Matthew, ALPortuguese),
      chapter: 5,
      verses: @[17, 18, 19, 20],
      translation: ""
    )
    require "Rm 2:12 pt_yah".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Romans, ALPortuguese),
      chapter: 2,
      verses: @[12],
      translation: "pt_yah"
    )
    require "Rm 8:2-4 pt_yah".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Romans, ALPortuguese),
      chapter: 8,
      verses: @[2, 3, 4],
      translation: "pt_yah"
    )
    require "Mt 6:5 pt_kja2001".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Matthew, ALPortuguese),
      chapter: 6,
      verses: @[5],
      translation: "pt_kja2001"
    )
    require "Is 4 pt_kja2001".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Isaiah, ALPortuguese),
      chapter: 4,
      verses: @[],
      translation: "pt_kja2001"
    )
    require "2Tm 4:14".parseBibleVerse == BibleVerse(
      book: AnyLangBook (Timothy2, ALPortuguese),
      chapter: 4,
      verses: @[14],
      translation: ""
    )
  test "To Ozzuu Bible URL":
    require "Rev 14:12".parseBibleVerse.inOzzuuBible("en_wyc2014") ==
      "https://bible.ozzuu.com/en_wyc2014/Rev/14#12"
  test "Stringify":
    require $BibleVerse(
      book:  (Proverbs, ALPortuguese),
      chapter: 29,
      verses: @[27],
      translation: ""
    ) == "Pv 29:27"
    require `$`(
      BibleVerse(
        book: (John1, ALPortuguese),
        chapter: 2,
        verses: @[6],
        translation: "pt_yah"
      ),
      hebrewTransliteration = false,
      addTranslation = true
    ) == "1Jo 2:6 pt_yah"
    require `$`(
      BibleVerse(
        book: (Acts, ALPortuguese),
        chapter: 2,
        verses: @[21],
        translation: "pt_yah"
      ),
      hebrewTransliteration = true
    ) == "Ma'asiym (At) 2:21"
    require `$`(
      BibleVerse(
        book: (Matthew, ALPortuguese),
        chapter: 6,
        verses: @[5],
        translation: ""
      ),
      hebrewTransliteration = true,
      shortBook = false
    ) == "Mattithyahu (Mateus) 6:5"
    require `$`(
      BibleVerse(
        book: (Revelation, ALPortuguese),
        chapter: 1,
        verses: @[1,2,3,4,5,6,7,8,9],
        translation: ""
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
