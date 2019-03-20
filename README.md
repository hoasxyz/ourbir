# 写在前面

这个包算是过了个 R 包开发的流程，自动化程度也不高，主要是依据数据完成短时期内（一年，年更）的阴阳历转化，顺便加个生日提醒。不打算提交 CARN ，感觉会更麻烦……

# 如何使用

## 安装

```r
# install.packages("devtools") 
devtools::install_github("hoasxyz/ourbir") 
```

## 使用

阴阳历转化的两个函数`lunarToSolar()`和`solarToLunar()`都是可以直接用的，不过**仅限本年**！好吧，我知道下一个版本要干嘛了……

生日提醒的话也可以，不过需要手动输入一些数据。我提前给出了一个模板：

``` r
library(ourbir)

bir_file()
#> [1] "example.csv"  "example.xls"  "example.xlsx"

bir_file("example.csv" )
#> [1] "E:/R-3.5.3/library/ourbir/extdata/example.csv"
```

<sup>Created on 2019-03-19 by the [reprex package](https://reprex.tidyverse.org) (v0.2.1)</sup>

这里给出了对应文件的路径，你可以在`bir_to()`函数中使用：

```R
bir_to(pre1d = T)
#> Happy Birthday to ourbir!
```

其中`bir_to`的`path`选项为以上文件的路径，默认给的是`.xlsx`，默认也是引用`example.xlsx`文件中的生日信息，不过若想引用别处的生日表，修改路径即可：

```R
bir_to(path = "YourFilePATH")
```



# 改进

- 用算法解决阴阳历转化的问题我是不会去折腾的了；
- 可以加一个年龄提醒；
- 每年都需要更新（换日历表）看未来能不能解决；
- 我知道还有更多可我就是想不起来😜。