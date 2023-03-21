when not defined js:
  from std/nre import re, find, get, captures, `[]`, toSeq
else:
  from std/jsre import newRegExp, exec, RegExp

from std/options import Option, UnpackDefect
from std/strutils import parseInt, split, replace, join, toUpperAscii,
                          toLowerAscii, contains, strip, Letters
from std/strformat import fmt

from bibleTools/books import identifyBibleBook, hebrewTransliteration, en, pt,
                              enAbbr, ptAbbr, AvailableLanguages, abbr, name,
                              AnyLangBook

type
  BibleVerse* = object
    book*: AnyLangBook
    chapter*: int
    verses*: seq[int]
    translation*: string

func initBibleVerse*: BibleVerse =
  discard

when defined js:
  template re(s: string): RegExp =
    newRegExp s
  proc get[](self: cstring): string {.inline.} =
    if self.isNil: ""
    else: $self
else:
  proc get[T](self: var Option[T]): T {.inline.} =
    result = ""
    try: result = options.get self
    except UnpackDefect: discard


let verseRegex* = re r"([^:]+) ([0-9]{1,3})(:[0-9,\- ]+)? ?([A-z]{2}_[A-z0-9]+)?"

proc parseBibleVerse*(verse: string): BibleVerse =
  ## Parses the verse reference to a `BibleVerse` tuple
  when defined js:
    var parts = verseRegex.exec(verse)
    if parts.len < 3: return
    parts.delete 0
  else:
    var parts = verse.find(verseRegex).get.captures.toSeq
  result.book = parts[0].get.strip.identifyBibleBook
  result.chapter = parts[1].get.strip.parseInt
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


func `$`*(
  self: BibleVerse;
  hebrewTransliteration = false;
  addTranslation = false;
  maxVerses = 5;
  shortBook = true;
  forceLang = ALUnknown
): string =
  ## Stringify a `BibleVerse` with a lot of options
  if self == initBibleVerse():
    return
  var v = self
  if forceLang != ALUnknown:
    v.book.lang = forceLang
    
  var bookName = if shortBook: v.book.abbr else: v.book.name

  if hebrewTransliteration:
    let transliterated = v.book.book.hebrewTransliteration
    if transliterated.len > 0:
      bookName = fmt"{transliterated} ({bookName})"
  result = fmt"{bookName} {v.chapter}"
  if v.verses.len > 0:
    if v.verses.len > maxVerses:
      result.add fmt":{v.verses[0]}-{v.verses[^1]}"
    else:
      result.add ":" & v.verses.join ","

  if addTranslation and v.translation.len > 0:
    result.add fmt" {v.translation}"

func inOzzuuBible*(v: BibleVerse; defaultTranslation = "pt_yah"): string =
  ## Returns a URL to see the verse in Ozzuu Bible
  var translation = defaultTranslation
  if v.translation.len > 0:
    translation = v.translation
  result = fmt"https://bible.ozzuu.com/{translation}/{v.book.abbr}/{v.chapter}"
  if v.verses.len > 0:
    result.add fmt"#{v.verses[0]}"
