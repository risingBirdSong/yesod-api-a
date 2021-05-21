{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Simple where

import Import

getSimpleR :: Handler Value 
getSimpleR = do 
    simple <- runDB $ selectList [] [] :: Handler [Entity Simple]
    return $ object ["mydata" .= simple]