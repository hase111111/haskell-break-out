module BreakOut.Math.Type where

data Position = Position
    { positionX :: Float
    , positionY :: Float
    } deriving (Show, Eq)

data Segment = Segment
    { start :: Position
    , end :: Position
    } deriving (Show, Eq)

data RectCollisionParam = RectCollisionParam
    { rectWidth :: Float
    , rectHeight :: Float
    } deriving (Show, Eq)

data CircleCollisionParam = CircleCollisionParam
    { circleRadius :: Float
    } deriving (Show, Eq)

data Collision = 
    RectCollision RectCollisionParam
    | CircleCollision CircleCollisionParam
     deriving (Show, Eq)

data RigidBody = RigidBody
    { position :: Position
    , velocity :: Position
    , collision :: Collision
    } deriving (Show, Eq)

zeroPosition :: Position
zeroPosition = Position 0 0