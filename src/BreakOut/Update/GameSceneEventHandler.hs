module BreakOut.Update.GameSceneEventHandler
    ( handleGameSceneEvent ) 
where

import Graphics.Gloss.Interface.IO.Game

import qualified BreakOut.Type as T
import qualified BreakOut.Math.Type as T


handleGameSceneEvent :: Event -> T.GameState -> T.GameState
handleGameSceneEvent (EventMotion (x, _)) state =
    let paddlePosX = T.positionX $ T.position $ T.paddleRigidBody state
        velocityRate = 0.2
        newPaddleX = x * velocityRate + paddlePosX * (1 - velocityRate)
        newPaddleRigidBody = (T.paddleRigidBody state) 
            { T.position = T.Position newPaddleX (T.positionY $ T.position $ T.paddleRigidBody state) }
    in state { T.paddleRigidBody = newPaddleRigidBody }
handleGameSceneEvent _ state = state
