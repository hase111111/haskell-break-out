module BreakOut.Param.Paddle 
    ( defaultPaddlePos
    , defaultPaddleCollision
    , defaultPaddleRigidBody)
where

import BreakOut.Math.Type

defaultPaddlePos :: Position
defaultPaddlePos = Position 0 (-220)

defaultPaddleCollision :: Collision
defaultPaddleCollision = RectCollision $ RectCollisionParam 100 20

defaultPaddleRigidBody :: RigidBody
defaultPaddleRigidBody = RigidBody
    { position = defaultPaddlePos
    , velocity = zeroPosition
    , collision = defaultPaddleCollision
    }
