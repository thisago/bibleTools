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
    check $(
      book: "1Jo",
      chapter: 2,
      verses: @[6],
      translation: "pt_yah"
    ) == "1Jo 2:6 pt_yah"
