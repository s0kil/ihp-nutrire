module Web.Routes where

import Generated.Types
import IHP.RouterPrelude
import Web.Types

instance AutoRoute StaticController

instance AutoRoute SessionsController

instance AutoRoute UsersController

instance AutoRoute ArticlesController

instance AutoRoute CategoriesController

instance CanRoute CategoriesController where
  parseRoute' = do
    let categoriesAction = do
          string "/categories"
          endOfInput
          pure CategoriesAction
    let newCategoryAction = do
          string "/categories/new"
          endOfInput
          pure NewCategoryAction
    let createCategoryAction = do
          string "/categories/create"
          endOfInput
          pure CreateCategoryAction
    let showCategoryActionById = do
          string "/category/"
          categoryId :: Id Category <- parseId @Category
          endOfInput
          pure ShowCategoryAction {categoryId = Just categoryId, slug = Nothing}
    let showCategoryActionBySlug = do
          string "/category/"
          slug <- remainingText
          endOfInput
          pure ShowCategoryAction {categoryId = Nothing, slug = Just slug}

    categoriesAction
      <|> newCategoryAction
      <|> createCategoryAction
      <|> showCategoryActionById
      <|> showCategoryActionBySlug

notFoundPath :: Text
notFoundPath = "/404"

instance HasPath CategoriesController where
  -- Index
  pathTo CategoriesAction = "/categories"
  -- New
  pathTo NewCategoryAction = "/categories/new"
  -- Create
  pathTo CreateCategoryAction = "/categories/create"
  -- Show
  pathTo ShowCategoryAction {categoryId = Just id, slug = Nothing} = "/category/" <> tshow id
  pathTo ShowCategoryAction {categoryId = Nothing, slug = Just slug} = "/category/" <> slug
  pathTo ShowCategoryAction {categoryId = Nothing, slug = Nothing} = notFoundPath
  pathTo ShowCategoryAction {categoryId = Just _, slug = Just _} = notFoundPath
  -- Edit
  pathTo EditCategoryAction {categoryId = Just id, slug = Nothing} = "/category/" <> tshow id
  pathTo EditCategoryAction {categoryId = Nothing, slug = Just slug} = "/category/" <> slug
  pathTo EditCategoryAction {categoryId = Nothing, slug = Nothing} = notFoundPath
  pathTo EditCategoryAction {categoryId = Just _, slug = Just _} = notFoundPath
  -- Update
  pathTo UpdateCategoryAction {categoryId = Just id, slug = Nothing} = "/category/" <> tshow id
  pathTo UpdateCategoryAction {categoryId = Nothing, slug = Just slug} = "/category/" <> slug
  pathTo UpdateCategoryAction {categoryId = Nothing, slug = Nothing} = notFoundPath
  pathTo UpdateCategoryAction {categoryId = Just _, slug = Just _} = notFoundPath
  -- Delete
  pathTo DeleteCategoryAction {categoryId = Just id, slug = Nothing} = "/category/" <> tshow id
  pathTo DeleteCategoryAction {categoryId = Nothing, slug = Just slug} = "/category/" <> slug
  pathTo DeleteCategoryAction {categoryId = Nothing, slug = Nothing} = notFoundPath
  pathTo DeleteCategoryAction {categoryId = Just _, slug = Just _} = notFoundPath

-- Generator Marker
