module Pretty (printWeather) where

import Weather

printWeather :: Location -> CurrentWeather -> IO ()
printWeather loc w = do
  putStrLn $ "Weather for " ++ show (name loc) ++ ", " ++ show (country loc)
  putStrLn "----------------------------"
  putStrLn $ "Temperature: " ++ show (temperature_2m w) ++ " °C"
  putStrLn $ "Feels Like: " ++ show (apparent_temperature w) ++ " °C"
  putStrLn $ "Humidity: " ++ show (relative_humidity_2m w) ++ " %"
  putStrLn $ "Wind Speed: " ++ show (windspeed_10m w) ++ " km/h"
  putStrLn $ "Wind Direction: " ++ show (winddirection_10m w) ++ " °"
  putStrLn $ "Pressure: " ++ show (surface_pressure w) ++ " hPa"
  putStrLn $ "Precipitation: " ++ show (precipitation w) ++ " mm"
  putStrLn $ "Cloud Cover: " ++ show (cloud_cover w) ++ " %"
