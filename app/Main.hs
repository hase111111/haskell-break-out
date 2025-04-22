module Main where

import Graphics.Gloss

main :: IO ()
main = display (InWindow "rogue-hs" (320, 180) (10, 10)) white (Circle 80)
