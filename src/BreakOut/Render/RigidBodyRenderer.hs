module BreakOut.Render.RigidBodyRenderer
    ( renderRectangle
    , renderCircle
    , renderRigidBody )
where

import Graphics.Gloss

import qualified BreakOut.Math.Type as MT


renderRectangle :: MT.RectCollisionParam -> MT.Position -> Color -> Picture
renderRectangle (MT.RectCollisionParam w h) (MT.Position x y) c = 
    Color c $ Translate x y $ rectangleSolid w h

renderCircle :: MT.CircleCollisionParam -> MT.Position -> Color -> Picture
renderCircle (MT.CircleCollisionParam r) (MT.Position x y) c = 
    Color c $ Translate x y $ circleSolid r

renderRigidBody :: MT.RigidBody -> Color -> Picture
renderRigidBody (MT.RigidBody pos _ (MT.CircleCollision param)) = 
    renderCircle param pos
renderRigidBody (MT.RigidBody pos _ (MT.RectCollision param)) =
    renderRectangle param pos
