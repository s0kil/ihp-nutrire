module Web.Controller.Home where

import Web.Controller.Prelude
import Web.View.Home.Index

instance Controller HomeController where
  action IndexAction = do
    -- TODO: The Query Fails With An Runtime Error If `votes` Table Is Empty
    articleIdWithMostVotes :: Id Article <- do
      let query = "SELECT article_id FROM votes GROUP BY article_id ORDER BY count(article_id) DESC LIMIT 1"
      sqlQueryScalar query ()

    popularArticle <-
      fetch articleIdWithMostVotes

    categories :: [Category] <-
      query @Category |> fetch

    -- TODO: `distinctOn #categoryId` https://github.com/digitallyinduced/ihp/issues/654
    articles :: [Include "categoryId" Article] <-
      query @Article
        |> fetch
          >>= collectionFetchRelated #categoryId
          >>= \articles ->
            articles
              |> sortOn (\article -> article |> get #categoryId |> get #priority)
              |> take 4
              |> pure

    render IndexView {..}
