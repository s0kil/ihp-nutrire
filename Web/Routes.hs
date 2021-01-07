module Web.Routes where

import IHP.RouterPrelude
import Web.Types

instance AutoRoute HomeController

instance AutoRoute UsersController

instance AutoRoute VotesController

instance AutoRoute ArticlesController

instance AutoRoute SessionsController

instance AutoRoute CategoriesController

-- Generator Marker
