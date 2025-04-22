module BreakOut.Type where

data Position = Position
    { positionX :: Float
    , positionY :: Float
    } deriving (Show, Eq)

data Kinematic = Kinematic
    { position :: Position
    , velocity :: Position
    , acceleration :: Position
    } deriving (Show, Eq)

data Segment = Segment
    { start :: Position
    , end :: Position
    } deriving (Show, Eq)

data RectCollision = RectCollision
    { rectWidth :: Float
    , rectHeight :: Float
    } deriving (Show, Eq)

data Scene = 
      TitleScene TitleState
    | GameScene  GameState
    deriving (Show, Eq)

data TitleState = TitleState
    { select :: Int
    , title :: String
    } deriving (Show, Eq)

data GameState = GameState
    { level :: Int
    , ballKinematic :: Kinematic
    , paddleKinematic :: Kinematic
    , paddleCollision :: RectCollision
    , bricksKinematic :: [Kinematic]
    , brickCollision :: RectCollision
    } deriving (Show, Eq)

GameStateDefault :: GameState
GameStateDefault = GameState
    { level = 1
    , ballKinematic = Kinematic
        { position = Position 0 0
        , velocity = Position 0 0
        , acceleration = Position 0 0
        }
    , paddleKinematic = Kinematic
        { position = Position 0 0
        , velocity = Position 0 0
        , acceleration = Position 0 0
        }
    , paddleCollision = RectCollision 100 20
    , bricksKinematic = []
    , brickCollision = RectCollision 50 20
    }

data GameField = GameField
    { fps :: Float
    , scene :: Scene
    } deriving (Show, Eq)
