module Web.View.Categories.New where

import Web.View.Prelude

data NewView = NewView {category :: Category}

instance View NewView where
  html NewView {..} =
    [hsx|
      <div style="max-width: 800px" class="m-auto">
        <h1>New Category</h1>
        {renderForm category}
      </div>
    |]

renderForm :: Category -> Html
renderForm category =
  formFor'
    category
    (pathTo CreateCategoryAction)
    [hsx|
      {(textField #name)}
      {(numberField #priority)}
      {submitButton}
    |]
