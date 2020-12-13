module Web.Controller.Categories where

import Web.Controller.Prelude
import Web.View.Categories.Edit
import Web.View.Categories.Index
import Web.View.Categories.New
import Web.View.Categories.Show

instance Controller CategoriesController where
  action CategoriesAction = do
    categories <- query @Category |> fetch
    render IndexView {..}
  action NewCategoryAction = do
    let category = newRecord
    render NewView {..}
  action ShowCategoryAction {categoryId, slug} = do
    putStrLn "Here ShowCategoryAction"
    category <- fetchCategory categoryId slug
    render ShowView {..}
  action EditCategoryAction {categoryId, slug} = do
    putStrLn "Here EditCategoryAction"
    category <- fetchCategory categoryId slug
    render EditView {..}
  action UpdateCategoryAction {categoryId, slug} = do
    putStrLn "Here UpdateCategoryAction"
    category <- fetchCategory categoryId slug
    category
      |> buildCategory
      |> ifValid \case
        Left category -> render EditView {..}
        Right category -> do
          category |> updateRecord
          setSuccessMessage "Category updated"
          redirectTo EditCategoryAction {..}
  action CreateCategoryAction = do
    let category = newRecord @Category
    category
      |> buildCategory
      |> ifValid \case
        Left category -> render NewView {..}
        Right category -> do
          category |> createRecord
          setSuccessMessage "Category created"
          redirectTo CategoriesAction
  action DeleteCategoryAction {categoryId, slug} = do
    putStrLn "Here DeleteCategoryAction"
    category <- fetchCategory categoryId slug
    deleteRecord category
    setSuccessMessage "Category deleted"
    redirectTo CategoriesAction

buildCategory emptyCategory =
  let category =
        emptyCategory
          |> fill @["name", "priority"]
          |> validateField #name nonEmpty
      slug = toSlug (get #name category)
   in category |> set #slug slug

fetchCategory categoryId slug =
  case slug of
    Just slug -> query @Category |> filterWhere (#slug, slug) |> fetchOne
    Nothing -> fetchOne categoryId
