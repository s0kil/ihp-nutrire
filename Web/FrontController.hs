module Web.FrontController where

import IHP.LoginSupport.Middleware
import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.Controller.Sessions
import Web.Controller.Static
import Web.Controller.Users
import Web.View.Layout (defaultLayout)

instance FrontController WebApplication where
  controllers =
    [ startPage WelcomeAction,
      parseRoute @UsersController,
      parseRoute @SessionsController
      -- Generator Marker
    ]

instance InitControllerContext WebApplication where
  initContext = do
    setLayout defaultLayout
    initAuthentication @User
