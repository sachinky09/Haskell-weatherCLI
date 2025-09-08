module Main where

import Api
import Pretty
import Weather
import System.IO (hFlush, stdout)

main :: IO ()
main = do
  putStr "Enter city: "
  hFlush stdout
  city <- getLine

  mLoc <- fetchCoords city
  case mLoc of
    Nothing -> putStrLn "City not found!"
    Just loc -> do
      mWeather <- fetchWeather loc
      case mWeather of
        Nothing -> putStrLn "Could not fetch weather."
        Just w  -> printWeather loc w
