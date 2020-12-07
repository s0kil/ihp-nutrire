module Web.View.Categories.Index where

import Web.View.Prelude

data IndexView = IndexView {categories :: [Category]}

instance View IndexView where
  html IndexView {..} =
    [hsx|
      <h1>Index <a href={pathTo NewCategoryAction}>+ New</a></h1>
      <div>
        <table>
          <thead>
            <tr>
              <th>Category</th>
              <th></th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>{forEach categories renderCategory}</tbody>
        </table>
      </div>
    |]

renderCategory category =
  [hsx|
    <tr>
      <td>{category}</td>
      <td><a href={ShowCategoryAction (get #id category)}>Show</a></td>
      <td><a href={EditCategoryAction (get #id category)}>Edit</a></td>
      <td><a href={DeleteCategoryAction (get #id category)}>Delete</a></td>
    </tr>
  |]
