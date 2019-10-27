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

    // let entry_url = QVariant::from(QString::from("http://localhost:8081/index.qml"));
    // in production, use code below
    let entry_url = QVariant::from(QString::from("qrc:/index.qml"));

    engine.set_property("ENTRY_URL".into(), entry_url);

    engine.load_file("qrc:///main.qml".into());
    engine.exec();
}
