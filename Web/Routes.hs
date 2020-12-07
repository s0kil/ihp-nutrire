module Web.Routes where

import Generated.Types
import IHP.RouterPrelude
import Web.Types

instance AutoRoute StaticController

instance AutoRoute SessionsController

instance AutoRoute UsersController

instance AutoRoute ArticlesController

-- Generator Marker

instance AutoRoute CategoriesController
