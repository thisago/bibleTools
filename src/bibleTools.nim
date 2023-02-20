from std/strutils import toLowerAscii

type
  BibleBook* = enum
    ## List of bible books in Cepher
    Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Jubilees, Enoch, Jasher,
        Joshua, Judges, Samuel1, Samuel2, Kings1, Kings2, Isaiah, Jeremiah,
        EpistleOfJeremiah, Ezekiel, Tobit, Baruk1, Baruk2, Hosea, Joel, Amos,
        Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah,
        Malachi, Psalms, Proverbs, Job, WisdomOfSolomon, Ecclesiasticus,
        SongOfSolomon, Ruth, Lamentations, Ecclesiastes, Esther,
        AdditionsToEsther, Judith, Chronicles1, Chronicles2, PrayerOfManasseh,
        Daniel, PrayerOfAzariah, Susanna, BelAndTheDragon, Ezra, Nehemiah,
        Ezra3, Ezra4, Maccabees1, Maccabees2, Maccabees3, Maccabees4, Matthew,
        Mark, Luke, Acts, James, Peter1, Peter2, Jude, Timothy1, Titus,
        Thessalonians1, Thessalonians2, Romans, Galatians, Timothy2,
        Corinthians1, Corinthians2, Ephesians, Philippians, Colossians,
        Philemon, Hebrews, John, John1, John2, John3, Revelation

using
  self: BibleBook

func `$`*(self): string =
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
    of Ecclesiasticus: "Ecclesiasticus"
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

func hebrewName*(self): string =
  ## Get the hebrew name of given book name
  case self:
    of Genesis: "Bere'shiyth"
    of Exodus: "Shemoth"
    of Leviticus: "Vayiqra"
    of Numbers: "Bemidbar"
    of Deuteronomy: "Devariym"
    of Jubilees: "Yovheliym"
    of Enoch: "Chanok"
    of Jasher: "Yashar"
    of Joshua: "Yahusha"
    of Judges: "Shofetiym"
    of Samuel1: "Shemu'el Ri'shon"
    of Samuel2: "Shemu'el Sheniy"
    of Kings1: "Melekiym Ri'shon"
    of Kings2: "Melekiym Sheniy"
    of Isaiah: "Yesha'yahu"
    of Jeremiah: "Yirmeyahu"
    of EpistleOfJeremiah: "Cepher Yirmeyahu"
    of Ezekiel: "Yechezq'el"
    of Tobit: "Toviyahu"
    of Baruk1: "Baruk Ri'shon"
    of Baruk2: "Baruk Sheniy"
    of Hosea: "Husha"
    of Joel: "Yo'el"
    of Amos: "Amoc"
    of Obadiah: "Ovadyahu"
    of Jonah: "Yonah"
    of Micah: "Miykah"
    of Nahum: "Nachum"
    of Habakkuk: "Chabaqquq"
    of Zephaniah: "Tsephanyahu"
    of Haggai: "Chaggai"
    of Zechariah: "Zakaryahu"
    of Malachi: "Mal`Akiy"
    of Psalms: "Tehilliym"
    of Proverbs: "Mishlei"
    of Job: "Iyov"
    of WisdomOfSolomon: "Chokmah Shalomah"
    of Ecclesiasticus: "Sirach"
    of SongOfSolomon: "Shiyr Hashiyriym"
    of Ruth: "Ruth"
    of Lamentations: "Qiynah"
    of Ecclesiastes: "Qoheleth"
    of Esther: "Ecter"
    of AdditionsToEsther: "Hadaccah"
    of Judith: "Yahudith"
    of Chronicles1: "Divrei Hayamiym Ri'shon"
    of Chronicles2: "Divrei Hayamiym Sheniy"
    of PrayerOfManasseh: "Tephillah Menashsheh"
    of Daniel: "Daniy'el"
    of PrayerOfAzariah: "Tephillah Azaryahu"
    of Susanna: "Shushanah"
    of BelAndTheDragon: "Ba`Al And The Dragon"
    of Ezra: "Ezra V'nechemyahu"
    of Nehemiah: "Ezra V'nechemyahu"
    of Ezra3: "Ezra Sheliyshiy"
    of Ezra4: "Ezra Reviy`Iy"
    of Maccabees1: "Makkabiym Ri'shon"
    of Maccabees2: "Makkabiym Sheniy"
    of Maccabees3: "Makkabiym Sheliyshiy"
    of Maccabees4: "Makkabiym Reviy`Iy"
    of Matthew: "Mattithyahu"
    of Mark: "Marqus"
    of Luke: "Luqas"
    of Acts: "Ma'asiym"
    of James: "Ya`Aqov"
    of Peter1: "Kepha Ri'shon"
    of Peter2: "Kepha Sheniy"
    of Jude: "Yahudah"
    of Timothy1: "Timotheus Ri'shon"
    of Titus: "Titus"
    of Thessalonians1: "Tasloniqiym Ri'shon"
    of Thessalonians2: "Tasloniqiym Sheniy"
    of Romans: "Romaiym"
    of Galatians: "Galatiym"
    of Timothy2: "Timotheus Sheniy"
    of Corinthians1: "Qorintiym Ri'shon"
    of Corinthians2: "Qorintiym Sheniy"
    of Ephesians: "Eph'siym"
    of Philippians: "Philippiym"
    of Colossians: "Qolasiym"
    of Philemon: "Philemon"
    of Hebrews: "Ivriym"
    of John: "Yochanon"
    of John1: "Yochanon Ri'shon"
    of John2: "Yochanon Sheniy"
    of John3: "Yochanon Sheliyshiy"
    of Revelation: "Chizayon"

type
  IdentifyBookNameLang* = enum
    English, Portuguese

# func identifyBookName*(s: string; lang: IdentifyBookNameLang = English): BibleBook =
#   ## Tries to identify a book name with given name or abbreviation
#   if lang == English:
#     case s.toLowerAscii:
#       of "": Genesis
#       of "": Exodus
#       of "": Leviticus
#       of "": Numbers
#       of "": Deuteronomy
#       of "": Joshua
#       of "": Judges
#       of "": Ruth
#       of "": Samuel1
#       of "": Samuel2
#       of "": Kings1
#       of "": Kings2
#       of "": Chronicles1
#       of "": Chronicles2
#       of "": Ezra
#       of "": Nehemiah
#       of "": Ezra3
#       of "": Tobit
#       of "": Judith
#       of "": Esther
#       of "": AdditionsToEsther
#       of "": Psalms
#       of "": Proverbs
#       of "": Job
#       of "": Ecclesiastes
#       of "": WisdomOfSolomon
#       of "": Ecclesiasticus
#       of "": SongOfSolomon
#       of "": Isaiah
#       of "": Jeremiah
#       of "": Lamentations
#       of "": EpistleOfJeremiah
#       of "": Baruk1
#       of "": Baruk2
#       of "": Susanna
#       of "": Ezekiel
#       of "": Daniel
#       of "": BelAndTheDragon
#       of "": Hosea
#       of "": Joel
#       of "": Amos
#       of "": Obadiah
#       of "": Jonah
#       of "": Micah
#       of "": Nahum
#       of "": Habakkuk
#       of "": Zephaniah
#       of "": Haggai
#       of "": Zechariah
#       of "": Malachi
#       of "": Matthew
#       of "": Mark
#       of "": Luke
#       of "": John
#       of "": Acts
#       of "": Romans
#       of "": Corinthians1
#       of "": Corinthians2
#       of "": Galatians
#       of "": Ephesians
#       of "": Philippians
#       of "": Colossians
#       of "": Thessalonians1
#       of "": Thessalonians2
#       of "": Timothy1
#       of "": Timothy2
#       of "": Titus
#       of "": Philemon
#       of "": Hebrews
#       of "": James
#       of "": Peter1
#       of "": Peter1
#       of "": John1
#       of "": John2
#       of "": John3
#       of "": Jude
#       of "": Revelation
#       of "": PrayerOfManasseh
#       of "": Maccabees1
#       of "": Maccabees1
#       of "": Maccabees3
#       of "": Maccabees4
#   elif lang == Portuguese:
#     case s.toLowerAscii:
#       of "": Genesis
#       of "": Exodus
#       of "": Leviticus
#       of "": Numbers
#       of "": Deuteronomy
#       of "": Joshua
#       of "": Judges
#       of "": Ruth
#       of "": Samuel1
#       of "": Samuel2
#       of "": Kings1
#       of "": Kings2
#       of "": Chronicles1
#       of "": Chronicles2
#       of "": Ezra
#       of "": Nehemiah
#       of "": Ezra3
#       of "": Tobit
#       of "": Judith
#       of "": Esther
#       of "": AdditionsToEsther
#       of "": Psalms
#       of "": Proverbs
#       of "": Job
#       of "": Ecclesiastes
#       of "": WisdomOfSolomon
#       of "": Ecclesiasticus
#       of "": SongOfSolomon
#       of "": Isaiah
#       of "": Jeremiah
#       of "": Lamentations
#       of "": EpistleOfJeremiah
#       of "": Baruk1
#       of "": Baruk2
#       of "": Susanna
#       of "": Ezekiel
#       of "": Daniel
#       of "": BelAndTheDragon
#       of "": Hosea
#       of "": Joel
#       of "": Amos
#       of "": Obadiah
#       of "": Jonah
#       of "": Micah
#       of "": Nahum
#       of "": Habakkuk
#       of "": Zephaniah
#       of "": Haggai
#       of "": Zechariah
#       of "": Malachi
#       of "": Matthew
#       of "": Mark
#       of "": Luke
#       of "": John
#       of "": Acts
#       of "": Romans
#       of "": Corinthians1
#       of "": Corinthians2
#       of "": Galatians
#       of "": Ephesians
#       of "": Philippians
#       of "": Colossians
#       of "": Thessalonians1
#       of "": Thessalonians2
#       of "": Timothy1
#       of "": Timothy2
#       of "": Titus
#       of "": Philemon
#       of "": Hebrews
#       of "": James
#       of "": Peter1
#       of "": Peter1
#       of "": John1
#       of "": John2
#       of "": John3
#       of "": Jude
#       of "": Revelation
#       of "": PrayerOfManasseh
#       of "": Maccabees1
#       of "": Maccabees1
#       of "": Maccabees3
#       of "": Maccabees4


when isMainModule:
  echo "re".identifyBookName
