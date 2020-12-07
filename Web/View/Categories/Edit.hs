module Web.View.Categories.Edit where

import Web.View.Prelude

data EditView = EditView {category :: Category}

instance View EditView where
  html EditView {..} =
    [hsx|
      <h1>Edit Category</h1>
      {renderForm category}
    |]

renderForm :: Category -> Html
renderForm category =
  formFor
    category
    [hsx|
      {(textField #name)}
      {(textField #priority)}
      {submitButton}
    |]
