module Web.View.Components.Aid (cssClasses) where

import IHP.Prelude

-- Make It Easier To Later Prepend/Append Classes By Inserting Spacing On Both Sides
cssClasses :: [Text] -> Text
cssClasses classes = " " ++ (unwords classes) ++ " "
