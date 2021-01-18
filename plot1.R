#Have total emissions from PM2.5 decreased in the United States
#from 1999 to 2008? Using the base plotting system, make a plot 
#showing the total PM2.5 emission from all sources for each of
#the years 1999, 2002, 2005, and 2008.


source("read_data.R")

by_year <- NEI %>% group_by(year) %>%
  summarise(year.total = sum (Emissions))

png(filename = "plot1.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

barplot(names.arg = by_year$year, height= by_year$year.total/1000000,
        col= "darkred", 
        xlab = "Year", ylab = "Total PM2.5 Emission (in millions)",
        main = "Question 1",
        sub =   "total emissions from PM2.5 decreased in the United States from 1999 to 2008"
)
dev.off()

