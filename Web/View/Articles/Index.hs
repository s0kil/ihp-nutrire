module Web.View.Articles.Index where

import Web.View.Prelude

data IndexView = IndexView {articles :: [Article]}

instance View IndexView where
  html IndexView {..} =
    [hsx|
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item active"><a href={ArticlesAction}>Articles</a></li>
        </ol>
      </nav>
      <h1>Index <a href={pathTo NewArticleAction} class="btn btn-primary ml-4">+ New</a></h1>
      <div class="table-responsive">
        <table class="table">
          <thead>
            <tr>
              <th>Article</th>
              <th></th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>{forEach articles renderArticle}</tbody>
        </table>
      </div>
    |]

renderArticle article =
  [hsx|
    <tr>
      <td>{article}</td>
      <td><a href={ShowArticleAction (get #id article)}>Show</a></td>
      <td><a href={EditArticleAction (get #id article)} class="text-muted">Edit</a></td>
      <td><a href={DeleteArticleAction (get #id article)} class="js-delete text-muted">Delete</a></td>
    </tr>
  |]
