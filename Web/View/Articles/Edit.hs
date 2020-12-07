module Web.View.Articles.Edit where

import Web.View.Prelude

data EditView = EditView {article :: Article}

instance View EditView where
  html EditView {..} =
    [hsx|
      <h1>Edit Article</h1>
      {renderForm article}
    |]

renderForm :: Article -> Html
renderForm article =
  formFor
    article
    [hsx|
      {(textField #userId)}
      {(textField #title)}
      {(textField #text)}
      {(textField #image)}
      {(textField #categoryId)}
      {submitButton}
    |]
