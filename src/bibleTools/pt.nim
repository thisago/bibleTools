import bibleTools/base

func pt*(self: BibleBook): string =
  ## Get the portuguese name of given book
  case self:
    of Genesis: "Gênesis"
    of Exodus: "Êxodo"
    of Leviticus: "Levítico"
    of Numbers: "Números"
    of Deuteronomy: "deuteronômio"
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
    of AdditionsToEsther: "Acréscimos A Ester"
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
    of Acts: "Atos"
    of James: "James"
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


func identifyBibleBookPt*(s: string): BibleBook =
  ## Tries to identify a book name with given name or abbreviation\
  ## Based in https://www.bc.edu/content/dam/files/research_sites/cjl/pdf/Biblical%20Abbreviations_SBL%20Handbook.pdf
  func toText(self: BibleBook): string {.inline.} =
    self.pt.normalize
  result =
    case s.normalize:
      of "gn", Genesis.toText: Genesis
      of "ex", Exodus.toText: Exodus
      of "lv", Leviticus.toText: Leviticus
      of "nm", Numbers.toText: Numbers
      of "dt", Deuteronomy.toText: Deuteronomy
      of "js", Joshua.toText: Joshua
      of "jz", Judges.toText: Judges
      of "rt", Ruth.toText: Ruth
      of "1sm", "1sa", Samuel1.toText: Samuel1
      of "2sm", "2sa", Samuel2.toText: Samuel2
      of "1rs", Kings1.toText: Kings1
      of "2rs", Kings2.toText: Kings2
      of "1cr", Chronicles1.toText: Chronicles1
      of "2cr", Chronicles2.toText: Chronicles2
      of "ed", "esd", Ezra.toText: Ezra
      of "ne", Nehemiah.toText: Nehemiah
      of Ezra3.toText: Ezra3
      of Tobit.toText: Tobit
      of Judith.toText: Judith
      of "et", Esther.toText: Esther
      of AdditionsToEsther.toText: AdditionsToEsther
      of "sl", Psalms.toText: Psalms
      of "pv", Proverbs.toText: Proverbs
      of Job.toText: Job
      of "ecl", Ecclesiastes.toText: Ecclesiastes
      of "sb", WisdomOfSolomon.toText: WisdomOfSolomon
      of "eclo", Sirach.toText: Sirach
      of "ct", SongOfSolomon.toText: SongOfSolomon
      of #["is",]# Isaiah.toText: Isaiah
      of Jeremiah.toText: Jeremiah
      of "lm", Lamentations.toText: Lamentations
      of EpistleOfJeremiah.toText: EpistleOfJeremiah
      of Baruk1.toText: Baruk1
      of Baruk2.toText: Baruk2
      of Susanna.toText: Susanna
      of Ezekiel.toText: Ezekiel
      of Daniel.toText: Daniel
      of BelAndTheDragon.toText: BelAndTheDragon
      of "os", Hosea.toText: Hosea
      of Joel.toText: Joel
      of Amos.toText: Amos
      of "ab", Obadiah.toText: Obadiah
      of Jonah.toText: Jonah
      of "mq", Micah.toText: Micah
      of Nahum.toText: Nahum
      of "hc", Habakkuk.toText: Habakkuk
      of "sf", Zephaniah.toText: Zephaniah
      of "ag", Haggai.toText: Haggai
      of Zechariah.toText: Zechariah
      of Malachi.toText: Malachi
      of Matthew.toText: Matthew
      of Mark.toText: Mark
      of "lc", Luke.toText: Luke
      of John.toText: John
      of "at", Acts.toText: Acts
      of "rm", Romans.toText: Romans
      of "1co", Corinthians1.toText: Corinthians1
      of "2co", Corinthians2.toText: Corinthians2
      of "gl", Galatians.toText: Galatians
      of "ef", Ephesians.toText: Ephesians
      of "fp", "fl", Philippians.toText: Philippians
      of "cl", Colossians.toText: Colossians
      of "1ts", Thessalonians1.toText: Thessalonians1
      of "2ts", Thessalonians2.toText: Thessalonians2
      of "1tm", Timothy1.toText: Timothy1
      of "2tm", Timothy2.toText: Timothy2
      of "tt", Titus.toText: Titus
      of "fm", Philemon.toText: Philemon
      of "he", Hebrews.toText: Hebrews
      of "tg", James.toText: James
      of "1pe", "1pd", Peter1.toText: Peter1
      of "2pe", "2pd", Peter2.toText: Peter2
      of "1jo", John1.toText: John1
      of "2jo", John2.toText: John2
      of "3jo", John3.toText: John3
      of "jd", Jude.toText: Jude
      of "ap", Revelation.toText: Revelation
      of PrayerOfManasseh.toText: PrayerOfManasseh
      of "1mc", "1mb", Maccabees1.toText: Maccabees1
      of "2mc", "2mb", Maccabees2.toText: Maccabees2
      of "3mc", "3mb", Maccabees3.toText: Maccabees3
      of "4mc", "4mb", Maccabees4.toText: Maccabees4
      else: Unknown
