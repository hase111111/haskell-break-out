module BreakOut.Render.BlockRender where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game

import BreakOut.Math.Type

renderRectangle :: RectCollisionParam -> Position -> Color -> Picture
renderRectangle (RectCollisionParam w h) (Position x y) color = 
    rectangleSolid w h

renderCircle :: CircleCollisionParam -> Position -> Color -> Picture
renderCircle (CircleCollisionParam r) (Position x y) color = 
    Color color $ Translate x y $ Scale r r $ Circle 1

renderRigidBody :: RigidBody -> Color -> Picture
renderRigidBody (RigidBody _ _ (CircleCollision param)) color = 
    renderCircle param (Position 0 0) color
renderRigidBody (RigidBody _ _ (RectCollision param)) color =
    renderRectangle param (Position 0 0) color
renderRigidBody (RigidBody _ _ _) _ = blank
