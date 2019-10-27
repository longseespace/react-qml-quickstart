import NimQml
import macros
import typeinfo

const DEV = false

proc mainProc() =
  var app = newQApplication()
  defer: app.delete()

  var engine = newQQmlApplicationEngine()
  defer: engine.delete()

  let mainRcc = app.applicationDirPath & "/" & "main.rcc"
  QResource.registerResource(mainRcc)

  # in dev
  when DEV:
    var entry_url = newQVariant("http://localhost:8081/index.qml")
    defer: entry_url.delete()

  # in production
  when DEV == false:
    let bundleRcc = app.applicationDirPath & "/" & "bundle.rcc"
    QResource.registerResource(bundleRcc)

    var entry_url = newQVariant("qrc:///index.qml")
    defer: entry_url.delete()

  engine.setRootContextProperty("ENTRY_URL", entry_url)
  engine.load(newQUrl("qrc:///main.qml"))

  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()
