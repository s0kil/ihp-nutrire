module Web.View.Home.Index where

import Web.View.Prelude

data IndexView = IndexView
  { popularArticle :: Article
  }

instance View IndexView where
  html IndexView {popularArticle} =
    [hsx|
      <section class="grid grid-rows-2 grid grid-cols-1" style="width: 100%; height: 100%;">
        <div class="relative bg-cover bg-center bg-no-repeat" style="background-image: url(https://loremflickr.com/2000/1000/nutrition);">
          <div class="absolute bottom-0 py-6 pl-4 pr-4 font-bold">
            <h1 class="text-2xl text-yellow-500">
              <a href={ShowArticleAction (get #id popularArticle)}>{get #title popularArticle}</a>
            </h1>
            <div class="text-white text-sm">
              {get #text popularArticle}
            </div>
          </div>
        </div>
      </section>
    |]
