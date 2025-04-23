module BreakOut.Param.Ball 
    ( defaultBallPos
    , defaultBallCollision
    , defaultBallVelocity
    , defaultBallRigidBody)
where

import qualified BreakOut.Math.Type as MT

defaultBallPos :: MT.Position
defaultBallPos = MT.Position 0 (-150)

defaultBallVelocity :: MT.Position
defaultBallVelocity = MT.Position 100 100

defaultBallCollision :: MT.Collision
defaultBallCollision = MT.CircleCollision $ MT.CircleCollisionParam 10

defaultBallRigidBody :: MT.RigidBody
defaultBallRigidBody = MT.RigidBody
    { MT.position = defaultBallPos
    , MT.velocity = defaultBallVelocity
    , MT.collision = defaultBallCollision
    }
