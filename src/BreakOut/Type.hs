{-# LANGUAGE DuplicateRecordFields #-}

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
      TitleScene TitleState
    | GameScene  GameState
    deriving (Show, Eq)

data TitleState = TitleState
    { select :: Int
    , title :: String
    } deriving (Show, Eq)

data GameState = GameState
    { level :: Int
    , game :: String
    } deriving (Show, Eq)

data GameField = GameField
    { fps :: Float
    , scene :: Scene
    } deriving (Show, Eq)
