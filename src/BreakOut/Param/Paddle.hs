module BreakOut.Param.Paddle 
    ( defaultPaddlePos
    , defaultPaddleCollision
    , defaultPaddleRigidBody)
where

import qualified BreakOut.Math.Type as MT

defaultPaddlePos :: MT.Position
defaultPaddlePos = MT.Position 0 (-220)

defaultPaddleCollision :: MT.Collision
defaultPaddleCollision = MT.RectCollision $ MT.RectCollisionParam 100 20

defaultPaddleRigidBody :: MT.RigidBody
defaultPaddleRigidBody = MT.RigidBody
    { MT.position = defaultPaddlePos
    , MT.velocity = MT.zeroPosition
    , MT.collision = defaultPaddleCollision
    }
