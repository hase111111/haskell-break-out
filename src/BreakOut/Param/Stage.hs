module BreakOut.Param.Stage 
    ( makeStage1
    , defaultBrickCollision )
where

import qualified Data.Vector as V

import qualified BreakOut.Math.Type as MT


defaultBrickCollision :: MT.Collision
defaultBrickCollision = MT.RectCollision $ MT.RectCollisionParam 100 20

internalMakeBrick :: MT.Position -> MT.RigidBody
internalMakeBrick pos = MT.RigidBody
    { MT.position = pos
    , MT.velocity = MT.zeroPosition
    , MT.collision = defaultBrickCollision
    }

makeStage1 ::  V.Vector MT.RigidBody
makeStage1 = V.fromList list
    where
        list = map internalMakeBrick internalStage1List

internalStage1List :: [MT.Position]
internalStage1List = 
    let diffX = 110
        diffY = 30
        row = 7
        col = 7
        centerX = 55
        centerY = 130
        startX = centerX - (fromIntegral col * diffX) / 2
        startY = centerY + (fromIntegral row * diffY) / 2
        makePos :: Int -> Int -> MT.Position
        makePos i j = MT.Position 
            (startX + (fromIntegral i * diffX)) 
            (startY - (fromIntegral j * diffY))
    in [ makePos i j | i <- [0..col-1], j <- [0..row-1] ]
