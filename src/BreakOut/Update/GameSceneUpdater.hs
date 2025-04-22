module BreakOut.Update.GameSceneUpdater
    ( updateGameScene ) 
where

import BreakOut.Type
import BreakOut.Math.Type

updateGameScene :: Float -> GameState -> GameState
updateGameScene delta state = 
    let ballPostion = position $ ballRigidBody state
        ballRigidBody' = (ballRigidBody state) { position = ballPostion + Position (100 * delta) (100 * delta) }
    in state { ballRigidBody = ballRigidBody' }
