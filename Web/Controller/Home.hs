module Web.Controller.Home where

import Web.Controller.Prelude
import Web.View.Home.Index

instance Controller HomeController where
  action IndexAction = do
    render IndexView
