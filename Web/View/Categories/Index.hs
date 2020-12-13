module Web.View.Categories.Index where

import Web.Types
import Web.View.Prelude

data IndexView = IndexView {categories :: [Category]}

instance View IndexView where
  html IndexView {..} =
    [hsx|
      <div>
        <table>
          <tr>
            <th>Category</th>
            <th></th>
            <th></th>
            <th></th>
          </tr>
        </table>
        {forEach categories renderCategory}
      </div>
    |]

renderCategory :: Category -> Html
renderCategory category =
  [hsx|
    <tr>
      <td>{category}</td>
    </tr>
  |]
