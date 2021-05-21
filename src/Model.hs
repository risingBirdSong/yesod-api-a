{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UndecidableInstances #-}
module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi

-- You can define all of your database entities in the entities file.
-- You can find more information on persistent and how to declare entities
-- at:
-- http://www.yesodweb.com/book/persistent/
share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models.persistentmodels")


<<<<<<< HEAD
instance ToJSON (Entity Simple) where
    toJSON (Entity pid p) = object
        [
            "id" .= (String $ toPathPiece pid) ,
            "value" .= simpleValue p
        ]

instance FromJSON Simple where 
    parseJSON (Object o) = Simple 
        <$> o .: "value"
    parseJSON _ = mzero
=======
-- { "id": 1, "title": "A title", "content": "The content" }
instance ToJSON (Entity Post) where
    toJSON (Entity pid p) = object
        [ "id"      .= (String $ toPathPiece pid)
        , "title"   .= postTitle p
        , "content" .= postContent p
        ]

instance FromJSON Post where
    parseJSON (Object o) = Post
        <$> o .: "title"
        <*> o .: "content"

    parseJSON _ = mzero

-- { "id": 1, "post_id": 1, "content": "The comment content" }
>>>>>>> d003061f74acd3edd0a00b1daf9f6d8a7882dde5
