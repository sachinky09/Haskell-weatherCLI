#  Haskell Weather CLI  

A simple **command-line weather application** written in **Haskell**.  
It lets you enter a city name, fetches its coordinates via the [Open-Meteo Geocoding API](https://open-meteo.com/), and then retrieves **current weather details** using the [Open-Meteo Forecast API](https://open-meteo.com/).  

---

##  Features
- CLI-based: enter any city name directly in the terminal  
- Uses **Open-Meteo APIs** (no API key required 🚀)  
- Displays 8–10 weather parameters (temperature, humidity, wind speed, pressure, etc.)  
- Written in **pure Haskell** with `aeson`, `http-conduit`, and `text`  

---

##  Project Structure
```
Haskell-weatherCLI/
├── src/
│   ├── Main.hs       -- Entry point (CLI)
│   ├── Api.hs        -- Handles API requests
│   ├── Pretty.hs     -- Nicely formats weather output
│   └── Weather.hs    -- Data models & JSON parsing
├── Haskell-weatherCLI.cabal
├── stack.yaml
```

---

## ⚡ Installation

Clone the repository:

```bash
git clone https://github.com/sachinky09/Haskell-weatherCLI.git
cd Haskell-weatherCLI
```

Build the project with **stack**:

```bash
stack build
```

---

## ▶ Usage

Run the CLI:

```bash
stack exec Haskell-weatherCLI
```

You will be prompted to enter a city name:

```
Enter city: Kolkata
```

Example output:

```
Weather for "Calcutta", "India"
------------------------------
Temperature: 29.1 °C
Feels Like: 35.7 °C
Humidity: 84.0 %
Wind Speed: 6.4 km/h
Wind Direction: 196.0 °
Pressure: 1004.4 hPa
Precipitation: 0.0 mm
Cloud Cover: 100.0 %
...
```

---

## 🛠️ Dependencies
This project uses:
- [aeson](https://hackage.haskell.org/package/aeson) – JSON parsing
- [http-conduit](https://hackage.haskell.org/package/http-conduit) – HTTP client
- [text](https://hackage.haskell.org/package/text) – Efficient string handling
- [bytestring](https://hackage.haskell.org/package/bytestring)

All dependencies are declared in the `.cabal` file.  

---