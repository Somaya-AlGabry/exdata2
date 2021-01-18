#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California.  Which city has
#seen greater changes over time in motor vehicle emissions?

source("read_data.R")
vehicles <- SCC [grep("[Vv]ehicle", SCC$EI.Sector),]
vehiclesSCC <- unique(vehicles$SCC)
NEIveh <- subset(NEI, SCC %in% vehiclesSCC)


Veh <- NEIveh %>% filter(fips =="24510"| fips == "06037") %>%
  group_by(fips, year) %>%
  summarise(year.total = sum (Emissions))

Veh$fips[Veh$fips == "24510"] <- "Baltimore"
Veh$fips[Veh$fips == "06037"] <- "Los Angeles"


png(filename = "plot6.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

g2 <- ggplot(Veh, aes(factor(year), year.total))
g2 + geom_bar(stat = "identity") +
  facet_grid(.~ fips) +
  xlab("Year") + 
  ylab("total PM2.5 emissions")

dev.off()

