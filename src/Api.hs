{-# LANGUAGE OverloadedStrings #-}

module Api (fetchCoords, fetchWeather) where

import Network.HTTP.Simple
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as BL
import Weather



fetchWeather :: Location -> IO (Maybe CurrentWeather)
fetchWeather loc = do
  let url = "https://api.open-meteo.com/v1/forecast?latitude=" ++ show (latitude loc)
         ++ "&longitude=" ++ show (longitude loc)
         ++ "&current=temperature_2m,windspeed_10m,winddirection_10m,relative_humidity_2m,"
         ++ "apparent_temperature,surface_pressure,precipitation,cloud_cover"
  r <- httpLBS =<< parseRequest url
  let body = getResponseBody r
  case eitherDecode body :: Either String WeatherResponse of
    Left err -> do
      putStrLn $ "Error decoding weather response: " ++ err
      return Nothing
    Right wr -> return (Just (current wr))
