module BreakOut.Math.Type 
    ( Position(..)
    , Segment(..)
    , RectCollisionParam(..)
    , CircleCollisionParam(..)
    , Collision(..)
    , RigidBody(..)
    , zeroPosition
    )
where

data Position = Position
    { positionX :: Float
    , positionY :: Float
    } deriving (Show, Eq)

-- | Position + operation
instance Num Position where
    (+) (Position x1 y1) (Position x2 y2) = Position (x1 + x2) (y1 + y2)
    (-) (Position x1 y1) (Position x2 y2) = Position (x1 - x2) (y1 - y2)
    (*) (Position x1 y1) (Position x2 y2) = Position (x1 * x2) (y1 * y2)
    abs (Position x y) = Position (abs x) (abs y)
    signum (Position x y) = Position (signum x) (signum y)
    fromInteger n = Position (fromInteger n) 0

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