module BreakOut.Render.Const 
    ( ballColor
    , paddleColor
    )
where

import Graphics.Gloss

ballColor :: Color
ballColor = makeColor 0.8 0.4 0.4 1

paddleColor :: Color
paddleColor = makeColor 0.4 0.8 0.4 1
