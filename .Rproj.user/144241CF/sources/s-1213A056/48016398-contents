#' Convert between lunar calendar and solar calendar
#'
#' \code{lunarToSolar} is used to convert the date of lunar calendar to solar calendar;
#' \code{solarToLunar} is used to convert the date of solar calendar to lunar calendar.
#'
#' @param x Date format of string or \code{Date} class data created by \code{lubridate}.
#'
#' @param more Show more information of the relative Date.
#'
#' @section Attention:
#'  In \code{lunarToSolar} function, Feburary 29th and 30th in lunar calendar are missing
#'   in \code{lubridate::ymd()}!
#'
#' @examples
#' t <- c("19 2 28", "19 7 3")
#' lunarToSolar(today())
#' lunarToSolar("19 2 29")
#' lunarToSolar(t)
#'
#' solarToLunar(today())
#' solarToLunar(t)

#' @rdname conversion
#' @export

lunarToSolar <- function(x, more = FALSE) {
  # temp <- vector(mode = "character")
  # for(i in (1:length(x))){
      suppressWarnings(if (suppressWarnings(is.na(lubridate::ymd(x)))) {
      if (str_sub(x, -2) == "29") {
        x <- x %>%
          str_replace("29", "28") %>%
          lubridate::ymd() %>%
          as.character() %>%
          str_replace("28", "29")
      } else if (str_sub(x, -2) == "30") {
        x <- x %>%
          str_replace("30", "28") %>%
          lubridate::ymd() %>%
          as.character() %>%
          str_replace("28", "30")
      }
    } else {
      x <- x %>%
        lubridate::ymd()
    })
    # temp[i] <- tb %>%
    #   dplyr::filter(tb$lunar == x[i])
  # }
  x <- as.character.Date(x)
  temp <- tb %>%
    dplyr::filter(tb$lunar %in% x)
  ifelse(more, return(temp), return(temp$solar))
}

#' @rdname conversion
#' @export

solarToLunar <- function(x, more = FALSE){
  x <- x %>%
    lubridate::ymd()
  temp <- tb %>%
    dplyr::filter(tb$solar %in% x)
  ifelse(more,return(temp),return(temp$lunar))
}
