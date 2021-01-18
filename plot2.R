#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# from 1999 to 2008? Use the base plotting system to make a plot answering 
#this question.


source("read_data.R")

baltimore <- NEI %>% filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(year.total = sum (Emissions))

png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

barplot(names.arg =  baltimore$year, height = baltimore$year.total/1000, 
     col= "purple", 
     xlab = "Year", ylab = "Total PM2.5 Emission (in thousands)",
     main = "Question 2",
     sub =   "total emissions from PM2.5 decreased in Baltimore from 1999 to 2008"
)

dev.off()