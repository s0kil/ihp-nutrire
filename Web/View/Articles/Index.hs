module Web.View.Articles.Index where

import Web.View.Prelude

data IndexView = IndexView {articles :: [Article]}

instance View IndexView where
  html IndexView {..} =
    [hsx|
      <div class="grid grid-cols-2 m-auto">
        {forEach articles renderArticle}
      </div>
    |]

renderArticle article =
  [hsx|
    <div class="grid grid-cols-2">
      <div>
        <img src={pathToImage article} alt={get #title article}>
      </div>
      <div class="relative m-6">
        <h1 class="text-xl">
          <a href={pathToArticle article}>{get #title article}</a>
        </h1>
        <p>{get #text article}</p>
        <div class="absolute bottom-0">
          Voting Button
        </div>
      </div>
    </div>
  |]
  where
    pathToArticle :: Article -> Text
    pathToArticle article =
      pathTo ShowArticleAction {articleId = (get #id article)}

    pathToImage :: Article -> Text
    pathToImage article =
      fromMaybe "" (get #image article)
