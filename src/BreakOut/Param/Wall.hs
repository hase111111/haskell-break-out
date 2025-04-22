module BreakOut.Param.Wall
    ( defaultWallCollision
    , defaultWallsRigidBody
    )
where

import qualified Data.Vector as V

import qualified BreakOut.Math.Type as MT


defaultWallCollision :: MT.Collision
defaultWallCollision = MT.RectCollision $ MT.RectCollisionParam 80 600

internalMakeWall :: MT.Position -> MT.RigidBody
internalMakeWall pos = MT.RigidBody
    { MT.position = pos
    , MT.velocity = MT.zeroPosition
    , MT.collision = defaultWallCollision
    }

defaultWallsRigidBody :: V.Vector MT.RigidBody
defaultWallsRigidBody = V.fromList $ 
    internalMakeWall (MT.Position (-460) 0) :
    [internalMakeWall $ MT.Position 460 0]

