#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?

source("read_data.R")

coal <- SCC [grep("[Cc]oal", SCC$EI.Sector), ]
coalSCC <- unique(coal$SCC)
NEIcoal <- subset(NEI, SCC %in% coalSCC)

coal_by_year <- NEIcoal %>% group_by(year) %>%
  summarise(year.total = sum (Emissions))


png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

barplot(names.arg =  coal_by_year$year, height =  coal_by_year$year.total/1000, 
     col= "steelblue", 
     xlab = "Year", ylab = "Total PM2.5 Emission (in thousands)",
     main = "Question 4",
     sub =   "emissions from coal combustion-related sources decreased from 1999–2008 in US"
)
dev.off()

colors()
