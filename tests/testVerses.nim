import std/unittest
import bibleTools

suite "Verses":
  test "Parse verse":
    check "Mt 5:17-20".parseBibleVerse == (
      book: "Mt",
      chapter: 5,
      verses: @[17, 18, 19, 20],
      translation: ""
    )
    check "Rm 2:12 pt_yah".parseBibleVerse == (
      book: "Rm",
      chapter: 2,
      verses: @[12],
      translation: "pt_yah"
    )
    check "Rm 8:2-4 pt_yah".parseBibleVerse == (
      book: "Rm",
      chapter: 8,
      verses: @[2, 3, 4],
      translation: "pt_yah"
    )
    check "Mt 6:5 pt_kja2001".parseBibleVerse == (
      book: "Mt",
      chapter: 6,
      verses: @[5],
      translation: "pt_kja2001"
    )
  test "To Ozzuu Bible URL":
    check "Rev 14:12".parseBibleVerse.inOzzuuBible("en_wyc2014") ==
      "https://bible.ozzuu.com/en_wyc2014/Rev/14#12"
  test "Stringify":
    check $(
      book: "Pv",
      chapter: 29,
      verses: @[27],
      translation: ""
    ) == "Pv 29:27"
    check `$`((
      book: "1Jo",
      chapter: 2,
      verses: @[6],
      translation: "pt_yah"
    ), false, true) == "1Jo 2:6 pt_yah"
