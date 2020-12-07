module Web.View.Articles.Aid where

import Web.View.Prelude

instance CanSelect Category where
  type SelectValue Category = Id Category
  selectValue = get #id
  selectLabel = get #name
