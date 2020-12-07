module Web.View.Articles.Show where

import Web.View.Prelude

data ShowView = ShowView {article :: Article}

instance View ShowView where
  html ShowView {..} =
    [hsx|
      <h1>Show Article</h1>
      <p>{article}</p>
    |]
