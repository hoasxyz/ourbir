#' Happy birthday!
#'
#' This function is used to remind you about the birthday of your relatives, friends,
#' or other things.
#'
#' @param path A string represent the path of your birthday table.
#'
#' @param pre1d Remind you one day in advance.
#'
#' @param pre5d Remind you five days in advance. This param mainly help you buy one surprising gift.
#'
#' @examples
#'
#' bir_to(path = ourbir::bir_file("example.xlsx"), pre1d = TRUE, pre5d = FALSE)

# 亲友数据导入，如果是一个包，那么可以不用要求使用者加个header，这里需要注意
# raf <- read_xlsx("E:/1R/bir/ourbir.xlsx",sheet = 1) %>%
#   mutate(tosolar = ymd(str_c(as.character(ifelse(year(solarToLunar(today())) < year(today()),
#                                                  year(today())-1,
#                                                  year(today()))),
#                              str_sub(bir,5,8))))

# 如果想打开函数修改，可以去掉函数名，把tbl换成row，然后就是两个pre
#' @export
bir_to <- function(path = ourbir::bir_file("example.xlsx"), pre1d = TRUE, pre5d = TRUE){

  tbl <- read_xlsx(path, sheet = 1) %>%
    mutate(tosolar = ymd(str_c(as.character(ifelse(lubridate::year(solarToLunar(today())) < year(today()),
                                                   lubridate::year(today())-1,
                                                   lubridate::year(today()))),
                               str_sub(bir,5,8))))

  for(i in seq_along(tbl[[1]])){
    if(tbl$calendar[i] == "lunar")
      tbl$tosolar[i] <- lunarToSolar(tbl$tosolar[i])
  }

  tbl <- tbl %>%
    mutate(pre1 = tosolar-days(1),
           pre5 = tosolar-days(5))

  return(
    for(i in seq_along(tbl[[1]])){
      if((pre1d==TRUE)&(pre5d==TRUE)){
        switch(tbl$tosolar[i] == today(),
               multi_color(paste0("Happy Birthday to ",tbl$call[i],"!",'\n',"\n"),
                           color = c('cyan3','coral1','purple2',"red", "orange",
                                     "yellow4", "green", "blue", "purple")))
        switch(tbl$pre1[i] == today(),
               multi_color(paste0("Tomorrow is ",tbl$call[i],"'s birthday! ",
                                  "Ready to celebrate it?",'\n',"\n"),
                           color = c('cyan3','coral1','purple2',"red", "orange",
                                     "yellow4", "green", "blue", "purple")))
        switch(tbl$pre5[i] == today(),
               multi_color(paste0(tbl$call[i],"'s birthday ","is in 5 days! ",
                                  "Have you bought one surprising gift?"),
                           color = c('cyan3','coral1','purple2',"red", "orange",
                                     "yellow4", "green", "blue", "purple")))
      }else if((pre1d==TRUE)&(pre5d==FALSE)){
        switch(tbl$tosolar[i] == today(),
               multi_color(paste0("Happy Birthday to ",tbl$call[i],"!",'\n',"\n"),
                           color = c('cyan3','coral1','purple2',"red", "orange",
                                     "yellow4", "green", "blue", "purple")))
        switch(tbl$pre1[i] == today(),
               multi_color(paste0("Tomorrow is ",tbl$call[i],"'s birthday! ",
                                  "Ready to celebrate it?",'\n',"\n"),
                           color = c('cyan3','coral1','purple2',"red", "orange",
                                     "yellow4", "green", "blue", "purple")))
      }else if((pre1d==FALSE)&(pre5d==TRUE)){
        switch(tbl$tosolar[i] == today(),
               multi_color(paste0("Happy Birthday to ",tbl$call[i],"!",'\n',"\n"),
                           color = c('cyan3','coral1','purple2',"red", "orange",
                                     "yellow4", "green", "blue", "purple")))
        switch(tbl$pre5[i] == today(),
               multi_color(paste0(tbl$call[i],"'s birthday ","is in 5 days! ",
                                  "Have you bought one surprising gift?"),
                           color = c('cyan3','coral1','purple2',"red", "orange",
                                     "yellow4", "green", "blue", "purple")))
      }else if((pre1d==FALSE)&(pre5d==FALSE)){
        switch(tbl$tosolar[i] == today(),
               multi_color(paste0("Happy Birthday to ",tbl$call[i],"!",'\n',"\n"),
                           color = c('cyan3','coral1','purple2',"red", "orange",
                                     "yellow4", "green", "blue", "purple")))
      }
    })
  }

# bir_to(raf)

rm(i,j,k,l,wd_zh,wd_en)
