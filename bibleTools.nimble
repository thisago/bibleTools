# Package

version       = "1.2.3"
author        = "Thiago Navarro"
description   = "Bible tools to manipulate bible references!"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.6.4"
requires "util"

task testAll, "Test in C and JS backend":
  echo "Testing in C backend"
  exec "nimble test"
  echo "Testing in JS backend"
  exec "nimble --backend:js test"
  echo "Testing runnable examples"
  exec "nim doc --project --out:docs src/bibleTools.nim"
  echo "Cleaning non-Nim files in tests"
  exec "find tests/ | grep -v '.nim' | xargs rm; echo Success!"
