#' OpenWeatherMapR
#'
#' Returns weather metrics for specified Location and Date Range from the Open Weather Map API
#'
#'
#' @param key string Your Open Weather Map API key.
#' @param location Latitude, Longitude
#' @param date Date range: today, yesterday, last5days, "2021-07-01"
#'
#' @author Auns 
#'
#' @import httr
#' @import jsonlite
#' @import data.table
#' @import anytime
#' @import dplyr
#'
#' @return Table containing weather information.



setup.weather <- function(key,lat,lon,date){


  defaultW <- getOption("warn")
  options(warn = -1)

  #------------------------------------------------------------------------------- API Call

  apikey <- key
  date_POSIXct <- as.numeric(as.POSIXct(date))
  URL <- paste0('https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=',lat,'&lon=',lon,'&dt=',date_POSIXct,'&appid=',apikey)
  res <- GET(URL)

  #------------------------------------------------------------------------------- Transform data

  data <- fromJSON(rawToChar(res$content))
  dataRes <- data$hourly$weather
  datalist <- rbindlist(dataRes, fill = TRUE)
  datalist$date <- date
  datalist$hour <- seq.int(nrow(datalist))
  datahourly <- data$hourly
  datahourly <- datahourly %>% select(temp,wind_speed)
  datahourly$temp <- datahourly$temp - 273.15                                  # Convert temp from Kelvin to C'
  datalist <- cbind(datalist, datahourly)

  datalist <- datalist %>% select(date, hour, temp, main, description, wind_speed)

  return(datalist)
}
