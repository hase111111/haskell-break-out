module BreakOut.Update.GameSceneUpdater
    ( updateGameScene ) 
where

import BreakOut.Type
import BreakOut.Math.Type

updateGameScene :: Float -> GameState -> GameState
updateGameScene delta state = 
    let ballPostion = position $ ballRigidBody state
        ballVelocityX = positionX $ velocity $ ballRigidBody state
        ballVelocityY = positionY $ velocity $ ballRigidBody state
        ballVelocity = Position (ballVelocityX * delta) (ballVelocityY * delta)
        ballRigidBody' = (ballRigidBody state) { position = ballPostion + ballVelocity }
    in state { ballRigidBody = ballRigidBody' }
