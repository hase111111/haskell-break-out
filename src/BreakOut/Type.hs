module BreakOut.Type(
    GameField(..)
    , GameState(..)
    , TitleState(..)
    , gameStateDefault
    , Scene(..)
) where

import qualified Data.Vector as V

import qualified BreakOut.Math.Type as MT
import qualified BreakOut.Param.Paddle as PP
import qualified BreakOut.Param.Ball as PB
import qualified BreakOut.Param.Stage as PS
import qualified BreakOut.Param.Wall as PW

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
    , ballRigidBody :: MT.RigidBody
    , paddleRigidBody :: MT.RigidBody
    , bricksRigidBody :: V.Vector MT.RigidBody
    , wallsRigidBody :: V.Vector MT.RigidBody
    } deriving (Show, Eq)

gameStateDefault :: GameState
gameStateDefault = GameState
    { level = 1
    , ballRigidBody = PB.defaultBallRigidBody
    , paddleRigidBody = PP.defaultPaddleRigidBody
    , bricksRigidBody = PS.makeStage1
    , wallsRigidBody = PW.defaultWallsRigidBody
    }

data GameField = GameField
    { fps :: Float
    , scene :: Scene
    } deriving (Show, Eq)
