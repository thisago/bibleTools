from std/nre import re, find, get, captures, `[]`
from std/strutils import parseInt, split, replace, join, toUpperAscii,
                          toLowerAscii, contains, strip
from std/strformat import fmt

from bibleTools/books import identifyBibleBookAllLangs, hebrewTransliteration

type
  BibleVerse* = tuple
    book: string
    chapter: int
    verses: seq[int]
    translation: string

let verseRegex* = re"([^:]+) ([0-9]{1,3}):([0-9,\- ]+) ?([A-z]{2}_[A-z]+)?"

proc parseBibleVerse*(verse: string): BibleVerse =
  ## Parses the verse reference to a `BibleVerse` tuple
  var parts = verse.find(verseRegex).get.captures
  result.book = parts[0].toLowerAscii
  result.book[0] = result.book[0].toUpperAscii
  result.chapter = parts[1].parseInt
  if "-" in parts[2]:
    let
      parts = parts[2].split "-"
      start = parts[0].parseInt
      to = parts[1].parseInt
    for i in start..to:
      result.verses.add i
  else:
    for verse in parts[2].replace(", ", ",").split ",":
      result.verses.add verse.strip.parseInt
  try:
    result.translation = parts[3]
  except IndexDefect:
    discard


func `$`*(v: BibleVerse; hebrewTransliteration = false): string =
  let verses = v.verses.join ","
  var bookName = v.book
  if hebrewTransliteration:
    let transliterated = bookName.identifyBibleBookAllLangs.hebrewTransliteration
    if transliterated.len > 0:
      bookName = fmt"{transliterated} ({v.book})"
  result = fmt"{bookName} {v.chapter}:{verses}"
  if v.translation.len > 0:
    result.add fmt" {v.translation}"

func inOzzuuBible*(v: BibleVerse; defaultTranslation = "pt_yah"): string =
  ## Returns a URL to see the verse in Ozzuu Bible
  var translation = defaultTranslation
  if v.translation.len > 0:
    translation = v.translation
  fmt"https://bible.ozzuu.com/{translation}/{v.book}/{v.chapter}#{v.verses[0]}"
