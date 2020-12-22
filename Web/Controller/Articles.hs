module Web.Controller.Articles where

import qualified Data.Text as Text

import IHP.ControllerPrelude
import Web.Controller.Prelude
import Web.View.Articles.Edit
import Web.View.Articles.Index
import Web.View.Articles.New
import Web.View.Articles.Show

instance Controller ArticlesController where
  action ArticlesAction {categoryId} = do
    category <-
      fetch categoryId
        >>= fetchRelated #articles

    let articles = get #articles category

    render IndexView {..}
  action NewArticleAction = do
    ensureIsUser

    let article =
          newRecord
            |> set #userId currentUserId

    categories <- query @Category |> fetch

    whenEmpty categories do
      setErrorMessage "You Need To Create At Least One Category Before Creating An Article"
      redirectTo NewCategoryAction

    render NewView {..}
  action ShowArticleAction {articleId} = do
    article <- fetch articleId
    render ShowView {..}
  action EditArticleAction {articleId} = do
    article <- fetch articleId
    render EditView {..}
  action UpdateArticleAction {articleId} = do
    article <- fetch articleId
    article
      |> buildArticle
      |> ifValid \case
        Left article -> render EditView {..}
        Right article -> do
          article |> updateRecord
          setSuccessMessage "Article updated"
          redirectTo EditArticleAction {..}
  action CreateArticleAction = do
    let article = newRecord @Article
    categories <- query @Category |> fetch

    article
      |> buildArticle
      |> ifValid \case
        Left article -> render NewView {..}
        Right article -> do
          article |> createRecord
          let categoryId = get #categoryId article
          setSuccessMessage "Article created"
          redirectTo ArticlesAction {..}
  action DeleteArticleAction {articleId} = do
    article <- fetch articleId
    let categoryId = get #categoryId article
    deleteRecord article
    setSuccessMessage "Article deleted"
    redirectTo ArticlesAction {..}

maybeSetDefaultImage :: Article -> Article
maybeSetDefaultImage article =
  article
    |> validateField #image isEmptyValue
    |> getValidationFailure #image
    |> \case
      Just _ ->
        let
          naiveRandomInt :: Int
          naiveRandomInt =
            [(get #title article), (get #text article)]
            |> map Text.length
            |> sum
         in article |> set #image (Just ("https://loremflickr.com/600/600/nutrition?lock=" ++ show naiveRandomInt))
      Nothing ->
        article

buildArticle article =
  article
    |> fill @["userId", "title", "text", "image", "categoryId"]
    |> maybeSetDefaultImage
    |> validateField #title nonEmpty
    |> validateField #text nonEmpty
    |> validateField #categoryId nonEmpty
