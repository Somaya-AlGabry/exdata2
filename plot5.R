#How have emissions from motor vehicle sources changed from 1999–2008 in 
#Baltimore City?

source("read_data.R")
vehicles <- SCC [grep("[Vv]ehicle", SCC$EI.Sector),]
vehiclesSCC <- unique(vehicles$SCC)
NEIveh <- subset(NEI, SCC %in% vehiclesSCC)

baltimoreVeh <- NEIveh %>% filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(year.total = sum (Emissions))

png(filename = "plot5.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

barplot(names.arg =  baltimoreVeh$year, height = baltimoreVeh$year.total, 
        col= "turquoise4", 
        xlab = "Year", ylab = "Total PM2.5 Emission",
        main = "Question 5",
        sub =   "emissions from motor vehicle decreased in Baltimore from 1999 to 2008"
)

dev.off()