module Web.Controller.Home where

import Web.Controller.Prelude
import Web.View.Home.Index

instance Controller HomeController where
  action IndexAction = do
    -- TODO: The Query Fails With Runtime Error If `votes` Table Is Empty
    popularArticleId <- articleIdWithMostVotes
    popularArticle <- fetch popularArticleId

    render IndexView {..}

articleIdWithMostVotes :: (?modelContext :: ModelContext) => IO (Id Article)
articleIdWithMostVotes = do
  let query = "SELECT article_id FROM votes GROUP BY article_id ORDER BY count(article_id) DESC LIMIT 1"
  logQuery query ()
  sqlQueryScalar query ()
