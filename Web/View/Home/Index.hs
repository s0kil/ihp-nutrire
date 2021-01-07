module Web.View.Home.Index where

import Application.Helper.View
import Web.View.Prelude

data IndexView = IndexView
  { articles :: [Include "categoryId" Article],
    popularArticle :: Article
  }

instance View IndexView where
  html IndexView {popularArticle, articles} =
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
        <div class="grid grid-cols-4 m-auto">
          {forEach articles renderArticle}
        </div>
      </section>
    |]

renderArticle :: Include "categoryId" Article -> Html
renderArticle article =
  [hsx|
    <div class="relative">
      <div>
        <img class="rounded" src={imagePath} alt={get #title article}>
      </div>
      <div class="absolute top-0 py-6 pl-4 pr-4 w-full" style="background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0))">
        <h1 class="text-xl text-white font-bold">
          <a href={pathTo (ArticlesAction (get #id category))} class="border-b-2 border-yellow-400">
            {get #name category}
          </a>
        </h1>
      </div>
      <div class="absolute bottom-0 py-6 pl-4 pr-4 w-full" style="background: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.5))">
        <h1 class="text-lg text-white font-bold">
          <a href={pathTo (ShowArticleAction (get #id article))}>
            {get #title article}
          </a>
        </h1>
      </div>
    </div>
  |]
  where
    imagePath = fromMaybe "" $ get #image article
    category = get #categoryId article
