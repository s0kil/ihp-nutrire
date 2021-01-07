module Web.Types where

import Generated.Types
import IHP.LoginSupport.Types
import IHP.ModelSupport
import IHP.Prelude

instance HasNewSessionUrl User where
  newSessionUrl _ = "/NewSession"

data WebApplication
  = WebApplication
  deriving (Eq, Show)

data HomeController
  = IndexAction
  deriving (Eq, Show, Data)

data SessionsController
  = NewSessionAction
  | CreateSessionAction
  | DeleteSessionAction
  deriving (Eq, Show, Data)

data UsersController
  = NewUserAction
  | CreateUserAction
  deriving (Eq, Show, Data)

data ArticlesController
  = ArticlesAction {categoryId :: (Id Category)}
  | NewArticleAction
  | ShowArticleAction {articleId :: !(Id Article)}
  | CreateArticleAction
  | EditArticleAction {articleId :: !(Id Article)}
  | UpdateArticleAction {articleId :: !(Id Article)}
  | DeleteArticleAction {articleId :: !(Id Article)}
  deriving (Eq, Show, Data)

data CategoriesController
  = CategoriesAction
  | NewCategoryAction
  | ShowCategoryAction {categoryId :: !(Id Category)}
  | CreateCategoryAction
  | EditCategoryAction {categoryId :: !(Id Category)}
  | UpdateCategoryAction {categoryId :: !(Id Category)}
  | DeleteCategoryAction {categoryId :: !(Id Category)}
  deriving (Eq, Show, Data)

data VotesController
  = CreateVoteAction {userId :: (Id User), articleId :: (Id Article)}
  | DeleteVoteAction {voteId :: !(Id Vote)}
  deriving (Eq, Show, Data)
