module BreakOut.Type where

data Position = Position
    { positionX :: Float
    , positionY :: Float
    } deriving (Show, Eq)

data Segment = Segment
    { start :: Position
    , end :: Position
    } deriving (Show, Eq)

data Scene = 
    TitleDetails { select :: Int, title :: String }
    | GameDetails Int String 
    | GameOverDetails Int String
    deriving (Show, Eq)

data GameField = GameField
    { fps :: Float
    , scene :: Scene
    } deriving (Show, Eq)


