module Web.View.Articles.Index where

import Web.View.Prelude

data IndexView = IndexView {articles :: [Article]}

instance View IndexView where
  html IndexView {..} =
    [hsx|
      <h1>Index <a href={pathTo NewArticleAction}>+ New</a></h1>
      <div>
        <table>
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
      <td><a href={EditArticleAction (get #id article)}>Edit</a></td>
      <td><a href={DeleteArticleAction (get #id article)}>Delete</a></td>
    </tr>
  |]
