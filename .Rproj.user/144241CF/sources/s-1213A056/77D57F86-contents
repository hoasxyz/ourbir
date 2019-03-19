# t <- read.csv2("./Excel/T2019c.txt",
#               header = FALSE, sep = " ", skip = 3, fileEncoding = "BIG5")

# en <- fread("https://data.weather.gov.hk/gts/time/calendar/text/T2019e.txt",
#             fill = TRUE, header = FALSE, skip = 2, encoding = "UTF-8", sep = " ")
#
# en <- read.csv("T2019e.txt", header = FALSE, sep = "")
#
# zh <- fread("T2019c.txt",
#             fill = TRUE, header = FALSE, skip = 3, encoding = "UTF-8")

#' @importFrom readxl read_xlsx

#' @importFrom lubridate ymd

# 读取数据以及初步处理
load("R/sysdata.rda")

# wd_en <- fread("E:/1R/bir/T2019e.txt",
#             fill = TRUE, header = FALSE, skip = 2) %>%
#   rename(solar = V1, lunar = V2, week = V3) %>%
#   as_tibble() %>%
#   mutate(month = NA)
#
# wd_zh <- fread("E:/1R/bir/T2019c.txt",
#                header = FALSE, skip = 3, fill = TRUE, encoding = "UTF-8") %>%
#   mutate(solarTerm = ifelse(V4 == "", "", V4)) %>%
#   select(2,3,5) %>%
#   rename("lunar_zh" = "V2", "week_zh" = "V3") %>%
#   as_tibble()

# wd_en <- read.table("T2019e.txt",
#                     header = FALSE, sep = ' ', skip = 2, fill = TRUE) %>%
#   select(V1,V9:V11) %>%
#   rename(solar = V1) %>%
#   as.character()

# 英文空白合并以及合并后处理，将每个初一对应的阴历月份提取出来，成为一行
for(i in seq_along(wd_en[[1]])){
  if(str_detect(wd_en[[2]][i],"[td]")){
    wd_en[[3]][i] <- wd_en[[5]][i]
    wd_en[[2]][i] <- str_replace(wd_en[[2]][i],"(.d)|(th)|(st)","/1")
    wd_en$month[i] <- as.numeric(str_split(wd_en[[2]][i], "/", simplify = TRUE)[1])
    wd_en$lunar[i] <- str_split(wd_en[[2]][i], "/", simplify = TRUE)[2]
  }
}

# 字符型转换进行迭代，非初一的月份显示以及阴历年的显示
wd_en <- wd_en %>%
  select(1:3,month) %>%
  mutate(year = 0)

j <- 0; k <- 0; l <- length(wd_en[[1]])
for(i in seq_along(wd_en[[1]])){
  if(!is.na(wd_en[[4]][i])){
    j <- i - 1
    if(wd_en[[4]][i]-1 < 1){
      wd_en[[4]][k:j] <- 12
    }else{
      wd_en[[4]][k:j] <- wd_en[[4]][i]-1
    }
    k <- i + 1
  }else if((i == l)&(is.na(wd_en[[4]][i]))){
    wd_en[[4]][k:l] <- wd_en[[4]][k-1]
  }
}

# 英文最终整理
j <- 0
for(i in seq_along(wd_en[[1]])){
  if(wd_en$month[i] == 1){
    j <- i
    wd_en$year[j:length(wd_en[[1]])] <- as.numeric(str_split(wd_en$solar,"/",simplify = TRUE)[1])
    break
  }
}
wd_en$year[1:(j-1)] <- as.numeric(str_split(wd_en$solar,"/",simplify = TRUE)[1])-1

wd_en$month <- as.character(wd_en$month)

# 单数字月份/日期字符同一加上0
for(i in seq_along(wd_en[[1]])){
  if(nchar(wd_en$month[i]) == 1) wd_en$month[i] <- str_c("0",wd_en$month[i])
  if(nchar(wd_en$lunar[i]) == 1) wd_en$lunar[i] <- str_c("0",wd_en$lunar[i])
}


# 2-29显示不出来！！！
wd_en$lunar <- str_c(as.character(wd_en$year),
                  "-",
                  as.character(wd_en$month),
                  "-",
                  wd_en$lunar)

wd_en$solar <- lubridate::ymd(wd_en$solar)

# 合并中文
tb <- wd_en %>%
  select(1:3) %>%
  cbind(wd_zh) %>%
  as_tibble()
