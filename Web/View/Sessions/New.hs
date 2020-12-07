module Web.View.Sessions.New where

import IHP.AuthSupport.View.Sessions.New
import Web.View.Prelude

instance View (NewView User) where
  html NewView {..} =
    [hsx|
      <div id="sessions-new">
        <div >
          <div >
            <div style="max-width: 400px" >
              <h5>Log In:</h5>
              {renderForm user}
            </div>
          </div>
        </div>
      </div>
    |]

renderForm :: User -> Html
renderForm user =
  [hsx|
    <form method="POST" action={CreateSessionAction}>
      <div >
        <label for="email">E-Mail</label>
        <input name="email" value={get #email user} type="email" />
      </div>
      <div >
        <label for="password">Password</label>
        <input name="password" type="password" />
      </div>
      <button type="submit" >Login</button>
    </form>
  |]
