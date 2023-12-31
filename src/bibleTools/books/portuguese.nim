import bibleTools/books/base

func pt*(self: BibleBook): string =
  ## Get the portuguese name of given book
  case self:
    of Genesis: "Gênesis"
    of Exodus: "Êxodo"
    of Leviticus: "Levítico"
    of Numbers: "Números"
    of Deuteronomy: "Deuteronômio"
    of Jubilees: "Jubileus"
    of Enoch: "Enoque"
    of Jasher: "Jasar"
    of Joshua: "Joshua"
    of Judges: "Juízes"
    of Samuel1: "1 Samuel"
    of Samuel2: "2 Samuel"
    of Kings1: "1 Reis"
    of Kings2: "2 Reis"
    of Isaiah: "Isaías"
    of Jeremiah: "Jeremias"
    of EpistleOfJeremiah: "Epístola de Jeremias"
    of Ezekiel: "Ezequiel"
    of Tobit: "Tobias"
    of Baruk1: "1 Baruque"
    of Baruk2: "2 Baruque"
    of Hosea: "Oséias"
    of Joel: "Joel"
    of Amos: "Amós"
    of Obadiah: "Obadias"
    of Jonah: "Jonas"
    of Micah: "Miquéias"
    of Nahum: "Naum"
    of Habakkuk: "Habacuque"
    of Zephaniah: "Sofonias"
    of Haggai: "Ageu"
    of Zechariah: "Zacarias"
    of Malachi: "Malaquias"
    of Psalms: "Salmos"
    of Proverbs: "Provérbios"
    of Job: "Jó"
    of WisdomOfSolomon: "Sabedoria de Salomão"
    of Sirach: "Eclesiástico"
    of SongOfSolomon: "Cantares"
    of Ruth: "Rute"
    of Lamentations: "Lamentações"
    of Ecclesiastes: "Eclesiastes"
    of Esther: "Ester"
    of AdditionsToEsther: "Acréscimos a Ester"
    of Judith: "Judite"
    of Chronicles1: "1 Crônicas"
    of Chronicles2: "2 Crônicas"
    of PrayerOfManasseh: "Oração de Manassés"
    of Daniel: "Daniel"
    of PrayerOfAzariah: "Oração de Azarias"
    of Susanna: "Susana"
    of BelAndTheDragon: "Bel e o Dragão"
    of Ezra: "Esdras"
    of Nehemiah: "Neemias"
    of Ezra3: "3 Esdras"
    of Ezra4: "4 Esdras"
    of Maccabees1: "1 Macabeus"
    of Maccabees2: "2 Macabeus"
    of Maccabees3: "3 Macabeus"
    of Maccabees4: "4 Macabeus"
    of Matthew: "Mateus"
    of Mark: "Marcos"
    of Luke: "Lucas"
    of Acts: "Atos dos Apóstolos"
    of James: "Tiago"
    of Peter1: "1 Pedro"
    of Peter2: "2 Pedro"
    of Jude: "Judas"
    of Timothy1: "1 Timóteo"
    of Titus: "Tito"
    of Thessalonians1: "1 Tessalonicenses"
    of Thessalonians2: "2 Tessalonicenses"
    of Romans: "Romanos"
    of Galatians: "Gálatas"
    of Timothy2: "2 Timóteo"
    of Corinthians1: "1 Coríntios"
    of Corinthians2: "2 Coríntios"
    of Ephesians: "Efésios"
    of Philippians: "Filipenses"
    of Colossians: "Colossenses"
    of Philemon: "Filemom"
    of Hebrews: "Hebreus"
    of John: "João"
    of John1: "1 João"
    of John2: "2 João"
    of John3: "3 João"
    of Revelation: "Revelação"
    of Laodiceans: "Laodicenses"
    of UnknownBook: "Nome de livro desconhecido"


func identifyBibleBookPt*(bookName: string): BibleBook =
  ## Tries to identify a book name with given name or abbreviation\
  ## Based in https://www.bc.edu/content/dam/files/research_sites/cjl/pdf/Biblical%20Abbreviations_SBL%20Handbook.pdf
  func toText(self: BibleBook): string {.inline.} =
    self.pt.normalize.text

  var s = bookName.normalize
  for (t, n) in [("primeiro", 1), ("segundo", 2), ("terceiro", 3), ("quarto", 4)]:
    s.isANumber(t, n)
  result = UnknownBook
  result =
    case s.text:
      of "gn", Genesis.toText: s.noNum Genesis
      of "ex", Exodus.toText: s.noNum Exodus
      of "lv", Leviticus.toText: s.noNum Leviticus
      of "nm", Numbers.toText: s.noNum Numbers
      of "dt", Deuteronomy.toText: s.noNum Deuteronomy
      of "js", Joshua.toText: s.noNum Joshua
      of "jz", Judges.toText: s.noNum Judges
      of "rt", Ruth.toText: s.noNum Ruth
      of "sm", "sa", Samuel1.toText:
        s.getCorrectByNum(Samuel1, Samuel2)
      of "rs", Kings1.toText:
        s.getCorrectByNum(Kings1, Kings2)
      of "cr", Chronicles1.toText:
        s.getCorrectByNum(Chronicles1, Chronicles2)
      of "ed", "esd", Ezra.toText:
        if s.numbers == "": s.numbers = "1"
        s.getCorrectByNum({Ezra: 1, Ezra3: 3, Ezra4: 4})
      of "ne", Nehemiah.toText: s.noNum Nehemiah
      of "tb", Tobit.toText: s.noNum Tobit
      of "jud", Judith.toText: s.noNum Judith
      of "et", "est", Esther.toText: s.noNum Esther
      of AdditionsToEsther.toText: s.noNum AdditionsToEsther
      of "sl", Psalms.toText: s.noNum Psalms
      of "pv", "pr", Proverbs.toText: s.noNum Proverbs
      of "ecl", "ec", Ecclesiastes.toText: s.noNum Ecclesiastes
      of "sb", WisdomOfSolomon.toText: s.noNum WisdomOfSolomon
      of "eclo", Sirach.toText: s.noNum Sirach
      of "ct", SongOfSolomon.toText: s.noNum SongOfSolomon
      of "is", Isaiah.toText: s.noNum Isaiah
      of "jr", Jeremiah.toText: s.noNum Jeremiah
      of "lm", Lamentations.toText: s.noNum Lamentations
      of EpistleOfJeremiah.toText: s.noNum EpistleOfJeremiah
      of "br", Baruk1.toText:
        if s.numbers == "": s.numbers = "1"
        s.getCorrectByNum(Baruk1, Baruk2)
      of Susanna.toText: s.noNum Susanna
      of "ez", Ezekiel.toText: s.noNum Ezekiel
      of "dn", Daniel.toText: s.noNum Daniel
      of "bel", BelAndTheDragon.toText: s.noNum BelAndTheDragon
      of "os", Hosea.toText: s.noNum Hosea
      of "jl", Joel.toText: s.noNum Joel
      of "am", Amos.toText: s.noNum Amos
      of "ab", "ob", Obadiah.toText: s.noNum Obadiah
      of "jn", Jonah.toText: s.noNum Jonah
      of "mq", Micah.toText: s.noNum Micah
      of "na", Nahum.toText: s.noNum Nahum
      of "hc", "hab", Habakkuk.toText: s.noNum Habakkuk
      of "sf", Zephaniah.toText: s.noNum Zephaniah
      of "ag", Haggai.toText: s.noNum Haggai
      of "zc", Zechariah.toText: s.noNum Zechariah
      of "ml", Malachi.toText: s.noNum Malachi
      of "mt", Matthew.toText: s.noNum Matthew
      of Mark.toText: s.noNum Mark
      of "lc", Luke.toText: s.noNum Luke
      of "at", "atos", Acts.toText: s.noNum Acts
      of "rm", Romans.toText: s.noNum Romans
      of "co", "cor", Corinthians1.toText:
        s.getCorrectByNum(Corinthians1, Corinthians2)
      of "gl", Galatians.toText: s.noNum Galatians
      of "ef", Ephesians.toText: s.noNum Ephesians
      of "fp", "fl", Philippians.toText: s.noNum Philippians
      of "cl", Colossians.toText: s.noNum Colossians
      of "ts", Thessalonians1.toText:
        s.getCorrectByNum(Thessalonians1, Thessalonians2)
      of "tm", Timothy1.toText:
        s.getCorrectByNum(Timothy1, Timothy2)
      of "tt", Titus.toText: s.noNum Titus
      of "fm", Philemon.toText: s.noNum Philemon
      of "he", "hb", Hebrews.toText: s.noNum Hebrews
      of "tg", James.toText: s.noNum James
      of "pe", "pd", Peter1.toText:
        s.getCorrectByNum(Peter1, Peter2)
      of John.toText, Job.toText:
        if "ó" in s.removed: Job
        else:
          if s.numbers.len == 0: John
          else: s.getCorrectByNum(John1, John2, John3)
      of "jd", Jude.toText: s.noNum Jude
      of "ap", Revelation.toText: s.noNum Revelation
      of PrayerOfManasseh.toText: s.noNum PrayerOfManasseh
      of "mc", "mb", Maccabees1.toText:
        if s.text == "mc" and s.numbers.len == 0: Mark
        else: s.getCorrectByNum(Maccabees1, Maccabees2, Maccabees3, Maccabees4)
      else: UnknownBook

func ptAbbr*(self: BibleBook): string =
  ## Returns a short version of book
  # Based in http://bmfg.org/bmfg-about/bible-books-common-abbreviations/ and https://www.biblestudytools.com/resources/abbreviation-guide.html
  case self:
    of Genesis: "Gn"
    of Exodus: "Êx"
    of Leviticus: "Lv"
    of Numbers: "Nm"
    of Deuteronomy: "Dt"
    of Joshua: "Js"
    of Judges: "Jz"
    of Ruth: "Rt"
    of Samuel1: "1Sm"
    of Samuel2: "2Sm"
    of Kings1: "1Rs"
    of Kings2: "2Rs"
    of Chronicles1: "1Cr"
    of Chronicles2: "2Cr"
    of Nehemiah: "Ne"
    of Esther: "Et"
    of Job: "Jó"
    of Psalms: "Sl"
    of Proverbs: "Pv"
    of Ecclesiastes: "Ec"
    of SongOfSolomon: "Ct"
    of Isaiah: "Is"
    of Jeremiah: "Jr"
    of EpistleOfJeremiah: "Ep"
    of Lamentations: "Lm"
    of Ezekiel: "Ez"
    of Daniel: "Dn"
    of Hosea: "Os"
    of Joel: "Jl"
    of Amos: "Am"
    of Obadiah: "Ob"
    of Jonah: "Jn"
    of Micah: "Mq"
    of Nahum: "Na"
    of Habakkuk: "Hc"
    of Zephaniah: "Sf"
    of Haggai: "Ag"
    of Zechariah: "Zc"
    of Malachi: "Ml"
    of Tobit: "Tb"
    of Judith: "Jdt"
    of AdditionsToEsther: "Aet"
    of WisdomOfSolomon: "Sb"
    of Sirach: "Eclo"
    of Baruk1: "1Br"
    of Baruk2: "2Br"
    of Susanna: "Su"
    of BelAndTheDragon: "Bel"
    of Maccabees1: "1ma"
    of Maccabees2: "2ma"
    of Ezra: "1Ez"
    of Ezra3: "3Ez"
    of Ezra4: "4Ez"
    of PrayerOfManasseh: "Mns"
    of Maccabees3: "3ma"
    of Maccabees4: "4ma"
    of Matthew: "Mt"
    of Mark: "Mc"
    of Luke: "Lc"
    of John: "Jo"
    of Acts: "At"
    of Romans: "Rm"
    of Corinthians1: "1Co"
    of Corinthians2: "2Co"
    of Galatians: "Gl"
    of Ephesians: "Ef"
    of Philippians: "Fp"
    of Colossians: "Co"
    of Thessalonians1: "1Ts"
    of Thessalonians2: "2Ts"
    of Timothy1: "1Tm"
    of Timothy2: "2Tm"
    of Titus: "Tit"
    of Philemon: "Pm"
    of Hebrews: "Hb"
    of James: "Tg"
    of Peter1: "1Pe"
    of Peter2: "2Pe"
    of John1: "1Jo"
    of John2: "2Jo"
    of John3: "3Jo"
    of Jude: "Jd"
    of Revelation: "Ap"
    of Jubilees: "Jb"
    of Enoch: "Eq"
    of Jasher: "Jsr"
    of PrayerOfAzariah: "Az"
    of Laodiceans: "La"
    of UnknownBook: "??"
