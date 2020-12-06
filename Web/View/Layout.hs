module Web.View.Layout (defaultLayout, Html) where

import Application.Helper.View
import Generated.Types
import IHP.Controller.RequestContext
import IHP.Environment
import IHP.ViewPrelude
import IHP.ViewSupport
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.Routes
import Web.Types

defaultLayout :: Html -> Html
defaultLayout inner =
  H.docTypeHtml ! A.lang "en" $
    [hsx|
      <head>
        {metaTags}

        {stylesheets}
        {scripts}

        <title>Nutrite</title>
      </head>

      <body>
        <div class="container mt-4">
          {navigationPartial}
          {renderFlashMessages}
          {inner}
        </div>
      </body>
    |]

stylesheets :: Html
stylesheets = do
  when
    isDevelopment
    [hsx|
      <link rel="stylesheet" href="/vendor/bootstrap.min.css"/>
      <link rel="stylesheet" href="/vendor/flatpickr.min.css"/>
      <link rel="stylesheet" href="/app.css"/>
    |]
  when
    isProduction
    [hsx|
      <link rel="stylesheet" href="/prod.css"/>
    |]

scripts :: Html
scripts = do
  when
    isDevelopment
    [hsx|
      <script id="livereload-script" src="/livereload.js"></script>
      <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
      <script src="/vendor/timeago.js"></script>
      <script src="/vendor/popper.min.js"></script>
      <script src="/vendor/bootstrap.min.js"></script>
      <script src="/vendor/flatpickr.js"></script>
      <script src="/helpers.js"></script>
      <script src="/vendor/morphdom-umd.min.js"></script>
    |]
  when
    isProduction
    [hsx|
      <script src="/prod.js"></script>
    |]

metaTags :: Html
metaTags =
  [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
  |]

navigationPartial :: Html
navigationPartial =
  [hsx|
    <nav>
      <ul>
        {loginLogoutLinks}
      </ul>
    </nav>
  |]
  where
    loginLogoutLinks :: Html
    loginLogoutLinks =
      case fromFrozenContext @(Maybe User) of
        Just user ->
          let fullname = get #fullname user
           in [hsx|
            <li>
              <p>{fullname}</p>
              <a href={DeleteSessionAction} class="js-delete js-delete-no-confirm">Login Out</a>
            </li>
          |]
        Nothing ->
          [hsx|
            <li>
              <a href={NewSessionAction}>Login In</a>
            </li>
            <li>
              <a href={NewUserAction}>Register</a>
            </li>
          |]
