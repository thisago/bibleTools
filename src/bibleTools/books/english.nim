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
    else: "Unknown book name"

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
      of "gen", "ge", "gn", Genesis.toText: Genesis
      of "exod", "exo", "ex", Exodus.toText: Exodus
      of "lev", "le", "lv", Leviticus.toText: Leviticus
      of "num", "nu", "nm", "nb", Numbers.toText: Numbers
      of "deut", "de", "dt", "deu", Deuteronomy.toText: Deuteronomy
      of "josh", "jos", "jsh", Joshua.toText: Joshua
      of "judg", "jdg", "jg", "jdgs", Judges.toText: Judges
      of "rth", "ru", "rut", Ruth.toText: Ruth
      of "s", "sa", "sm", "sam", "stsam", "stsamuel", Samuel1.toText: s.getCorrectByNum(Samuel1, Samuel2)
      of "ikgs", "iki": Kings1
      of "iikgs", "iiki": Kings2
      of "kg", "kgs", "ki", "k", "kin", "stkgs", "stkings", Kings1.toText: s.getCorrectByNum(Kings1, Kings2)
      of "ich", "ichr", "ichron": Chronicles1
      of "iich", "iichr", "iichron": Chronicles2
      of "chron", "ch", "chr", "stchron", "stchroniclesfirstchron", Chronicles1.toText: s.getCorrectByNum(Chronicles1, Chronicles2)
      of "neh", "ne", Nehemiah.toText: Nehemiah
      of "esth", "est", Esther.toText: Esther
      of "jb", Job.toText: Job
      of "psalm", "pslm", "ps", "psa", "psm", "pss", Psalms.toText: Psalms
      of "prov", "pro", "pr", "prv", Proverbs.toText: Proverbs
      of "eccles", "eccle", "ecc", "ec", "qoh", Ecclesiastes.toText: Ecclesiastes
      of "songofsongs", "song", "so", "sos", "canticleofcanticles", "canticles", "cant", "sg", "sng", SongOfSolomon.toText: SongOfSolomon
      of "is", "isa", Isaiah.toText: Isaiah
      of "jer", "je", "jr", Jeremiah.toText: Jeremiah
      of "epjer", "epi", "lje", EpistleOfJeremiah.totext: EpistleOfJeremiah
      of "lam", "la", "lm", Lamentations.toText: Lamentations
      of "ezek", "eze", "ezk", Ezekiel.toText: Ezekiel
      of "dan", "da", "dn", Daniel.toText: Daniel
      of "azar", "sy", PrayerOfAzariah.toText:
        if s.text == "sy" and s.numbers.len == 0: Unknown
        else: PrayerOfAzariah
      of "hos", "ho", "hs", Hosea.toText: Hosea
      of "joe", "jl", "jol", Joel.toText: Joel
      of "am", "amo", Amos.toText: Amos
      of "obad", "ob", "oba", Obadiah.toText: Obadiah
      of "jnh", "jon", "jona", Jonah.toText: Jonah
      of "mic", "mc", Micah.toText: Micah
      of "nah", "na", "nam", Nahum.toText: Nahum
      of "hab", "hb", Habakkuk.toText: Habakkuk
      of "zeph", "zep", "zp", "zph", Zephaniah.toText: Zephaniah
      of "hag", "hg", Haggai.toText: Haggai
      of "zech", "zec", "zc", "zch", Zechariah.toText: Zechariah
      of "mal", "ml", Malachi.toText: Malachi
      of "tob", "tb", Tobit.toText: Tobit
      of "jdth", "jdt", "jth", Judith.toText: Judith
      of "addesth", "addes", "restofesther", "therestofesther", "aes", "esthgr", "gresth", "esg", AdditionsToEsther.toText: AdditionsToEsther
      of "wisdofsol", "wis", "ws", "wisdom", WisdomOfSolomon.toText: WisdomOfSolomon
      of "sir", "ecclesiasticus", "ecclus", "eccl", Sirach.toText: Sirach
      of "baruch", "bar", Baruk1.toText:
        if s.numbers == "": s.numbers = "1"
        s.getCorrectByNum(Baruk1, Baruk2)
      of "sus", Susanna.toText: Susanna
      of "bel", BelAndTheDragon.toText: BelAndTheDragon
      # of "ima", "imac", "imacc", "imaccabees": Maccabees1
      # of "iima", "iimac", "iimacc", "iimaccabees": Maccabees2
      # of "iiima", "iiimac", "iiimacc", "iiimaccabees": Maccabees3
      # of "ivma", "ivmac", "ivmacc", "ivmaccabees": Maccabees4
      of "mac", "m", "ma", "macc", "stmaccabees", Maccabees1.toText: s.getCorrectByNum(Maccabees1, Maccabees2, Maccabees3, Maccabees4)
      # of "ies", "iesd", "iesdr", "iesdras": Ezra # correct? not `Esdras`?
      of "ezr", "ez", "esdr", "esd", "es", "stesdras", Ezra.toText:
        if s.text == "es" and s.numbers == "":
          Esther
        else:
          if s.numbers == "": s.numbers = "1"
          s.getCorrectByNum({Ezra: 1, Ezra3: 3, Ezra4: 4})
      of "profman", "prman", "pma", "prayerofmanasses", "man", PrayerOfManasseh.toText: PrayerOfManasseh
      of "matt", "mt", "mat", Matthew.toText: Matthew
      of "mrk", "mar", "mk", "mr", Mark.toText: Mark
      of "luk", "lk", Luke.toText: Luke
      of "act", "ac", Acts.toText: Acts
      of "rom", "ro", "rm", Romans.toText: Romans
      # of "ico", "icor", "icorinthians": Corinthians1
      # of "iico", "iicor", "iicorinthians": Corinthians2
      of "cor", "co", "ndcorinthians", Corinthians1.toText:
        if s.text == "co" and s.numbers == "": Colossians
        else: s.getCorrectByNum(Corinthians1, Corinthians2)
      of "gal", "ga", "gl", Galatians.toText: Galatians
      of "ephes", "eph", Ephesians.toText: Ephesians
      of "phil", "php", "pp", Philippians.toText: Philippians
      of "col", Colossians.toText: Colossians
      # of "ith", "ithes", "ithess", "ithessalonians": Thessalonians1
      # of "iith", "iithes", "iithess", "iithessalonians": Thessalonians2
      of "ths", "thess", "th", "thes", "stthess", "stthessalonians", Thessalonians1.toText: s.getCorrectByNum(Thessalonians1, Thessalonians2)
      of "iti", "itim", "itimothy": Timothy1
      of "iiti", "iitim", "iitimothy": Timothy2
      of "tim", "ti", "sttim", "sttimothy", "tm", Timothy1.toText:
        if s.text == "ti" and s.numbers == "": Titus
        else: s.getCorrectByNum(Timothy1, Timothy2)
      of "tit", Titus.toText: Titus
      of "lao", Laodiceans.toText: Laodiceans
      of "philem", "phm", "pm", "phlm", Philemon.toText: Philemon
      of "heb", Hebrews.toText: Hebrews
      of "jas", "jm", "jms", "jam", James.toText: James
      # of "ipe", "ipet", "ipt", "ipeter": Peter1
      # of "iipe", "iipet", "iipt", "iipeter": Peter2
      of "pet", "pe", "pt", "p", "stpeter", Peter1.toText: s.getCorrectByNum(Peter1, Peter2)
      # of "ijn", "ijo", "ijoh", "ijhn", "ijohn": John1
      # of "iijn", "iijo", "iijoh", "iijhn", "iijohn": John2
      # of "iiijn", "iiijo", "iiijoh", "iiijhn", "iiijohn": John3
      of "jn", "jo", "joh", "jhn", "j", "stjohn", John.toText:
        if s.numbers == "": John
        else: s.getCorrectByNum(John1, John2, John3)
      of "jud", "jd", "judi", Jude.toText: Jude
      of "rev", "re", "therevelation", "rv", Revelation.toText: Revelation
      else: Unknown

      # Add later:
      # of "letjer", "ltrjer", "lje", LetterOfJeremiah.toText: LetterOfJeremiah
      # of "addpsalm", "addps", AdditionalPsalm.toText: AdditionalPsalm
      # of "2esdr", "2esd", "iies", "2es", "iiesd", "2esd", "iiesdr", "2esdr", "iiesdras", "2esdras", "2ndesdras", "secondesdras", Esdras2.toText: Esdras2
      # of "songofthree", "songthr", "thesongofthreeyouths", "praz", "prayerofazariah", "azariah", "thesongofthethreeholychildren", "thesongofthreejews", "songofthethreeholychildren", "songofthr", "songofthreechildren", "songofthreejews", SongOfThreeYouths.toText: SongOfThreeYouths
      # of "ode", Ode.toText: Ode
      # of "pssolomon", "pssol", "psalmssolomon", "pssol", PsalmsOfSolomon.toText: PsalmsOfSolomon
      # of "laodiceans", "laod", "eplaod", "epistlaodiceans", "epistlelaodiceans", "epistletolaodiceans", EpistleToTheLaodiceans.toText: EpistleToTheLaodiceans
