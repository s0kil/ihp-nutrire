module Web.Routes where

import IHP.RouterPrelude
import Web.Types

instance AutoRoute UsersController

instance AutoRoute StaticController

instance AutoRoute ArticlesController

instance AutoRoute SessionsController

instance AutoRoute CategoriesController

-- Generator Marker
