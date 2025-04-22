
# haskell-break-out

## 作成方法

stack new コマンドを使って、プロジェクトを作成しました．

```bash
stack new haskell-break-out
```

package.yaml を編集して，依存関係(gloss)を追加しました．

```diff
executables:
  haskell-break-out-exe:
    main:                Main.hs
    source-dirs:         app
    ghc-options:
    - -threaded
    - -rtsopts
    - -with-rtsopts=-N
    dependencies:
+    - gloss
    - haskell-break-out
```

次に，glossをインストールします．

```bash
stack install gloss
```

さらに，OpenGLの依存関係を追加します．(libgl1-mesa-dev, libglu1-mesa-dev, freeglut3-dev)

```bash
sudo apt update
sudo apt-get install libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev
```

## 実行方法

```bash
stack build
stack exec haskell-break-out-exe
```