module BreakOut.Render.GameSceneRenderer
  ( renderGameScene )
where

import Graphics.Gloss

import qualified BreakOut.Type as T
import qualified BreakOut.Render.RigidBodyRenderer as RR
import qualified BreakOut.Render.Const as RC


renderGameScene :: T.GameState -> Picture
renderGameScene (T.GameState _ ball paddle bricks _) =
    RR.renderRigidBody ball RC.ballColor <>
    RR.renderRigidBody paddle RC.paddleColor <>
    foldr ((<>) . (`RR.renderRigidBody` cyan)) blank bricks
