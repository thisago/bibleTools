# Changelog

## Version 1.2.1 (2023/04/07)

- Bulk verse parsing now returns the raw and parsed verse

## Version 1.2.0 (2023/04/07)

- Changed `Revelation` portuguese book abbreviation to `Ap`
- Added default Ozzuu Bible translation for each language
- Added bulk verse parsing

---

## Version 1.1.0 (2023/04/07)

- In verse parsing added a error field to inform if there's an error in parsing
- Now the verse regExp wants the whole string

---

## Version 1.0.4 (26/03/2023)

- Fixed Mark portuguese identification (closes #12)
- Disable number ignoring for books that doesn't have it: like `1Gn`
- Removed `j` from John identification (closes #14)

---

## Version 1.0.3 (26/03/2023)

- Fixed `jó` (Job) and `jo` (John) abbreviation identification

---

## Version 1.0.2 (26/03/2023)

- Inverted the language order of `identifyBibleBook`

---

## Version 1.0.1 (22/03/2023)

- Reduced min Nim version from devel to stable

---

## Version 1.0.0 (21/03/2023)

**BREAKING CHANGE**

- Added mandatory book identification in verse parsing
- Added short or extended book name in verse stringify
- Restructured the code
- Added `AnyLangBook`, a tuple returned by `identifyBibleBook` that saves the
  language and book enum
- Added `attr` and `name` to get from a `AnyLangBook`

---

## Version 0.10.0 (21/03/2023)

- Added hebrew names of canon books

---

## Version 0.9.0 (21/03/2023)

- Added `mns` to `BibleBook.PrayerOfManasseh` english identification
- Added `jde` to `BibleBook.Jude` english identification
- Added `bel` to `BibleBook.BelAndTheDragon` portuguese identification
- Added `enAbbr` and `ptAbbr` to get the book abbreviation

---

## Version 0.8.1 (2023/03/21)

- Fixed syntax error in english book submodule
- Fixed JS crash when regex not matches

---

## Version 0.8.0 (2023/03/21)

- Added support to Javascript backend (closes #7)

---

## Version 0.7.3 (2023/03/05)

- In verse parsing
  - Fixed book name title case
  - Added strip in book name

---

## Version 0.7.2 (2023/02/27)

- Fixed James book in portuguese

---

## Version 0.7.1 (2023/02/26)

- Fixed verse stringify

---

## Version 0.7.0 (2023/02/26)

- Fixed portuguese stringify book names
- Added more tests
- Added option to enable book name translation in verse stringify function
- Renamed books submodules

---

## Version 0.6.1 (2023/02/25)

- Fixed `verses.inOzzuuBible` verse adding

---

## Version 0.6.0 (2023/02/25)

- Added support to reference without verse

---

## Version 0.5.1 (2023/02/25)

- Fixed verse parsing (allowed numbers in translation)

---

## Version 0.5.0 (2023/02/23)

- Fixed verse stringify function

---

## Version 0.4.0 (2023/02/22)

- Added an option in `BibleVerse` stringify function to show the verse translation (default is false)

---

## Version 0.3.0 (2023/02/22)

- Added verses manipulation
- Added verses tests
- Added examples in readme
- More fixes

---

## Version 0.2.0 (2023/02/21)

- Moved tests to their own file
- Fixed identification for `pt` and `en`
- Added `Laodiceans` book
- fixed missing exports

---

## Version 0.1.0 (2023/02/20)

- Added bible book identification, and much more!
- Init
