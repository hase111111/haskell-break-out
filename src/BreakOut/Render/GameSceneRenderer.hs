{-# LANGUAGE RecordWildCards #-}

module BreakOut.Render.GameSceneRenderer
  ( renderGameScene )
where

import Graphics.Gloss

import BreakOut.Type
import BreakOut.Render.BlockRender
import BreakOut.Render.Const


renderGameScene :: GameState -> Picture
renderGameScene GameState{..} =
    renderRigidBody ballRigidBody ballColor <>
    renderRigidBody paddleRigidBody paddleColor
