{-# LANGUAGE RecordWildCards #-}

module BreakOut.Render.TitleSceneRenderer
  ( renderTitleScene
  ) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import BreakOut.Type
import BreakOut.Math.Type
import BreakOut.Render.BlockRender

renderTitleScene :: TitleState -> Picture
renderTitleScene TitleState{..} =
    Translate (-325) (100) $ Scale 1 1 $ Text "Break Out"
