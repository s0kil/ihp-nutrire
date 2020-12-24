module Web.View.Articles.Index where

import Web.View.Prelude
import Web.View.Votes.Shared (votingButton)

data IndexView = IndexView {articles :: [Article]}

instance View IndexView where
  html IndexView {..} =
    let alternatedArticles = alternateArticles articles
     in [hsx|
          <div class="grid grid-cols-2 m-auto">
            {forEach alternatedArticles renderArticles}
          </div>
        |]

renderArticles :: (Int, [Article]) -> Html
renderArticles (order, article : []) = renderArticle article order
renderArticles (order, articles) =
  forEach articles (\article -> renderArticle article order)

renderArticle :: Article -> Int -> Html
renderArticle article order =
  let textOrderStyle = if order == 2 then 1 else 2
      imageOrderStyle = if order == 2 then 2 else 1
   in [hsx|
        <div class="grid grid-cols-2">
          <div style={"order: " ++ show imageOrderStyle}>
            <img class="rounded" src={pathToImage article} alt={get #title article}>
          </div>
          <div class="relative m-6" style={"order: " ++ show textOrderStyle}>
            <h1 class="text-xl">
              <a href={pathToArticle article}>{get #title article}</a>
            </h1>
            <p>{get #text article}</p>
            <div class="absolute bottom-0">
              {votingButton article currentUser}
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

    currentUser :: Maybe User
    currentUser = fromFrozenContext @(Maybe User)

{-
  The Result Is:
  [ (1, [list of articles])
  , (2, [list of articles])
  , (1, [list of articles])
  , (2, [list of articles])
  ]
-}
alternateArticles :: [Article] -> [(Int, [Article])]
alternateArticles articles =
  articles
    |> partitionBySize 2
    |> zip (cycle [1, 2])

partitionBySize :: Int -> [a] -> [[a]]
partitionBySize _ [] = []
partitionBySize _ (head : []) = [[head]]
partitionBySize size (first : second : tail) =
  [[first, second]] ++ partitionBySize size tail
