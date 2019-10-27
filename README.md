# react-qml-quickstart
A simple example to build native desktop app using react-qml and a pluggable backend

![Screenshot](with-redux.png?raw=true "Redux DevTools Screenshot")

### Prerequisites:
Install Qt5, yarn, your back-end toolchain: 
```bash
brew install qt
brew install yarn
# rust
curl https://sh.rustup.rs -sSf | sh
# or nim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

## Rust Guide

### For Development:

**Step 1. Run dev server:**
```
yarn install
yarn start
```

**Step 2. Run desktop app (in a new terminal tab)**
```
cd rust
cargo install --path .
cargo run
```

### For Production Release
**Step 1. Bundle front-end codes:**
```
yarn install
yarn build
```

**Step 2. Update entry URL**
- Open `rust/src/main.rs`
- Edit `entry_url` to load from `qrc:/index.qml`
```
// let entry_url = QVariant::from(QString::from("http://localhost:8081/index.qml"));
// in production, use code below
let entry_url = QVariant::from(QString::from("qrc:/index.qml"));

```

**Step 3. Bundle desktop app**
```
cd rust
cargo bundle --release
macdeployqt "target/release/bundle/osx/React QML Rust.app"
```


## Nim Guide

### For Development:

**Step 1. Run dev server:**
```
yarn install
yarn start
```

**Step 2. Run desktop app (in a new terminal tab)**
```
cd nim
nimble run main
```

### For Production Release
**Step 1. Bundle front-end codes:**
```
yarn install
yarn build
```

**Step 2. Update entry URL**
- Open `nim/main.nim`
- Set `DEV = false` (line 5)
```
const DEV = false
```

**Step 3. Bundle desktop app**
- TBD