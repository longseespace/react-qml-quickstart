# Package

version       = "0.1.0"
author        = "Long Nguyen"
description   = "React QML Nim Example"
license       = "LGPL-3.0"
bin           = @["main"]

# Dependencies

requires "nim >= 0.12.1, nimqml >= 0.5.0"

before build:
  exec ("rcc --binary main.qrc -o main.rcc")
  exec ("rcc --binary uibundle/bundle.qrc -o bundle.rcc")