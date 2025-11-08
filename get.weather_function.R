#' OpenWeatherMapR
#'
#' Returns weather metrics for specified Location and Date Range from the Open Weather Map API
#'
#'
#'
#' @param key string Your Open Weather Map API key.
#' @param location Latitude, Longitude
#' @param date Date range: "2021-07-01" or list of dates example - list("2021-07,01","2021-07-02")
#'
#' @author Auns Ahsan
#'
#' @import httr
#' @import jsonlite
#' @import data.table
#' @import anytime
#' @import dplyr
#'
#' @return Table containing weather information.
#' @export
#'
#' @examples
#' \dontrun{
#'
#' Example One
#'
#' apikey <- '222e546c9302a140b65a4aa0ab9566a2'
#' date <- "2021-09-11"
#' lat <- 53.480759
#' lon <- -2.242631
#'
#' df <- get.weather(apikey,lat,lon,date)
#'
#'
#' Example Two
#'
#' apikey <- '222e546c9302a140b65a4aa0ab9566a2'
#' date <- list("2021-09-11", "2021-09-10","2021-09-09")
#' lat <- 53.480759
#' lon <- -2.242631
#'
#' df <- get.weather(apikey,lat,lon,date)
#'
#' }


get.weather <- function(key,lat,lon,daterange){

  result <- list()

  for (i in daterange){

    result[[i]] <- setup.weather(key,lat,lon,i)

  }

  result <- as.data.frame(do.call(rbind,result)) %>% arrange(desc(date))

  return(result)

  options(warn = defaultW)

}
