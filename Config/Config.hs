module Config where

import IHP.Environment
import IHP.FrameworkConfig
import Web.View.CustomCSSFramework

config :: ConfigBuilder
config = do
  option Development
  option (AppHostname "localhost")
  option customCSSFramework
