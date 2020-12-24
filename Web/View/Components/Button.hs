module Web.View.Components.Button (button) where

import IHP.Prelude
import Web.View.Components.Aid (cssClasses)

button :: Text
button =
  cssClasses
    [ "py-2",
      "px-4",
      "capitalize",
      "text-black",
      "tracking-wide",
      "border",
      "border-black",
      "focus:outline-none"
    ]
