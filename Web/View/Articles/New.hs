module Web.View.Articles.New where

import Web.View.Articles.Aid
import Web.View.Prelude

data NewView = NewView
  { article :: Article,
    categories :: [Category]
  }

instance View NewView where
  html NewView {..} =
    [hsx|
      <div style="max-width: 800px" class="m-auto">
        {renderForm article categories}
      </div>
    |]

renderForm :: Article -> [Category] -> Html
renderForm article categories =
  formFor
    article
    [hsx|
      {(hiddenField #userId)}
      {(textField #title)}
      {(textareaField #text)}
      {(textField #image)}
      {(selectField #categoryId categories)}
      {submitButton}
    |]
