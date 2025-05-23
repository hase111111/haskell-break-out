module Main (main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import WindowSetting
import BreakOut.Type
import BreakOut.Render.GameSceneRenderer
import BreakOut.Render.TitleSceneRenderer
import BreakOut.Update.GameSceneUpdater
import BreakOut.Update.GameSceneEventHandler


initGameField :: GameField
initGameField = GameField
    { fps = 0
    , scene = GameScene gameStateDefault
    }

renderGameField :: GameField -> Picture
renderGameField field = 
    case scene field of
        TitleScene state -> renderTitleScene state
        GameScene state -> renderGameScene state

handleEvent :: Event -> GameField -> GameField
handleEvent event field =
    case scene field of
        TitleScene _ -> field
        GameScene state -> 
            let state' = handleGameSceneEvent event state
            in field { scene = GameScene state' }

updateGameField :: Float -> GameField -> GameField
updateGameField delta field = 
    let field' = field { fps = delta }
    in case scene field of
        TitleScene _ -> field'
        GameScene state -> 
            let state' = updateGameScene delta state
            in field' { scene = GameScene state' }

main :: IO ()
main = play 
    myWindowDisplay 
    myWindowBackgroundColor 
    myWindowFPS 
    initGameField 
    renderGameField 
    handleEvent 
    updateGameField
