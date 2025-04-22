module BreakOut.Render.BlockRender where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import BreakOut.Math.Type

renderRectangle :: RectCollisionParam -> Position -> Color -> Picture
renderRectangle (RectCollisionParam w h) (Position x y) color = 
    Color color $ Translate x y $ rectangleSolid w h

renderCircle :: CircleCollisionParam -> Position -> Color -> Picture
renderCircle (CircleCollisionParam r) (Position x y) color = 
    Color color $ Translate x y $ circleSolid r

renderRigidBody :: RigidBody -> Color -> Picture
renderRigidBody (RigidBody pos _ (CircleCollision param)) color = 
    renderCircle param pos color
renderRigidBody (RigidBody pos _ (RectCollision param)) color =
    renderRectangle param pos color
renderRigidBody (RigidBody _ _ _) _ = blank
