module BreakOut.Render.TitleSceneRenderer
  ( renderTitleScene) 
where

import Graphics.Gloss
import BreakOut.Type


renderTitleScene :: TitleState -> Picture
renderTitleScene _ =
    Translate (-325) 100 $ Scale 1 1 $ Text "Break Out"
