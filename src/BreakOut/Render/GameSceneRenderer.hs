module BreakOut.Render.GameSceneRenderer
  ( renderGameScene )
where

import Graphics.Gloss

import qualified BreakOut.Type as T
import qualified BreakOut.Render.BlockRender as RB
import qualified BreakOut.Render.Const as RC


renderGameScene :: T.GameState -> Picture
renderGameScene (T.GameState _ ball paddle bricks _) =
    RB.renderRigidBody ball RC.ballColor <>
    RB.renderRigidBody paddle RC.paddleColor <>
    foldr ((<>) . (`RB.renderRigidBody` cyan)) blank bricks
