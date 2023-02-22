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

### Parse verse

```nim
doAssert "Mt 5:17-20".parseBibleVerse == (
  book: "Mt",
  chapter: 5,
  verses: @[17, 18, 19, 20],
  translation: ""
)
```

### Stringify verse

```nim
doAssert $(
  book: "Pv",
  chapter: 29,
  verses: @[27],
  translation: ""
) == "Pv 29:27"
```

### To Ozzuu Bible URL

```nim
doAssert "Rev 14:12".parseBibleVerse.inOzzuuBible("en_wyc2014") ==
  "https://bible.ozzuu.com/en_wyc2014/Rev/14#12"
```

## TODO

- [ ] Add documentation
- [ ] Add missing hebrew book names
- [ ] Add hebrew transliteration book identification
- [ ] Add a function to get the short version of a book

## License

MIT
