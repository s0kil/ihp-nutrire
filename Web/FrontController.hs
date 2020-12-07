module Web.FrontController where

import IHP.LoginSupport.Middleware
import IHP.RouterPrelude
import Web.Controller.Articles
import Web.Controller.Categories
import Web.Controller.Prelude
import Web.Controller.Sessions
import Web.Controller.Static
import Web.Controller.Users
import Web.View.Layout

instance FrontController WebApplication where
  controllers =
    [ startPage WelcomeAction,
      parseRoute @UsersController,
      parseRoute @SessionsController,
      parseRoute @ArticlesController,
      parseRoute @CategoriesController
      -- Generator Marker
    ]

instance InitControllerContext WebApplication where
  initContext = do
    setLayout defaultLayout
    initAuthentication @User
