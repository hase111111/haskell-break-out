module BreakOut.Math.Util 
    ( reflectX
    , reflectY
    , scale
    , distance
    , segmentLength
    , crossProduct
    , dotProduct
    , intersection )
where

import qualified BreakOut.Math.Type as MT

-- | 反射 x
reflectX :: MT.Position -> MT.Position
reflectX (MT.Position x y) = MT.Position (-x) y

-- | 反射 y
reflectY :: MT.Position -> MT.Position
reflectY (MT.Position x y) = MT.Position x (-y)

-- | 定数倍する
scale :: Float -> MT.Position -> MT.Position
scale k (MT.Position x y) = MT.Position (k * x) (k * y)

-- | Calculate the distance between two points.
distance :: MT.Position -> MT.Position -> Float
distance (MT.Position x1 y1) (MT.Position x2 y2) = 
    sqrt ((x2 - x1) ** 2 + (y2 - y1) ** 2)

-- | Calculate the length of a segment.
segmentLength :: MT.Segment -> Float
segmentLength (MT.Segment (MT.Position x1 y1) (MT.Position x2 y2)) = 
    sqrt ((x2 - x1) ** 2 + (y2 - y1) ** 2)

-- | Calculate cross product of two vectors.
crossProduct :: MT.Position -> MT.Position -> Float
crossProduct (MT.Position x1 y1) (MT.Position x2 y2) = 
    x1 * y2 - x2 * y1

-- | Calculate dot product of two vectors.
dotProduct :: MT.Position -> MT.Position -> Float
dotProduct (MT.Position x1 y1) (MT.Position x2 y2) = 
    x1 * x2 + y1 * y2

-- | get intersection of line segments.
intersection :: MT.Segment -> MT.Segment -> Maybe MT.Position
intersection (MT.Segment (MT.Position x1 y1) (MT.Position x2 y2)) 
            (MT.Segment (MT.Position x3 y3) (MT.Position x4 y4)) = 
    let s1_x = x2 - x1
        s1_y = y2 - y1
        s2_x = x4 - x3
        s2_y = y4 - y3
        s = (-(s1_y * (x1 - x3)) + s1_x * (y1 - y3)) / (-(s2_x * s1_y) + s1_x * s2_y)
        t = (s2_x * (y1 - y3) - s2_y * (x1 - x3)) / (-(s2_x * s1_y) + s1_x * s2_y)
    in if s >= 0 && s <= 1 && t >= 0 && t <= 1
        then Just (MT.Position (x1 + (t * s1_x)) (y1 + (t * s1_y)))
        else Nothing
