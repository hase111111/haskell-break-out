
module Main (main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import WindowSetting

sampleInit :: Int
sampleInit = 0

sampleDraw :: Int -> Picture
sampleDraw n = Translate (-200) 0 $ Scale 0.5 0.5 $ Color (makeColor 1 0 0 1) $ Text (show (n `div` 60))

sampleEventHandler :: Event -> Int -> Int
sampleEventHandler _ n = n

sampleUpdater :: Float -> Int -> Int
sampleUpdater _ n = n + 1

main :: IO ()
main = play 
    myWindowDisplay
    myWindowBackgroundColor
    myWindowFPS
    sampleInit
    sampleDraw
    sampleEventHandler
    sampleUpdater
