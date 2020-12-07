module Web.View.CustomCSSFramework where

import IHP.FlashMessages.Types
import IHP.View.CSSFramework
import IHP.View.Classes
import IHP.View.Types
import IHP.ViewPrelude

-- TODO: Add Custom CSS Classes
-- TODO: https://ihp.digitallyinduced.com/api-docs/IHP-View-Types.html#t:CSSFramework
-- TODO: https://github.com/digitallyinduced/ihp/blob/master/IHP/View/CSSFramework.hs
customCSSFramework :: CSSFramework
customCSSFramework =
  tailwind
    { styledFormGroupClass = "",
      styledSubmitButtonClass = "",
      styledValidationResultClass = ""
      -- styledFlashMessage = \_ -> \case
      --   SuccessFlashMessage message -> [hsx|<div>{message}</div>|]
      --   ErrorFlashMessage message -> [hsx|<div>{message}</div>|]
      -- styledFormField :: CSSFramework -> FormField -> Html
      -- styledSubmitButton :: CSSFramework -> SubmitButton -> Html
      -- styledFormFieldHelp :: CSSFramework -> FormField -> Html
      -- styledInputClass :: FormField -> Text
      -- styledInputInvalidClass :: FormField -> Text
      -- styledValidationResult :: CSSFramework -> FormField -> Html
    }
