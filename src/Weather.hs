{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Weather where

import GHC.Generics
import Data.Aeson
import Data.Text (Text)

-- Location info from geocoding API
data Location = Location
  { name :: Text
  , latitude :: Double
  , longitude :: Double
  , country :: Text
  } deriving (Show, Generic)

instance FromJSON Location where
  parseJSON = withObject "Location" $ \o ->
    Location <$> o .: "name"
             <*> o .: "latitude"
             <*> o .: "longitude"
             <*> o .: "country"

newtype GeoResponse = GeoResponse
  { results :: [Location] }
  deriving (Show, Generic)

instance FromJSON GeoResponse

-- Weather info from forecast API
data CurrentWeather = CurrentWeather
  { temperature_2m :: Double
  , windspeed_10m :: Double
  , winddirection_10m :: Double
  , relative_humidity_2m :: Double
  , apparent_temperature :: Double
  , surface_pressure :: Double
  , precipitation :: Double
  , cloud_cover :: Double
  } deriving (Show, Generic)

instance FromJSON CurrentWeather where
  parseJSON = withObject "CurrentWeather" $ \o ->
    CurrentWeather <$> o .: "temperature_2m"
                   <*> o .: "windspeed_10m"
                   <*> o .: "winddirection_10m"
                   <*> o .: "relative_humidity_2m"
                   <*> o .: "apparent_temperature"
                   <*> o .: "surface_pressure"
                   <*> o .: "precipitation"
                   <*> o .: "cloud_cover"

newtype WeatherResponse = WeatherResponse
  { current :: CurrentWeather }
  deriving (Show, Generic)

instance FromJSON WeatherResponse
