module Web.View.Users.New where

import Web.View.Prelude

data NewView = NewView {user :: User}

instance View NewView where
  html NewView {user} =
    [hsx|
      <div id={currentViewId}>
        <div>
          <div>
            <div style="max-width: 400px" class="m-auto">
              <h5>Registration:</h5>
              {renderForm user}
            </div>
          </div>
        </div>
      </div>
    |]

renderForm :: User -> Html
renderForm user =
  formFor
    user
    [hsx|
    {(textField #fullname)          {fieldLabel = "Full Name"}}
    {(textField #username)          {fieldLabel = "Username"}}
    {(emailField #email)            {fieldLabel = "E-Mail"}}
    {(passwordField #passwordHash)  {fieldLabel = "Password"}}
    {submitButton}
|]
