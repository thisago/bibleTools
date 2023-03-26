import std/unittest
import ./bibleTools
import ./bibleTools/books/base

proc concat[I1, I2: static[int]; T](a: array[I1, T], b: array[I2, T]): array[I1 + I2, T] =
  result[0..a.high] = a
  result[a.len..result.high] = b

const
    ptAbbr = ["primeiro reis", "Gn","Êx","Lv","Nm","Dt","Js","Jz","Rt","1 Sm","2 Sm","1 Rs","2 Rs","1 Cr","2 Cr","Esd","Ne","Et","Sl","Pv","Ec","Ct","Is","Jr","Lm","Ez","Dn","Os","Jl","Am","Ob","Jn","Mq","Na","Hc","Sf","Ag","Zc","Ml","Mt","Mc","Lc","Jo","At","Rm","1 Co","2 Co","Gl","Ef","Fp","Cl","1 Ts","2 Ts","1 Tm","2 Tm","Tt","Fm","Hb","Tg","1 Pe","2 Pe","1 Jo","2 Jo","3 Jo","Jd","Ap","1Sm","2Sm","1Rs","2Rs","1Cr","2Cr","Ed","Jó","1Co","2Co","1Ts","2Ts","1Tm","2Tm","1Pe","2Pe","1Jo","2Jo","3Jo","Ex","Tb","Jud","Est","Pr","Ecl","Sb","Eclo","Br","Ab","Hab","1Mc","2Mc","1Cor","2Cor","Fl","1Pd","2Pd","Ap"]
    enAbbr = ["jub", "eno", "jsr", "jash", "2tm", "first kings", "firstsam", "second samuel", "1stsam", "Gn","Ex","Lv","Nm","Dt","Jos","Jdg","Ru","1Sm","2Sm","1Kg","2Kg","1Ch","2Ch","Ezr","Neh","Est","Jb","Ps","Pr","Ec","Sg","Is","Jr","Lm","Ezk","Dn","Hs","Jl","Am","Ob","Jnh","Mc","Nah","Hab","Zph","Hg","Zch","Mal","Mt","Mk","Lk","Jn","Ac","Rm","1Co","2Co","Gl","Eph","Php","Col","1Th","2Th","1Tm","2Tm","Ti","Phm","Heb","Jms","1Pt","2Pt","1Jn","2Jn","3Jn","Jd","Rv","Gen","Exo","Lev","Num","Deu","Josh","Judg","Ruth","1Sam","2Sam","1Kin","2Kin","1Chr","2Chr","1Esd","Tob","Judi","Esth","Job","Prov","Eccl","Song","Wis","Sir","Isa","Jer","Azar","Lam","Epi","Bar","Sus","Ezek","Dan","Bel","Hos","Joel","Oba","Jona","Mic","Zeph","Hag","Zech","1Ma","2Ma","Man",#["2Esd",]#"Mat","Mar","Luk","John","Acts","Rom","1Cor","2Cor","Gal","Phil","1Ths","2Ths","1Tim","2Tim","Tit","Phlm","Jam","1Pet","2Pet","Jud","Rev","PrMan","Deut","1 Sam","2 Sam","1 Kin","2 Kin","1 Chr","2 Chr","Ezra","1 Esd","Judith","Esth Gr","Eccles","Ecclus","Lje","S3y","Amos","Obad","Jonah","1 Mac","2 Mac",#["2 Esd",]#"Mark","Luke","1 Cor","2 Cor","1 Thes","2 Thes","1 Tim","2 Tim","Philem","James","1 Pet","2 Pet","1 John","2 John","3 John","Jude","1Kgs","2Kgs","Jdt","GrEsth","EpJer","Sg3","Jon","1Mac","2Mac","Titus","Jas","GEN","EXO","LEV","NUM","DEU","JOS","JDG","RUT","1SA","2SA","1KI","2KI","1CH","2CH","EZR","NEH","3ES","TOB","JDT","EST","ESG","JOB","PSA","PRO","ECC","SNG","WIS","SIR","ISA","JER","LAM","LJE","BAR","S3Y","SUS","EZK","DAN","BEL","HOS","JOL","AMO","OBA","JON","MIC","NAM","HAB","ZEP","HAG","ZEC","MAL","1MA","2MA","MAT","MRK","LUK","JHN","ACT","ROM","1CO","2CO","GAL","EPH","PHP","COL","LAO","1TH","2TH","1TI","2TI","TIT","PHM","HEB","JAS","1PE","2PE","1JN","2JN","3JN","JUD","REV","MAN"]
    abbreviations = ptAbbr.concat enAbbr
    wrongAbbreviations = ["3tm", "Atof", "reis", "kings", "third sam", "king", "isis", "chronicle"]

suite "Books identification":
  test "English":
    for abbr in enAbbr:
      let book = abbr.identifyBibleBookEn
      if book == UnknownBook:
        echo abbr.normalize, " - ", abbr
      require book != UnknownBook
  test "Portuguese":
    for abbr in ptAbbr:
      let book = abbr.identifyBibleBookPt
      if book == UnknownBook:
        echo abbr.normalize, " - ", abbr
      require book != UnknownBook
  test "All languages":
    for abbr in abbreviations:
      let book = abbr.identifyBibleBook.book
      if book == UnknownBook:
        echo abbr.normalize, " - ", abbr
      require book != UnknownBook
  test "Wrong book names":
    for abbr in wrongAbbreviations:
      let book = abbr.identifyBibleBook.book
      if book != UnknownBook:
        echo abbr.normalize, " - ", abbr
      require book == UnknownBook
  test "Mismatches":
    require "Mc".identifyBibleBook.book == Mark
    require "Mq".identifyBibleBook.book == Micah

suite "Books stringify":
  test "English":
    require Deuteronomy.en == "Deuteronomy"
    require Jasher.en == "Jasher"
    require Samuel2.en == "2 Samuel"
    require Kings1.en == "1 Kings"
    require Psalms.en == "Psalms"
    require Job.en == "Job"
    require WisdomOfSolomon.en == "Wisdom Of Solomon"
    require Sirach.en == "Sirach"
  test "Portuguese":
    require Deuteronomy.pt == "Deuteronômio"
    require Jubilees.pt == "Jubileus"
    require Joshua.pt == "Joshua"
    require Nahum.pt == "Naum"
    require Zephaniah.pt == "Sofonias"
    require Haggai.pt == "Ageu"
    require WisdomOfSolomon.pt == "Sabedoria de Salomão"
    require Sirach.pt == "Eclesiástico"

suite "Books abbreviation":
  test "English":
    var used: seq[string]
    for book in BibleBook:
      let abbr = book.enAbbr
      require abbr notin used
      if book == UnknownBook:
        require abbr == "???"
      else:
        require abbr != "???"
      used.add abbr
  test "Portuguese":
    var used: seq[string]
    for book in BibleBook:
      let abbr = book.ptAbbr
      require abbr notin used
      used.add abbr
      if book == UnknownBook:
        require abbr == "??"
      else:
        require abbr != "??"
