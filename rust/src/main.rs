extern crate qmetaobject;
use qmetaobject::*;

qrc!(resource,
    "" {
        "main.qml",
    },
);

fn main() {
    // resource
    resource();

    // then load engine
    let mut engine = QmlEngine::new();

    let path = if cfg!(debug_assertions) { "http://localhost:8081/index.qml" } else { "qrc:/index.qml" };
    let entry_url = QVariant::from(QString::from(path));

    engine.set_property("ENTRY_URL".into(), entry_url);

    engine.load_file("qrc:///main.qml".into());
    engine.exec();
}
