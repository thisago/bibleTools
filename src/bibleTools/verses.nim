from std/nre import re, find, get, captures, `[]`, toSeq
from std/options import Option, UnpackDefect
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

let verseRegex* = re"([^:]+) ([0-9]{1,3})(:[0-9,\- ]+)? ?([A-z]{2}_[A-z0-9]+)?"

proc get[T](self: var Option[T]): T {.inline.} =
  result = ""
  try: result = options.get self
  except UnpackDefect: discard


proc parseBibleVerse*(verse: string): BibleVerse =
  ## Parses the verse reference to a `BibleVerse` tuple
  var parts = verse.find(verseRegex).get.captures.toSeq
  result.book = parts[0].get.toLowerAscii
  result.book[0] = result.book[0].toUpperAscii
  result.chapter = parts[1].get.parseInt
  var verse = parts[2].get.strip
  if verse.len > 0:
    verse = verse[1..^1]
    if "-" in verse:
      let
        verseParts = verse.split "-"
        start = verseParts[0].strip.parseInt
        to = verseParts[1].strip.parseInt
      for i in start..to:
        result.verses.add i
    else:
      for verse in verse.replace(", ", ",").split ",":
        result.verses.add verse.strip.parseInt
  result.translation = parts[3].get.strip


func `$`*(v: BibleVerse; hebrewTransliteration = false; addTranslation = false): string =
  let verses = v.verses.join ","
  var bookName = v.book
  if hebrewTransliteration:
    let transliterated = bookName.identifyBibleBookAllLangs.hebrewTransliteration
    if transliterated.len > 0:
      bookName = fmt"{transliterated} ({v.book})"
  result = fmt"{bookName} {v.chapter}:{verses}"
  if addTranslation and v.translation.len > 0:
    result.add fmt" {v.translation}"

func inOzzuuBible*(v: BibleVerse; defaultTranslation = "pt_yah"): string =
  ## Returns a URL to see the verse in Ozzuu Bible
  var translation = defaultTranslation
  if v.translation.len > 0:
    translation = v.translation
  result = fmt"https://bible.ozzuu.com/{translation}/{v.book}/{v.chapter}"
  if v.verses.len > 0:
    result.add fmt"#{v.verses[0]}"
