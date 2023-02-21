import bibleTools/base

func he*(self: BibleBook): string =
  ## Get the hebrew name of given book
  case self:
    of Genesis: "בְּרֵאשִׁית"
    of Exodus: "שְׁמֹות"
    of Leviticus: "וַיִּקְרָא"
    of Numbers: "בְּמִדְבַּר"
    of Deuteronomy: "דְּבָרִים"
    # of Jubilees: ""
    # of Enoch: ""
    # of Jasher: ""
    # of Joshua: ""
    # of Judges: ""
    # of Samuel1: ""
    # of Samuel2: ""
    # of Kings1: ""
    # of Kings2: ""
    # of Isaiah: ""
    # of Jeremiah: ""
    # of EpistleOfJeremiah: ""
    # of Ezekiel: ""
    # of Tobit: ""
    # of Baruk1: ""
    # of Baruk2: ""
    # of Hosea: ""
    # of Joel: ""
    # of Amos: ""
    # of Obadiah: ""
    # of Jonah: ""
    # of Micah: ""
    # of Nahum: ""
    # of Habakkuk: ""
    # of Zephaniah: ""
    # of Haggai: ""
    # of Zechariah: ""
    # of Malachi: ""
    # of Psalms: ""
    # of Proverbs: ""
    # of Job: ""
    # of WisdomOfSolomon: ""
    # of Sirach: ""
    # of SongOfSolomon: ""
    # of Ruth: ""
    # of Lamentations: ""
    # of Ecclesiastes: ""
    # of Esther: ""
    # of AdditionsToEsther: ""
    # of Judith: ""
    # of Chronicles1: ""
    # of Chronicles2: ""
    # of PrayerOfManasseh: ""
    # of Daniel: ""
    # of PrayerOfAzariah: ""
    # of Susanna: ""
    # of BelAndTheDragon: ""
    # of Ezra: ""
    # of Nehemiah: ""
    # of Ezra3: ""
    # of Ezra4: ""
    # of Maccabees1: ""
    # of Maccabees2: ""
    # of Maccabees3: ""
    # of Maccabees4: ""
    # of Matthew: ""
    # of Mark: ""
    # of Luke: ""
    # of Acts: ""
    # of James: ""
    # of Peter1: ""
    # of Peter2: ""
    # of Jude: ""
    # of Timothy1: ""
    # of Titus: ""
    # of Thessalonians1: ""
    # of Thessalonians2: ""
    # of Romans: ""
    # of Galatians: ""
    # of Timothy2: ""
    # of Corinthians1: ""
    # of Corinthians2: ""
    # of Ephesians: ""
    # of Philippians: ""
    # of Colossians: ""
    # of Philemon: ""
    # of Hebrews: ""
    # of John: ""
    # of John1: ""
    # of John2: ""
    # of John3: ""
    # of Revelation: ""
    # else: "שם הספר לא ידוע"
    else: "Not added yet!"

func hebrewTransliteration*(self: BibleBook): string =
  ## Get the hebrew name of given book
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
    of Sirach: "Sirach"
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
    else: "Unknown book name"
