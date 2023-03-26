import bibleTools/books/base

func en*(self: BibleBook): string =
  ## Get the english name of given book
  case self:
    of Genesis: "Genesis"
    of Exodus: "Exodus"
    of Leviticus: "Leviticus"
    of Numbers: "Numbers"
    of Deuteronomy: "Deuteronomy"
    of Jubilees: "Jubilees"
    of Enoch: "Enoch"
    of Jasher: "Jasher"
    of Joshua: "Joshua"
    of Judges: "Judges"
    of Samuel1: "1 Samuel"
    of Samuel2: "2 Samuel"
    of Kings1: "1 Kings"
    of Kings2: "2 Kings"
    of Isaiah: "Isaiah"
    of Jeremiah: "Jeremiah"
    of EpistleOfJeremiah: "Epistle Of Jeremiah"
    of Ezekiel: "Ezekiel"
    of Tobit: "Tobit"
    of Baruk1: "1 Baruk"
    of Baruk2: "2 Baruk"
    of Hosea: "Hosea"
    of Joel: "Joel"
    of Amos: "Amos"
    of Obadiah: "Obadiah"
    of Jonah: "Jonah"
    of Micah: "Micah"
    of Nahum: "Nahum"
    of Habakkuk: "Habakkuk"
    of Zephaniah: "Zephaniah"
    of Haggai: "Haggai"
    of Zechariah: "Zechariah"
    of Malachi: "Malachi"
    of Psalms: "Psalms"
    of Proverbs: "Proverbs"
    of Job: "Job"
    of WisdomOfSolomon: "Wisdom Of Solomon"
    of Sirach: "Sirach"
    of SongOfSolomon: "Song Of Solomon"
    of Ruth: "Ruth"
    of Lamentations: "Lamentations"
    of Ecclesiastes: "Ecclesiastes"
    of Esther: "Esther"
    of AdditionsToEsther: "Additions To Esther"
    of Judith: "Judith"
    of Chronicles1: "1 Chronicles"
    of Chronicles2: "2 Chronicles"
    of PrayerOfManasseh: "Prayer Of Manasseh"
    of Daniel: "Daniel"
    of PrayerOfAzariah: "Prayer Of Azariah"
    of Susanna: "Susanna"
    of BelAndTheDragon: "Bel And The Dragon"
    of Ezra: "Ezra"
    of Nehemiah: "Nehemiah"
    of Ezra3: "3 Ezra"
    of Ezra4: "4 Ezra"
    of Maccabees1: "1 Maccabees"
    of Maccabees2: "2 Maccabees"
    of Maccabees3: "3 Maccabees"
    of Maccabees4: "4 Maccabees"
    of Matthew: "Matthew"
    of Mark: "Mark"
    of Luke: "Luke"
    of Acts: "Acts"
    of James: "James"
    of Peter1: "1 Peter"
    of Peter2: "2 Peter"
    of Jude: "Jude"
    of Timothy1: "1 Timothy"
    of Titus: "Titus"
    of Thessalonians1: "1 Thessalonians"
    of Thessalonians2: "2 Thessalonians"
    of Romans: "Romans"
    of Galatians: "Galatians"
    of Timothy2: "2 Timothy"
    of Corinthians1: "1 Corinthians"
    of Corinthians2: "2 Corinthians"
    of Ephesians: "Ephesians"
    of Philippians: "Philippians"
    of Colossians: "Colossians"
    of Philemon: "Philemon"
    of Hebrews: "Hebrews"
    of John: "John"
    of John1: "1 John"
    of John2: "2 John"
    of John3: "3 John"
    of Revelation: "Revelation"
    of Laodiceans: "Laodiceans"
    of UnknownBook: "Unknown book name"

func identifyBibleBookEn*(bookName: string): BibleBook =
  ## Tries to identify a book name with given name or abbreviation\
  ## Based on https://www.bc.edu/content/dam/files/research_sites/cjl/pdf/Biblical%20Abbreviations_SBL%20Handbook.pdf and https://support.logos.com/hc/en-us/articles/360021229852-Bible-Book-Abbreviations
  func toText(self: BibleBook): string {.inline.} =
    self.en.normalize.text

  var s = bookName.normalize
  for (t, n) in [("first", 1), ("second", 2), ("third", 3), ("fourth", 4)]:
    s.isANumber(t, n)
  result =
    case s.text:
      of "gen", "ge", "gn", Genesis.toText: s.noNum Genesis
      of "exod", "exo", "ex", Exodus.toText: s.noNum Exodus
      of "lev", "le", "lv", Leviticus.toText: s.noNum Leviticus
      of "num", "nu", "nm", "nb", Numbers.toText: s.noNum Numbers
      of "deut", "de", "dt", "deu", Deuteronomy.toText: s.noNum Deuteronomy
      of "josh", "jos", "jsh", Joshua.toText: s.noNum Joshua
      of "judg", "jdg", "jg", "jdgs", Judges.toText: s.noNum Judges
      of "rth", "ru", "rut", Ruth.toText: s.noNum Ruth
      of "s", "sa", "sm", "sam", "stsam", "stsamuel", Samuel1.toText:
        s.getCorrectByNum(Samuel1, Samuel2)
      of "ikgs", "iki": Kings1
      of "iikgs", "iiki": Kings2
      of "kg", "kgs", "ki", "k", "kin", "stkgs", "stkings", Kings1.toText:
        s.getCorrectByNum(Kings1, Kings2)
      of "ich", "ichr", "ichron": Chronicles1
      of "iich", "iichr", "iichron": Chronicles2
      of "chron", "ch", "chr", "stchron", "stchroniclesfirstchron", Chronicles1.toText:
        s.getCorrectByNum(Chronicles1, Chronicles2)
      of "neh", "ne", Nehemiah.toText: s.noNum Nehemiah
      of "esth", "est", Esther.toText: s.noNum Esther
      of "jb", Job.toText: s.noNum Job
      of "psalm", "pslm", "ps", "psa", "psm", "pss", Psalms.toText: s.noNum Psalms
      of "prov", "pro", "pr", "prv", Proverbs.toText: s.noNum Proverbs
      of "eccles", "eccle", "ecc", "ec", "qoh", Ecclesiastes.toText: s.noNum Ecclesiastes
      of "songofsongs", "song", "so", "sos", "canticleofcanticles", "canticles", "cant", "sg", "sng", SongOfSolomon.toText: s.noNum SongOfSolomon
      of "is", "isa", Isaiah.toText: s.noNum Isaiah
      of "jer", "je", "jr", Jeremiah.toText: s.noNum Jeremiah
      of "epjer", "epi", "lje", EpistleOfJeremiah.totext: s.noNum EpistleOfJeremiah
      of "lam", "la", "lm", Lamentations.toText: s.noNum Lamentations
      of "ezek", "eze", "ezk", Ezekiel.toText: s.noNum Ezekiel
      of "dan", "da", "dn", Daniel.toText: s.noNum Daniel
      of "azar", "sy", PrayerOfAzariah.toText:
        if s.text == "sy" and s.numbers.len == 0: UnknownBook
        else: PrayerOfAzariah
      of "hos", "ho", "hs", Hosea.toText: s.noNum Hosea
      of "joe", "jl", "jol", Joel.toText: s.noNum Joel
      of "am", "amo", Amos.toText: s.noNum Amos
      of "obad", "ob", "oba", Obadiah.toText: s.noNum Obadiah
      of "jnh", "jon", "jona", Jonah.toText: s.noNum Jonah
      of "mic", "mc", Micah.toText: s.noNum Micah
      of "nah", "na", "nam", Nahum.toText: s.noNum Nahum
      of "hab", "hb", Habakkuk.toText: s.noNum Habakkuk
      of "zeph", "zep", "zp", "zph", Zephaniah.toText: s.noNum Zephaniah
      of "hag", "hg", Haggai.toText: s.noNum Haggai
      of "zech", "zec", "zc", "zch", Zechariah.toText: s.noNum Zechariah
      of "mal", "ml", Malachi.toText: s.noNum Malachi
      of "tob", "tb", Tobit.toText: s.noNum Tobit
      of "jdth", "jdt", "jth", Judith.toText: s.noNum Judith
      of "addesth", "addes", "restofesther", "therestofesther", "aes", "esthgr", "gresth", "esg", AdditionsToEsther.toText: s.noNum AdditionsToEsther
      of "wisdofsol", "wis", "ws", "wisdom", WisdomOfSolomon.toText: s.noNum WisdomOfSolomon
      of "sir", "ecclesiasticus", "ecclus", "eccl", Sirach.toText: s.noNum Sirach
      of "baruch", "bar", Baruk1.toText:
        if s.numbers == "": s.numbers = "1"
        s.getCorrectByNum(Baruk1, Baruk2)
      of "sus", Susanna.toText: s.noNum Susanna
      of "bel", BelAndTheDragon.toText: s.noNum BelAndTheDragon
      of "mac", "m", "ma", "macc", "stmaccabees", Maccabees1.toText:
        s.getCorrectByNum(Maccabees1, Maccabees2, Maccabees3, Maccabees4)
      of "ezr", "ez", "esdr", "esd", "es", "stesdras", Ezra.toText:
        if s.text == "es":
          s.noNum Esther
        else:
          if s.numbers == "": s.numbers = "1"
          s.getCorrectByNum({Ezra: 1, Ezra3: 3, Ezra4: 4})
      of "profman", "prman", "pma", "prayerofmanasses", "man", "mns", PrayerOfManasseh.toText: s.noNum PrayerOfManasseh
      of "matt", "mt", "mat", Matthew.toText: s.noNum Matthew
      of "mrk", "mar", "mk", "mr", Mark.toText: s.noNum Mark
      of "luk", "lk", Luke.toText: s.noNum Luke
      of "act", "ac", Acts.toText: s.noNum Acts
      of "rom", "ro", "rm", Romans.toText: s.noNum Romans
      # of "ico", "icor", "icorinthians": Corinthians1
      # of "iico", "iicor", "iicorinthians": Corinthians2
      of "cor", "co", "ndcorinthians", Corinthians1.toText:
        if s.text == "co" and s.numbers == "": Colossians
        else: s.getCorrectByNum(Corinthians1, Corinthians2)
      of "gal", "ga", "gl", Galatians.toText: s.noNum Galatians
      of "ephes", "eph", Ephesians.toText: s.noNum Ephesians
      of "phil", "php", "pp", Philippians.toText: s.noNum Philippians
      of "col", Colossians.toText: s.noNum Colossians
      # of "ith", "ithes", "ithess", "ithessalonians": Thessalonians1
      # of "iith", "iithes", "iithess", "iithessalonians": Thessalonians2
      of "ths", "thess", "th", "thes", "stthess", "stthessalonians", Thessalonians1.toText:
        s.getCorrectByNum(Thessalonians1, Thessalonians2)
      of "iti", "itim", "itimothy": Timothy1
      of "iiti", "iitim", "iitimothy": Timothy2
      of "tim", "ti", "sttim", "sttimothy", "tm", Timothy1.toText:
        if s.text == "ti" and s.numbers == "": Titus
        else: s.getCorrectByNum(Timothy1, Timothy2)
      of "tit", Titus.toText: s.noNum Titus
      of "lao", Laodiceans.toText: s.noNum Laodiceans
      of "philem", "phm", "pm", "phlm", Philemon.toText: s.noNum Philemon
      of "heb", Hebrews.toText: s.noNum Hebrews
      of "jas", "jm", "jms", "jam", James.toText: s.noNum James
      # of "ipe", "ipet", "ipt", "ipeter": Peter1
      # of "iipe", "iipet", "iipt", "iipeter": Peter2
      of "pet", "pe", "pt", "p", "stpeter", Peter1.toText:
        s.getCorrectByNum(Peter1, Peter2)
      # of "ijn", "ijo", "ijoh", "ijhn", "ijohn": John1
      # of "iijn", "iijo", "iijoh", "iijhn", "iijohn": John2
      # of "iiijn", "iiijo", "iiijoh", "iiijhn", "iiijohn": John3
      of "jn", "jo", "joh", "jhn", "stjohn", John.toText:
        if s.numbers == "": John
        else: s.getCorrectByNum(John1, John2, John3)
      of "jud", "jd", "judi", "jde", Jude.toText: s.noNum Jude
      of "rev", "re", "therevelation", "rv", Revelation.toText: s.noNum Revelation
      of "jub", Jubilees.toText: s.noNum Jubilees
      of "eno", Enoch.toText: s.noNum Enoch
      of "jash", "jsr", Jasher.toText: s.noNum Jasher
      else: UnknownBook

      # Add later:
      # of "letjer", "ltrjer", "lje", LetterOfJeremiah.toText: s.noNum LetterOfJeremiah
      # of "addpsalm", "addps", AdditionalPsalm.toText: s.noNum AdditionalPsalm
      # of "2esdr", "2esd", "iies", "2es", "iiesd", "2esd", "iiesdr", "2esdr", "iiesdras", "2esdras", "2ndesdras", "secondesdras", Esdras2.toText: s.noNum Esdras2
      # of "songofthree", "songthr", "thesongofthreeyouths", "praz", "prayerofazariah", "azariah", "thesongofthethreeholychildren", "thesongofthreejews", "songofthethreeholychildren", "songofthr", "songofthreechildren", "songofthreejews", SongOfThreeYouths.toText: s.noNum SongOfThreeYouths
      # of "ode", Ode.toText: s.noNum Ode
      # of "pssolomon", "pssol", "psalmssolomon", "pssol", PsalmsOfSolomon.toText: s.noNum PsalmsOfSolomon
      # of "laodiceans", "laod", "eplaod", "epistlaodiceans", "epistlelaodiceans", "epistletolaodiceans", EpistleToTheLaodiceans.toText: s.noNum EpistleToTheLaodiceans

func enAbbr*(self: BibleBook): string =
  ## Returns a short version of book
  # Based in http://bmfg.org/bmfg-about/bible-books-common-abbreviations/ and https://www.biblestudytools.com/resources/abbreviation-guide.html
  case self:
    of Genesis: "Gen"
    of Exodus: "Exo"
    of Leviticus: "Lev"
    of Numbers: "Num"
    of Deuteronomy: "Deu"
    of Joshua: "Jos"
    of Judges: "Jdg"
    of Ruth: "Rut"
    of Samuel1: "1Sm"
    of Samuel2: "2Sm"
    of Kings1: "1Ki"
    of Kings2: "2Ki"
    of Chronicles1: "1Ch"
    of Chronicles2: "2Ch"
    of Nehemiah: "Neh"
    of Esther: "Est"
    of Job: "Job"
    of Psalms: "Psa"
    of Proverbs: "Pro"
    of Ecclesiastes: "Ecc"
    of SongOfSolomon: "Sos"
    of Isaiah: "Isa"
    of Jeremiah: "Jer"
    of EpistleOfJeremiah: "Epi"
    of Lamentations: "Lam"
    of Ezekiel: "Eze"
    of Daniel: "Dan"
    of Hosea: "Hos"
    of Joel: "Joe"
    of Amos: "Amo"
    of Obadiah: "Oba"
    of Jonah: "Jon"
    of Micah: "Mic"
    of Nahum: "Nah"
    of Habakkuk: "Hab"
    of Zephaniah: "Zep"
    of Haggai: "Hag"
    of Zechariah: "Zec"
    of Malachi: "Mal"
    of Tobit: "Tob"
    of Judith: "Jdt"
    of AdditionsToEsther: "Aes"
    of WisdomOfSolomon: "Wis"
    of Sirach: "Sir"
    of Baruk1: "Bar"
    of Baruk2: "2Bar"
    of Susanna: "Sus"
    of BelAndTheDragon: "Bel"
    of Maccabees1: "1ma"
    of Maccabees2: "2ma"
    of Ezra: "1Ez"
    of Ezra3: "3Ez"
    of Ezra4: "4Ez"
    of PrayerOfManasseh: "Mns"
    of Maccabees3: "3ma"
    of Maccabees4: "4ma"
    of Matthew: "Mat"
    of Mark: "Mar"
    of Luke: "Luk"
    of John: "Joh"
    of Acts: "Act"
    of Romans: "Rom"
    of Corinthians1: "1Co"
    of Corinthians2: "2Co"
    of Galatians: "Gal"
    of Ephesians: "Eph"
    of Philippians: "Php"
    of Colossians: "Col"
    of Thessalonians1: "1Th"
    of Thessalonians2: "2Th"
    of Timothy1: "1Ti"
    of Timothy2: "2Ti"
    of Titus: "Tit"
    of Philemon: "Phm"
    of Hebrews: "Heb"
    of James: "Jam"
    of Peter1: "1Pe"
    of Peter2: "2Pe"
    of John1: "1Jo"
    of John2: "2Jo"
    of John3: "3Jo"
    of Jude: "Jde"
    of Revelation: "Rev"
    of Jubilees: "Jub"
    of Enoch: "Eno"
    of Jasher: "Jsr"
    of PrayerOfAzariah: "Aza"
    of Laodiceans: "Lao"
    of UnknownBook: "???"
