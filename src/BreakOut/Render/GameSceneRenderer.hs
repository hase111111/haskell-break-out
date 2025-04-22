{-# LANGUAGE RecordWildCards #-}

module BreakOut.Render.GameSceneRenderer
  ( renderGameScene )
where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import BreakOut.Type
import BreakOut.Math.Type
import BreakOut.Render.BlockRender

renderGameScene :: GameState -> Picture
renderGameScene GameState{..} =
    renderRigidBody ballRigidBody (makeColor 1 0 0 1) <>
    renderRigidBody paddleRigidBody (makeColor 0 1 0 1)
