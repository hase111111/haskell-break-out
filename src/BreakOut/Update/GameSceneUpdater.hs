module BreakOut.Update.GameSceneUpdater
    ( updateGameScene ) 
where

import qualified Data.Vector as V

import qualified BreakOut.Type as T
import qualified BreakOut.Math.Type as MT
import qualified BreakOut.Math.Util as MU
import qualified BreakOut.Math.Type as T

updateGameScene :: Float -> T.GameState -> T.GameState
updateGameScene delta state = 
    let ballPostion = MT.position $ T.ballRigidBody state
        ballVelocity = MT.velocity $ T.ballRigidBody state
        realBallVelocity = MU.scale delta ballVelocity
        ballTrajectory = MT.Segment ballPostion (ballPostion + realBallVelocity)
        rigidBodyGroup = V.concat
            [ T.bricksRigidBody state
            , T.wallsRigidBody state
            , V.singleton $ T.paddleRigidBody state
            ]
        collisionIndex' = collisionIndex ballTrajectory rigidBodyGroup
        ballVelocity' = updateBall ballVelocity ballTrajectory rigidBodyGroup
        ballRigidBody' = if ballVelocity /= ballVelocity' 
            then (T.ballRigidBody state) { MT.velocity = ballVelocity' }
            else (T.ballRigidBody state) { MT.position = ballPostion + realBallVelocity , MT.velocity = ballVelocity' }
        bricksRigidBody' = case collisionIndex' of
            Just index -> updateBrick (T.bricksRigidBody state) index
            Nothing -> T.bricksRigidBody state
    in state { T.ballRigidBody = ballRigidBody', T.bricksRigidBody = bricksRigidBody' }

updateBall :: MT.Position -> MT.Segment -> V.Vector T.RigidBody -> MT.Position
updateBall vec traj bricks = 
    let collisionResults = V.map (reflectBall traj) bricks
        noCollisionCount = V.length $ V.filter (== Nothing) collisionResults
    in if noCollisionCount == V.length bricks
        then vec
        -- 一番最初のJustを取得する
        else case V.find (/= Nothing) collisionResults of
            Just (Just YCollision) -> MU.reflectY vec
            Just (Just XCollision) -> MU.reflectX vec
            Just Nothing -> vec
            Nothing -> vec

collisionIndex :: MT.Segment -> V.Vector T.RigidBody -> Maybe Int
collisionIndex ballTraj bricks = 
    let collisionResults = V.map (reflectBall ballTraj) bricks
        noCollisionCount = V.length $ V.filter (== Nothing) collisionResults
    in if noCollisionCount == V.length bricks
        then Nothing
        else V.findIndex (/= Nothing) collisionResults

updateBrick :: V.Vector T.RigidBody -> Int -> V.Vector T.RigidBody
updateBrick bricks index = 
    if index < V.length bricks
    then
        let brick = bricks V.! index
            newBrick = brick { T.collision = T.CircleCollision $ T.CircleCollisionParam 0 }
        in bricks V.// [(index, newBrick)]
    else bricks

data CollisionDirection =  YCollision | XCollision
    deriving (Show, Eq)

reflectBall :: MT.Segment -> T.RigidBody -> Maybe CollisionDirection
reflectBall ballTraj (T.RigidBody pos _ (T.RectCollision rect)) = 
    let w = T.rectWidth rect
        h = T.rectHeight rect
        pos1 = MT.Position (MT.positionX pos - w / 2) (MT.positionY pos - h / 2)
        pos2 = MT.Position (MT.positionX pos + w / 2) (MT.positionY pos + h / 2)
        pos3 = MT.Position (MT.positionX pos - w / 2) (MT.positionY pos + h / 2)
        pos4 = MT.Position (MT.positionX pos + w / 2) (MT.positionY pos - h / 2)
        topSeg = MT.Segment pos1 pos2
        bottomSeg = MT.Segment pos3 pos4
        leftSeg = MT.Segment pos1 pos3
        rightSeg = MT.Segment pos2 pos4
        topIntersect = MU.intersection ballTraj topSeg
        bottomIntersect = MU.intersection ballTraj bottomSeg
        leftIntersect = MU.intersection ballTraj leftSeg
        rightIntersect = MU.intersection ballTraj rightSeg
    in case (topIntersect, bottomIntersect, leftIntersect, rightIntersect) of
        (Just _, Nothing, Nothing, Nothing) -> Just YCollision
        (Nothing, Just _, Nothing, Nothing) -> Just YCollision
        (Nothing, Nothing, Just _, Nothing) -> Just XCollision
        (Nothing, Nothing, Nothing, Just _) -> Just XCollision
        _ -> Nothing
reflectBall _ (T.RigidBody _ _ (T.CircleCollision _)) = Nothing
