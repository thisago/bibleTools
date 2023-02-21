import bibleTools/base

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
  ## Based in https://www.bc.edu/content/dam/files/research_sites/cjl/pdf/Biblical%20Abbreviations_SBL%20Handbook.pdf and https://support.logos.com/hc/en-us/articles/360021229852-Bible-Book-Abbreviations
  func toText(self: BibleBook): string {.inline.} =
    self.en.normalize.text

  let s = bookName.normalize
  # result =
  #   case s.text:
  #     of "gen", "ge", "gn", Genesis.toText: Genesis
  #     of "exod", "exo", "ex", Exodus.toText: Exodus
  #     of "lev", "le", "lv", Leviticus.toText: Leviticus
  #     of "num", "nu", "nm", "nb", Numbers.toText: Numbers
  #     of "deut", "de", "dt", "deu", Deuteronomy.toText: Deuteronomy
  #     of "josh", "jos", "jsh", Joshua.toText: Joshua
  #     of "judg", "jdg", "jg", "jdgs", Judges.toText: Judges
  #     of "rth", "ru", "rut", Ruth.toText: Ruth
  #     of "1s", "isa", "1sm", "1sam", "1stsam", "1stsamuel", "firstsam", "firstsamuel", Samuel1.toText: Samuel1
  #     of "2s", "iisa", "2sm", "2sa", "iisam", "2sam", "2ndsam", "2ndsamuel", "secondsam", "secondsamuel", Samuel2.toText: Samuel2
  #     of "1kg", "1kgs", "1ki", "1k", "ikgs", "iki", "1kin", "1stkgs", "1stkings", "firstkgs", "firstkings", Kings1.toText: Kings1
  #     of "2kg", "2kgs", "2ki", "2k", "iikgs", "iiki", "2kin", "2ndkgs", "2ndkings", "secondkgs", "secondkings", Kings2.toText: Kings2
  #     of "1chron", "ich", "1ch", "1chr", "ichr", "ichron", "1stchron", "1stchroniclesfirstchron", "firstchronicles", Chronicles1.toText: Chronicles1
  #     of "2chron", "iich", "2ch", "iichr", "2chr", "iichron", "2ndchron", "2ndchronicles", "secondchron", "secondchronicles", Chronicles2.toText: Chronicles2
  #     of "ezr", "ez", Ezra.toText: Ezra
  #     of "neh", "ne", Nehemiah.toText: Nehemiah
  #     of "esth", "es", "est", Esther.toText: Esther
  #     of "jb", Job.toText: Job
  #     of "psalm", "pslm", "ps", "psa", "psm", "pss", Psalms.toText: Psalms
  #     of "prov", "pro", "pr", "prv", Proverbs.toText: Proverbs
  #     of "eccles", "eccle", "ecc", "ec", "qoh", Ecclesiastes.toText: Ecclesiastes
  #     of "songofsongs", "song", "so", "sos", "canticleofcanticles", "canticles", "cant", "sg", "sng", SongOfSolomon.toText: SongOfSolomon
  #     of "is", Isaiah.toText: Isaiah
  #     of "jer", "je", "jr", Jeremiah.toText: Jeremiah
  #     of "epjer", "epi", EpistleOfJeremiah.totext: EpistleOfJeremiah
  #     of "lam", "la", Lamentations.toText: Lamentations
  #     of "ezek", "eze", "ezk", Ezekiel.toText: Ezekiel
  #     of "dan", "da", "dn", Daniel.toText: Daniel
  #     of "hos", "ho", "hs", Hosea.toText: Hosea
  #     of "joe", "jl", "jol", Joel.toText: Joel
  #     of "am", "amo", Amos.toText: Amos
  #     of "obad", "ob", "oba", Obadiah.toText: Obadiah
  #     of "jnh", "jon", "jona", Jonah.toText: Jonah
  #     of "mic", "mc", Micah.toText: Micah
  #     of "nah", "na", "nam", Nahum.toText: Nahum
  #     of "hab", "hb", Habakkuk.toText: Habakkuk
  #     of "zeph", "zep", "zp", "zph", Zephaniah.toText: Zephaniah
  #     of "hag", "hg", Haggai.toText: Haggai
  #     of "zech", "zec", "zc", "zch", Zechariah.toText: Zechariah
  #     of "mal", "ml", Malachi.toText: Malachi
  #     of "tob", "tb", Tobit.toText: Tobit
  #     of "jdth", "jdt", "jth", Judith.toText: Judith
  #     of "addesth", "addes", "restofesther", "therestofesther", "aes", "esthgr", "gresth", "esg", AdditionsToEsther.toText: AdditionsToEsther
  #     of "wisdofsol", "wis", "ws", "wisdom", WisdomOfSolomon.toText: WisdomOfSolomon
  #     of "sir", "ecclesiasticus", "ecclus", "eccl", Sirach.toText: Sirach
  #     of "baruch", "bar", "1bar", Baruk1.toText: Baruk1
  #     of "2bar", Baruk2.toText: Baruk2
  #     # of "letjer", "ltrjer", "lje", LetterOfJeremiah.toText: LetterOfJeremiah
  #     # of "songofthree", "songthr", "thesongofthreeyouths", "praz", "prayerofazariah", "azariah", "thesongofthethreeholychildren", "thesongofthreejews", "songofthethreeholychildren", "songofthr", "songofthreechildren", "songofthreejews", SongOfThreeYouths.toText: SongOfThreeYouths
  #     of "sus", Susanna.toText: Susanna
  #     of "bel", BelAndTheDragon.toText: BelAndTheDragon
  #     of "1mac", "1m", "ima", "1ma", "imac", "imacc", "1macc", "imaccabees", "1stmaccabees", "firstmaccabees", Maccabees1.toText: Maccabees1
  #     of "2mac", "2m", "iima", "2ma", "iimac", "iimacc", "2macc", "iimaccabees", "2ndmaccabees", "secondmaccabees", Maccabees2.toText: Maccabees2
  #     of "1esdr", "1esd", "ies", "1es", "iesd", "iesdr", "iesdras", "1stesdras", "firstesdras": Ezra # correct? not `Esdras`?
  #     of "3ez", "3es", Ezra3.toText: Ezra3
  #     of "profman", "prman", "pma", "prayerofmanasses", "man", PrayerOfManasseh.toText: PrayerOfManasseh
  #     # of "addpsalm", "addps", AdditionalPsalm.toText: AdditionalPsalm
  #     of "3mac", "iiima", "3ma", "iiimac", "iiimacc", "3macc", "iiimaccabees", "3rdmaccabees", "thirdmaccabees", Maccabees3.toText: Maccabees3
  #     # of "2esdr", "2esd", "iies", "2es", "iiesd", "2esd", "iiesdr", "2esdr", "iiesdras", "2esdras", "2ndesdras", "secondesdras", Esdras2.toText: Esdras2
  #     of "4mac", "ivma", "4ma", "ivmac", "ivmacc", "4macc", "ivmaccabees", "iiiimaccabees", "4thmaccabees", "fourthmaccabees", Maccabees4.toText: Maccabees4
  #     # of "ode", Ode.toText: Ode
  #     # of "pssolomon", "pssol", "psalmssolomon", "pssol", PsalmsOfSolomon.toText: PsalmsOfSolomon
  #     # of "laodiceans", "laod", "eplaod", "epistlaodiceans", "epistlelaodiceans", "epistletolaodiceans", EpistleToTheLaodiceans.toText: EpistleToTheLaodiceans
  #     of "matt", "mt", "mat", Matthew.toText: Matthew
  #     of "mrk", "mar", "mk", "mr", Mark.toText: Mark
  #     of "luk", "lk", Luke.toText: Luke
  #     of "joh", "jhn", "jn", John.toText: John
  #     of "act", "ac", Acts.toText: Acts
  #     of "rom", "ro", "rm", Romans.toText: Romans
  #     of "1cor", "1co", "ico", "icor", "icorinthians", "1stcor", "1stcorinthians", "firstcor", "firstcorinthians", Corinthians1.toText: Corinthians1
  #     of "2cor", "2co", "iico", "iicor", "iicorinthians", "2ndcorinthians", "secondcorinthians", Corinthians2.toText: Corinthians2
  #     of "gal", "ga", Galatians.toText: Galatians
  #     of "ephes", "eph", Ephesians.toText: Ephesians
  #     of "phil", "php", "pp", Philippians.toText: Philippians
  #     of "col", "co", Colossians.toText: Colossians
  #     of "1ths", "1thess", "1th", "ith", "ithes", "1thes", "ithess", "ithessalonians", "1stthess", "1stthessalonians", "firstthess", "firstthessalonians", Thessalonians1.toText: Thessalonians1
  #     of "2ths", "2thess", "2th", "iith", "iithes", "2thes", "iithess", "iithessalonians", "2ndthess", "2ndthessalonians", "secondthess", "secondthessalonians", Thessalonians2.toText: Thessalonians2
  #     of "1tim", "1ti", "iti", "itim", "itimothy", "1sttim", "1sttimothy", "firsttim", "firsttimothy", Timothy1.toText: Timothy1
  #     of "2tim", "2ti", "iiti", "iitim", "iitimothy", "2ndtim", "2ndtimothy", "secondtim", "secondtimothy", Timothy2.toText: Timothy2
  #     of "tit", "ti", Titus.toText: Titus
  #     of "philem", "phm", "pm", "phlm", Philemon.toText: Philemon
  #     of "heb", Hebrews.toText: Hebrews
  #     of "jas", "jm", "jms", "jam", James.toText: James
  #     of "1pet", "1pe", "ipe", "ipet", "ipt", "1pt", "1p", "ipeter", "1stpeter", "firstpeter", Peter1.toText: Peter1
  #     of "2pet", "2pe", "iipe", "iipet", "iipt", "2pt", "2p", "iipeter", "2ndpeter", "secondpeter", Peter2.toText: Peter2
  #     of "1jn", "ijn", "ijo", "1jo", "ijoh", "1joh", "ijhn", "1jhn", "1j", "ijohn", "1stjohn", "firstjohn", John1.toText: John1
  #     of "2jn", "iijn", "iijo", "2jo", "iijoh", "2joh", "iijhn", "2jhn", "2j", "iijohn", "2ndjohn", "secondjohn", John2.toText: John2
  #     of "iiijn", "3jn", "iiijo", "3jo", "iiijoh", "3joh", "iiijhn", "3jhn", "3j", "iiijohn", "3rdjohn", "thirdjohn", John3.toText: John3
  #     of "jud", "jd", "judi", Jude.toText: Jude
  #     of "rev", "re", "therevelation", "rv", Revelation.toText: Revelation
  #     else: Unknown
