module BreakOut.Render.BlockRender 
    ( renderRectangle
    , renderCircle
    , renderRigidBody )
where

import Graphics.Gloss

import BreakOut.Math.Type


renderRectangle :: RectCollisionParam -> Position -> Color -> Picture
renderRectangle (RectCollisionParam w h) (Position x y) c = 
    Color c $ Translate x y $ rectangleSolid w h

renderCircle :: CircleCollisionParam -> Position -> Color -> Picture
renderCircle (CircleCollisionParam r) (Position x y) c = 
    Color c $ Translate x y $ circleSolid r

renderRigidBody :: RigidBody -> Color -> Picture
renderRigidBody (RigidBody pos _ (CircleCollision param)) c = 
    renderCircle param pos c
renderRigidBody (RigidBody pos _ (RectCollision param)) c =
    renderRectangle param pos c
