#getwd()#相對路徑
library(argparser)
a <- file.path(getwd(),"/data")
b <- list.files(a,pattern = ".csv")
data <- list() #list存放讀取的檔案

#讀取檔案
for (i in 1:length(b)) {
  data[[i]] <- read.csv(paste0(a,"/",b[[i]]))
}

set <- c()
weight <- c()
height <- c()
data_output <- list()
#maximum value of weight and height
for (i in 1:length(b)) {
  max_data <- data.frame(data[i])
  set[[i]] <- b[[i]]
  weight[[i]] <- max(max_data$weight)
  height[[i]] <- max(max_data$height)
  data_output[[i]] <- data.frame(set =set[[i]] ,weight =weight[[i]],height =height[[i]])
}

#匯出csv
for (i in 1:length(data_output)) {
  write.csv(data_output[[i]],file = paste0(getwd(),"/eval/output",i,".csv"),row.names = FALSE)
}

#R_Command-line
f <- arg_parser("Process input and output csv")
f <- add_argument(f,'--input',help='read input csv file',
                  default = 'input1.csv')
f <- add_argument(f,'--output',help='output result csv file',
                  default = 'output1.csv')
#command-line 可以呈現出csv的結果
#cmd可以直接印出結果
args <- parse_args(f)
read.csv(paste0(a,'/',args$input),header=T)
d <- file.path(getwd(),"//eval")
read.csv(paste0(d,'/',args$output),header=T)




