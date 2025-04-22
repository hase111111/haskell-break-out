module BreakOut.Math where

import BreakOut.Type

-- | Calculate the distance between two points.
distance :: Position -> Position -> Float
distance (Position x1 y1) (Position x2 y2) = 
    sqrt ((x2 - x1) ** 2 + (y2 - y1) ** 2)

-- | Calculate the length of a segment.
segmentLength :: Segment -> Float
segmentLength (Segment (Position x1 y1) (Position x2 y2)) = 
    sqrt ((x2 - x1) ** 2 + (y2 - y1) ** 2)

-- | Calculate cross product of two vectors.
crossProduct :: Position -> Position -> Float
crossProduct (Position x1 y1) (Position x2 y2) = 
    x1 * y2 - x2 * y1

-- | Calculate dot product of two vectors.
dotProduct :: Position -> Position -> Float
dotProduct (Position x1 y1) (Position x2 y2) = 
    x1 * x2 + y1 * y2

-- | get intersection of line segments.
-- | https://stackoverflow.com/questions/563198/how-do-you-detect-where-two-line-segments-intersect
intersection :: Segment -> Segment -> Maybe Position
intersection (Segment (Position x1 y1) (Position x2 y2)) 
            (Segment (Position x3 y3) (Position x4 y4)) = 
    let s1_x = x2 - x1
        s1_y = y2 - y1
        s2_x = x4 - x3
        s2_y = y4 - y3
        s = (-(s1_y * (x1 - x3)) + s1_x * (y1 - y3)) / (-(s2_x * s1_y) + s1_x * s2_y)
        t = (s2_x * (y1 - y3) - s2_y * (x1 - x3)) / (-(s2_x * s1_y) + s1_x * s2_y)
    in if s >= 0 && s <= 1 && t >= 0 && t <= 1
        then Just (Position (x1 + (t * s1_x)) (y1 + (t * s1_y)))
        else Nothing
