module BreakOut.Param.Ball 
    ( defaultBallPos
    , defaultBallCollision
    , defaultBallRigidBody)
where

import qualified BreakOut.Math.Type as MT

defaultBallPos :: MT.Position
defaultBallPos = MT.zeroPosition

defaultBallCollision :: MT.Collision
defaultBallCollision = MT.CircleCollision $ MT.CircleCollisionParam 15.0

defaultBallRigidBody :: MT.RigidBody
defaultBallRigidBody = MT.RigidBody
    { MT.position = defaultBallPos
    , MT.velocity = MT.zeroPosition
    , MT.collision = defaultBallCollision
    }
