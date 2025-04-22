module BreakOut.Type(
    GameField(..)
    , GameState(..)
    , TitleState(..)
    , gameStateDefault
    , Scene(..)
) where

import Data.Vector

import BreakOut.Math.Type

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
    , ballRigidBody :: RigidBody
    , paddleRigidBody :: RigidBody
    , bricksKinematic :: Vector RigidBody
    } deriving (Show, Eq)

gameStateDefault :: GameState
gameStateDefault = GameState
    { level = 1
    , ballRigidBody = RigidBody
        { position = zeroPosition
        , velocity = zeroPosition
        , collision = CircleCollision (CircleCollisionParam 15.0)
        }
    , paddleRigidBody = RigidBody
        { position = Position 0 (-220)
        , velocity = zeroPosition
        , collision = RectCollision (RectCollisionParam 100 20)
        }
    , bricksKinematic = empty
    }

data GameField = GameField
    { fps :: Float
    , scene :: Scene
    } deriving (Show, Eq)
