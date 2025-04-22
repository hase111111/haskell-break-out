
module WindowSetting 
    ( myWindowWidth
    , myWindowHeight
    , myWindowTitle
    , myWindowFPS
    , myWindowDisplay
    , myWindowBackgroundColor
    )
where

import Graphics.Gloss

-- Windowのサイズを指定する関数，Num型にすることで，IntやFloatで渡すことができる.
myWindowWidth :: Num a => a
myWindowWidth = 960

myWindowHeight :: Num a => a
myWindowHeight = 540

-- Windowのタイトルを指定する関数.
myWindowTitle :: String
myWindowTitle = "breakout-hs"

-- FPSを指定する関数.
myWindowFPS :: Num a => a
myWindowFPS = 60

-- Displayの引数を指定する関数. ウィンドウタイトル，横幅・縦幅，ウィンドウの位置を指定する.
myWindowDisplay :: Display
myWindowDisplay = InWindow myWindowTitle (myWindowWidth, myWindowHeight) (10, 10)

-- 背景色を指定する関数.
myWindowBackgroundColor :: Color
myWindowBackgroundColor = makeColor 1 1 1 1
