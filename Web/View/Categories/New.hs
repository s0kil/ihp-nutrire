module Web.View.Categories.New where

import Web.View.Prelude

data NewView = NewView {category :: Category}

instance View NewView where
  html NewView {..} =
    [hsx|
      <h1>New Category</h1>
      {renderForm category}
    |]

renderForm :: Category -> Html
renderForm category =
  formFor
    category
    [hsx|
      {(textField #name)}
      {(numberField #priority)}
      {submitButton}
    |]
