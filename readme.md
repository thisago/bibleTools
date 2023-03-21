# Bible Tools

Bible tools to manipulate bible references!

## Examples

For more examples, please see the [`tests`](tests)

### Identify books

```nim
doAssert "second bar".identifyBibleBookEn == Baruk2
doAssert "ex".identifyBibleBookEn == Exodus
doAssert "Jo".identifyBibleBookPt == John
```

### Smart book identification

```nim
doAssert "second bar".identifyBibleBook == (Baruk2, ALEnglish)
doAssert "tg".identifyBibleBook == (James, ALPortuguese)
doAssert "1ts".identifyBibleBook == (book: Thessalonians1, lang: ALPortuguese)
```

### Parse verse

```nim
doAssert "Mat 5:17-20".parseBibleVerse == BibleVerse(
  book: (Matthew, ALEnglish),
  chapter: 5,
  verses: @[17, 18, 19, 20],
  translation: ""
)
```

### Stringify verse

```nim
doAssert $BibleVerse(
  book: (Proverbs, ALPortuguese),
  chapter: 29,
  verses: @[27],
  translation: ""
) == "Pv 29:27"
```

### To Ozzuu Bible URL

```nim
doAssert "Revelation 14:12".parseBibleVerse.inOzzuuBible("en_wyc2014") ==
  "https://bible.ozzuu.com/en_wyc2014/Rev/14#12"
```

### More examples!

Please see the tests files to see more examples!

- [books test](tests/testBooks.nim)
- [verses test](tests/testVerses.nim)

## TODO

- [ ] Add documentation
- [-] Add missing hebrew book names
- [ ] Add hebrew transliteration book identification
- [x] Add a function to get the short version of a book

## License

MIT
