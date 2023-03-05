import std/unittest
import bibleTools

suite "Verses":
  test "Parse verse":
    require "Mt 5:17-20".parseBibleVerse == (
      book: "Mt",
      chapter: 5,
      verses: @[17, 18, 19, 20],
      translation: ""
    )
    require "Rm 2:12 pt_yah".parseBibleVerse == (
      book: "Rm",
      chapter: 2,
      verses: @[12],
      translation: "pt_yah"
    )
    require "Rm 8:2-4 pt_yah".parseBibleVerse == (
      book: "Rm",
      chapter: 8,
      verses: @[2, 3, 4],
      translation: "pt_yah"
    )
    require "Mt 6:5 pt_kja2001".parseBibleVerse == (
      book: "Mt",
      chapter: 6,
      verses: @[5],
      translation: "pt_kja2001"
    )
    require "Is 4 pt_kja2001".parseBibleVerse == (
      book: "Is",
      chapter: 4,
      verses: @[],
      translation: "pt_kja2001"
    )
    require "2Tm 4:14".parseBibleVerse == (
      book: "2Tm",
      chapter: 4,
      verses: @[14],
      translation: ""
    )
  test "To Ozzuu Bible URL":
    require "Rev 14:12".parseBibleVerse.inOzzuuBible("en_wyc2014") ==
      "https://bible.ozzuu.com/en_wyc2014/Rev/14#12"
  test "Stringify":
    require $(
      book: "Pv",
      chapter: 29,
      verses: @[27],
      translation: ""
    ) == "Pv 29:27"
    require `$`((
      book: "1Jo",
      chapter: 2,
      verses: @[6],
      translation: "pt_yah"
    ), hebrewTransliteration = false, addTranslation = true) == "1Jo 2:6 pt_yah"
    require `$`((
      book: "At",
      chapter: 2,
      verses: @[21],
      translation: "pt_yah"
    ), hebrewTransliteration = true) == "Ma'asiym (At) 2:21"
    require `$`((
      book: "Mt",
      chapter: 6,
      verses: @[5],
      translation: ""
    ), hebrewTransliteration = true, toLang = ALPortuguese) == "Mattithyahu (Mateus) 6:5"
