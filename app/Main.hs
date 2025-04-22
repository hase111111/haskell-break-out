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
renderGameField field = 
    case scene field of
        TitleScene state -> renderTitleScene state
        GameScene state -> renderGameScene state

handleEvent :: Event -> GameField -> GameField
handleEvent _ field =
    case scene field of
        TitleScene _ -> field
        GameScene _ -> field

updateGameField :: Float -> GameField -> GameField
updateGameField delta field = 
    let field' = field { fps = delta }
    in case scene field of
        TitleScene _ -> field'
        GameScene _ -> field'

main :: IO ()
main = play 
    myWindowDisplay 
    myWindowBackgroundColor 
    myWindowFPS 
    initGameField 
    renderGameField 
    handleEvent 
    updateGameField
