module Application.Helper.Controller
  ( module IHP.LoginSupport.Helper.Controller,
  )
where

import Generated.Types
import IHP.ControllerPrelude
import IHP.LoginSupport.Helper.Controller

type instance CurrentUserRecord = User
