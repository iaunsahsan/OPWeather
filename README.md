# openweatherr: Simple wrapper for Open Weather Map API

# Version - 1.0.0

**Author:** Auns Ahsan

**License:** GPL-3

**openweatherr** aims to make pulling basic weather data from the Open Weather Map API easy so you can spend more time on analysis. 

## Need an API key?
Get one [here.](https://openweathermap.org/price)

## Limitations

Historical weather limitations depend on your liciense see [here](https://openweathermap.org/price)

Basic License - last 5 days historical data, 60 calls/minute - 1,000,000 calls/month


## Schema:

- date - chr - "2021-09-11"
- hour - int - 14
- temp - (Celsius) - num - 17.7
- main - (Basic description of weather) - chr - "Rain"
- description - (Detailed description of weather) chr - "light rain"
- wind_speed - (meter/sec) - num - 0.45

## Example output:

| date          | hour | temp  | main   | description  | wind_speed |
| ------------- | ---- | ----- | -------|--------------|------------|
| 2021-09-11    | 1    | 17.74 | Clouds | broken clouds| 0.45       |
| 2021-09-11    | 2    | 17.65 | Mist   | mist         | 0.45       |
| 2021-09-11    | 3    | 17.61 | Rain   | light rain   | 0.89       |
| 2021-09-11    | 4    | 17.46 | Mist   | mist         | 1.54       |


## Available Function:

```
get.weather()
```
Requirements: 

- apiKey = STRING
- latitude = NUMERIC
- logitude = NUMERIC
- date = STRING

```
get.weather(apiKey, latitude, longitude, date)
```

See use case examples below.


## Installation:

```
devtools::install_github("aunsahsan/openweatherr")

library(openweatherr)
```

## Useage example:

**Example One:** 

```
library(openweatherr)

apikey <- "222e546c9302a140b65a4aa0ab9566a2"

date <- list("2021-09-11", "2021-09-10","2021-09-09")

lat <- 53.480759
lon <- -2.242631

test <- get.weather(apikey,lat,lon,date)
```

**Example Two:**

```

apikey <- "222e546c9302a140b65a4aa0ab9566a2"

date <- "2021-09-11"

lat <- 53.480759
lon <- -2.242631

test <- get.weather(apikey,lat,lon,date)

```
