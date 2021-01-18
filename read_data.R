#download data:
filename <- "exdata_data_NEI_data.zip"
if (!file.exists(filename)){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileUrl, filename)
}
if (!file.exists("summarySCC_PM25.rds")) { 
  unzip(filename) 
}
if (!file.exists("Source_Classification_Code.rds")) { 
  unzip(filename) 
}

#read data:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#basic exploratory data analysis:
str(NEI)
head(NEI)
summary(NEI)

str(SCC)
head(SCC)

unique(NEI$year)

#libraries:
library(dplyr)
