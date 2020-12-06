module Web.Controller.Users where

import Web.Controller.Prelude
import Web.View.Users.New

instance Controller UsersController where
  action NewUserAction = do
    let user = newRecord @User
    render NewView {..}
  action CreateUserAction = do
    let user = newRecord @User
    user
      |> fill @["fullname", "username", "email", "passwordHash"]
      |> validateField #email nonEmpty
      |> validateField #fullname nonEmpty
      |> validateField #username nonEmpty
      |> validateField #passwordHash nonEmpty
      |> validateField #email isEmail
      |> validateIsUnique #email
      >>= validateIsUnique #username
      >>= ifValid \case
        Left user -> do
          render NewView {..}
        Right user -> do
          hashed <- hashPassword (get #passwordHash user)
          user
            |> set #passwordHash hashed
            |> createRecord

          setSuccessMessage "You have successfully registered"
          redirectTo NewSessionAction
