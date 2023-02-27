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
    else: "Nome de livro desconhecido"


func identifyBibleBookPt*(bookName: string): BibleBook =
  ## Tries to identify a book name with given name or abbreviation\
  ## Based in https://www.bc.edu/content/dam/files/research_sites/cjl/pdf/Biblical%20Abbreviations_SBL%20Handbook.pdf
  func toText(self: BibleBook): string {.inline.} =
    self.pt.normalize.text

  var s = bookName.normalize
  for (t, n) in [("primeiro", 1), ("segundo", 2), ("terceiro", 3), ("quarto", 4)]:
    s.isANumber(t, n)
  result = Unknown
  result =
    case s.text:
      of "gn", Genesis.toText: Genesis
      of "ex", Exodus.toText: Exodus
      of "lv", Leviticus.toText: Leviticus
      of "nm", Numbers.toText: Numbers
      of "dt", Deuteronomy.toText: Deuteronomy
      of "js", Joshua.toText: Joshua
      of "jz", Judges.toText: Judges
      of "rt", Ruth.toText: Ruth
      of "sm", "sa", Samuel1.toText: s.getCorrectByNum(Samuel1, Samuel2)
      of "rs", Kings1.toText: s.getCorrectByNum(Kings1, Kings2)
      of "cr", Chronicles1.toText: s.getCorrectByNum(Chronicles1, Chronicles2)
      of "ed", "esd", Ezra.toText:
        if s.numbers == "": s.numbers = "1"
        s.getCorrectByNum({Ezra: 1, Ezra3: 3, Ezra4: 4})
      of "ne", Nehemiah.toText: Nehemiah
      of "tb", Tobit.toText: Tobit
      of "jud", Judith.toText: Judith
      of "et", "est", Esther.toText: Esther
      of AdditionsToEsther.toText: AdditionsToEsther
      of "sl", Psalms.toText: Psalms
      of "pv", "pr", Proverbs.toText: Proverbs
      of "ecl", "ec", Ecclesiastes.toText: Ecclesiastes
      of "sb", WisdomOfSolomon.toText: WisdomOfSolomon
      of "eclo", Sirach.toText: Sirach
      of "ct", SongOfSolomon.toText: SongOfSolomon
      of "is", Isaiah.toText: Isaiah
      of "jr", Jeremiah.toText: Jeremiah
      of "lm", Lamentations.toText: Lamentations
      of EpistleOfJeremiah.toText: EpistleOfJeremiah
      of "br", Baruk1.toText:
        if s.numbers == "": s.numbers = "1"
        s.getCorrectByNum(Baruk1, Baruk2)
      of Susanna.toText: Susanna
      of "ez", Ezekiel.toText: Ezekiel
      of "dn", Daniel.toText: Daniel
      of BelAndTheDragon.toText: BelAndTheDragon
      of "os", Hosea.toText: Hosea
      of "jl", Joel.toText: Joel
      of "am", Amos.toText: Amos
      of "ab", "ob", Obadiah.toText: Obadiah
      of "jn", Jonah.toText: Jonah
      of "mq", Micah.toText: Micah
      of "na", Nahum.toText: Nahum
      of "hc", "hab", Habakkuk.toText: Habakkuk
      of "sf", Zephaniah.toText: Zephaniah
      of "ag", Haggai.toText: Haggai
      of "zc", Zechariah.toText: Zechariah
      of "ml", Malachi.toText: Malachi
      of "mt", Matthew.toText: Matthew
      of Mark.toText: Mark
      of "lc", Luke.toText: Luke
      of "at", "atos", Acts.toText: Acts
      of "rm", Romans.toText: Romans
      of "co", "cor", Corinthians1.toText: s.getCorrectByNum(Corinthians1, Corinthians2)
      of "gl", Galatians.toText: Galatians
      of "ef", Ephesians.toText: Ephesians
      of "fp", "fl", Philippians.toText: Philippians
      of "cl", Colossians.toText: Colossians
      of "ts", Thessalonians1.toText: s.getCorrectByNum(Thessalonians1, Thessalonians2)
      of "tm", Timothy1.toText: s.getCorrectByNum(Timothy1, Timothy2)
      of "tt", Titus.toText: Titus
      of "fm", Philemon.toText: Philemon
      of "he", "hb", Hebrews.toText: Hebrews
      of "tg", James.toText: James
      of "pe", "pd", Peter1.toText: s.getCorrectByNum(Peter1, Peter2)
      of John.toText, Job.toText:
        if "ó" in s.removed:
          # Job
          Job
        else:
          # Peter
          if s.numbers.len == 0:
            John
          else:
            s.getCorrectByNum(John1, John2, John3)
      of "jd", Jude.toText: Jude
      of "ap", Revelation.toText: Revelation
      of PrayerOfManasseh.toText: PrayerOfManasseh
      of "mc", "mb", Maccabees1.toText:
        if s.numbers.len == 0:
          Mark
        else:
          s.getCorrectByNum(Maccabees1, Maccabees2, Maccabees3, Maccabees4)
      else: Unknown
