module Web.View.Categories.Show where

import Web.View.Prelude

data ShowView = ShowView {category :: Category}

instance View ShowView where
  html ShowView {..} =
    [hsx|
      <h1>Show Category</h1>
      <p>{category}</p>
    |]
