
{-# LANGUAGE RecordWildCards #-}

module Main (main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import WindowSetting
import BreakOut.Type


sampleInit :: GameField
sampleInit = GameField
    { fps = 60
    , scene = TitleDetails 0 "Title"
    }

sampleDraw :: GameField -> Picture
sampleDraw GameField{..} = 
    case scene of
        TitleDetails _ _ -> 
            Translate (-100) 0 $ Scale 0.1 0.1 $ Text $ show fps
        GameDetails _ game -> 
            Translate (-100) 0 $ Scale 0.1 0.1 $ Text game
        GameOverDetails _ gameOver -> 
            Translate (-100) 0 $ Scale 0.1 0.1 $ Text gameOver

sampleEventHandler :: Event -> GameField -> GameField
sampleEventHandler _ n = n

sampleUpdater :: Float -> GameField -> GameField
sampleUpdater delta n = n {
    fps = 1 / delta
}

main :: IO ()
main = play 
    myWindowDisplay
    myWindowBackgroundColor
    myWindowFPS
    sampleInit
    sampleDraw
    sampleEventHandler
    sampleUpdater
