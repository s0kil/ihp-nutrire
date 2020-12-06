module Web.Routes where

import Generated.Types
import IHP.RouterPrelude
import Web.Types

instance AutoRoute StaticController

instance AutoRoute SessionsController

instance AutoRoute UsersController

-- Generator Marker
