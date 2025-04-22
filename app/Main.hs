
{-# LANGUAGE RecordWildCards #-}

module Main (main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import WindowSetting
import BreakOut.Type
import BreakOut.Render.GameSceneRenderer
import BreakOut.Render.TitleSceneRenderer


initGameField :: GameField
initGameField = GameField
    { fps = 0
    , scene = GameScene gameStateDefault
    }

renderGameField :: GameField -> Picture
renderGameField GameField{..} = 
    case scene of
        TitleScene state -> renderTitleScene state
        GameScene state -> renderGameScene state

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
    initGameField
    renderGameField
    sampleEventHandler
    sampleUpdater
