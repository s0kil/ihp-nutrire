module Web.View.Layout (defaultLayout, Html) where

import Generated.Types
import IHP.Prelude
import IHP.ViewPrelude
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.Routes
import Web.Types
import Web.View.Components.Button (button)

defaultLayout :: Html -> Html
defaultLayout inner =
  H.docTypeHtml ! A.lang "en" ! A.class_ "" ! A.style "width: 100%; height: 100%;" $
    [hsx|
      <head>
        {metaTags}

        {stylesheets}
        {scripts}

        <title>Nutrire</title>
      </head>

      <body style="width: 100%; height: 100%;">
        {navigation}
        <div class="pt-20 pl-6 pr-6" style="width: 100%; height: 100%;">
          {renderFlashMessages}
          {inner}
        </div>
        {footer}
      </body>
    |]

stylesheets :: Html
stylesheets = do
  when
    isDevelopment
    [hsx|
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
      <script src="/helpers.js"></script>
      <script src="/vendor/morphdom-umd.min.js"></script>
      <script src="/main.js"></script>
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

navigation :: Html
navigation =
  [hsx|
    <nav class="flex h-20 pl-6 pr-6 fixed w-full bg-white z-10">
      <div class="self-center flex">
        <div class="flex flex-row">
          <img class="h-16" src="images/logo.png" alt="Nutrire" />
          <h1 class="text-4xl self-end">
            <a href="/" class="hover:underline">Nutrire</a>
          </h1>
        </div>
      </div>
      <div class="flex-1 self-center flex justify-center">
        {categoriesWithLinks}
      </div>
      <div class="self-center flex">
        {loginLogoutLinks}
      </div>
    </nav>
  |]
  where
    categoriesWithLinks :: Html
    categoriesWithLinks =
      [hsx|
        <ul class="flex space-x-4">
          {forEach categories renderCategory}
        </ul>
      |]
      where
        categories :: [Category]
        categories = fromFrozenContext @[Category]

        categoryPath :: Category -> Text
        categoryPath category =
          let categoryId = (get #id category)
           in pathTo ArticlesAction {..}

        renderCategory :: Category -> Html
        renderCategory category =
          [hsx|
            <li class="uppercase">
              <a class="hover:underline" href={categoryPath category}>{get #name category}</a>
            </li>
          |]

    loginLogoutLinks :: Html
    loginLogoutLinks =
      case fromFrozenContext @(Maybe User) of
        Just user ->
          let fullname = get #fullname user
           in [hsx|
            <div class="flex items-center relative">
              <button class={button ++ "font-medium"}>
                {fullname}
              </button>
              <span class="border"></span>
              <div class="relative">
                <button id="dropdown-toggle" onclick="toggleMenu()" class="py-2 px-4 capitalize tracking-wide border border-black text-black font-medium hover:bg-yellow-500 focus:outline-none">
                  <svg class="h-6 w-6 text-black" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z" />
                  </svg>
                </button>
              </div>
              <div id="user-menu" class="absolute hidden inset-x-0 top-0 mt-12 border border-black bg-white overflow-hidden shadow-xl">
               <a href={NewArticleAction} class="block px-4 py-2 text-sm text-black border-b hover:bg-yellow-500">New Nutritional Guide</a>
               <a href={NewCategoryAction} class="block px-4 py-2 text-sm text-black border-b hover:bg-yellow-500">Create Category</a>
               <a href={DeleteSessionAction} class="js-delete js-delete-no-confirm block px-4 py-2 text-sm text-black border-b hover:bg-yellow-500">Sign Out</a>
              </div>
            </div>
          |]
        Nothing ->
          [hsx|
            <div class="border border-black flex items-center">
              <a href={NewSessionAction} class="block px-4 py-2 text-sm text-black hover:bg-yellow-500">Login</a>
              <span>|</span>
              <a href={NewUserAction} class="block px-4 py-2 text-sm text-black hover:bg-yellow-500">Register</a>
            </div>
          |]

footer :: Html
footer =
  [hsx|
    <footer class="flex h-14 pl-6 pr-6 mt-10 mb-6">
      <div class="self-center flex justify-center">
        <div class="flex flex-row">
          <img class="h-10" src="images/logo.png" alt="Nutrire" />
          <h1 class="text-xl self-end">
            <a href="/" class="hover:underline">Nutrire</a>
          </h1>
        </div>
      </div>
      <div class="flex-1 self-center flex justify-center">
        <ul class="flex space-x-4">
          {linkTo "Privacy Policy" "/privacy-policy"}
          {linkTo "Terms & Conditions" "/terms-and-conditions"}
          <li>
            <span>
              Copyright 2020. All rights reserved.
            </span>
          </li>
        </ul>
      </div>
      <div class="self-center flex justify-center">
        Connect With Us:
        Icon1
        Icon2
        Icon3
      </div>
    </footer>
  |]
  where
    linkTo :: Text -> Text -> Html
    linkTo text path =
      [hsx|
        <li>
          <a href={path} class="text-yellow-500 hover:underline">{text}</a>
        </li>
      |]
