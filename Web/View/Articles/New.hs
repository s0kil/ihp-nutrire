module Web.View.Articles.New where

import Web.View.Prelude

data NewView = NewView
  { article :: Article,
    categories :: [Category]
  }

instance CanSelect Category where
  type SelectValue Category = Id Category
  selectValue = get #id
  selectLabel = get #name

instance View NewView where
  html NewView {..} =
    [hsx|
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href={ArticlesAction}>Articles</a></li>
          <li class="breadcrumb-item active">New Article</li>
        </ol>
      </nav>
      <h1>New Article</h1>
      {renderForm article categories}
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
