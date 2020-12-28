module Web.View.Articles.Index where

import Web.View.Prelude
import Web.View.Votes.Shared (articleVotingButton)

data ArticleTextImageOrder
  = First
  | Second

data IndexView = IndexView
  { votes :: [Vote],
    articles :: [Article]
  }

instance View IndexView where
  html IndexView {..} =
    let alternatedArticles = alternateArticles articles
     in [hsx|
          <div class="grid grid-cols-2 m-auto">
            {forEach alternatedArticles (renderArticles votes)}
          </div>
        |]

renderArticles :: [Vote] -> (ArticleTextImageOrder, [Article]) -> Html
renderArticles votes (order, article : []) = renderArticle article order votes
renderArticles votes (order, articles) =
  forEach articles (\article -> renderArticle article order votes)

renderArticle :: Article -> ArticleTextImageOrder -> [Vote] -> Html
renderArticle article order votes =
  [hsx|
    <div class="grid grid-cols-2">
      <div style={"order: " ++ show (fst textImageOrder)}>
        <img class="rounded" src={pathToImage article} alt={get #title article}>
      </div>
      <div class="relative m-6" style={"order: " ++ show (snd textImageOrder)}>
        <h1 class="text-xl">
          <a href={pathToArticle article}>{get #title article}</a>
        </h1>
        <p>{get #text article}</p>
        <div class="absolute bottom-0">
            {articleVotingButton article votes currentUser}
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

    textImageOrder :: (Int, Int)
    textImageOrder =
      case order of
        First -> (1, 2)
        Second -> (2, 1)

{-
  The Result Is:
  [ (First,  [Article])
  , (Second, [Article])
  , (First,  [Article])
  , (Second, [Article])
  ]
-}
alternateArticles :: [Article] -> [(ArticleTextImageOrder, [Article])]
alternateArticles articles =
  articles
    |> partitionBySize 2
    |> zip (cycle ([First, Second]))

partitionBySize :: Int -> [a] -> [[a]]
partitionBySize _ [] = []
partitionBySize _ (head : []) = [[head]]
partitionBySize size (first : second : tail) =
  [[first, second]] ++ partitionBySize size tail
