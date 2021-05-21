{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Post where

import Import

getPostR :: PostId -> Handler Value
getPostR pid = do
    post <- runDB $ get404 pid

    return $ object ["post" .= (Entity pid post)]

putPostR :: PostId -> Handler Value
putPostR pid = do
    post <- requireCheckJsonBody :: Handler Post
    -- runDB $ replace pid post
    runDB $ insert_ post

    sendResponseStatus status200 ((show pid) :: String)

deletePostR :: PostId -> Handler Value
deletePostR pid = do
    runDB $ delete pid

    sendResponseStatus status200 ("DELETED" :: Text)