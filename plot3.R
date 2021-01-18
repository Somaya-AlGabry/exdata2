#Of the four types of sources indicated by the type (point, nonpoint, onroad,
#nonroad) variable, which of these four sources have seen decreases in emissions
#from 1999–2008 for Baltimore City? Which have seen increases in emissions from
#1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


source("read_data.R")

baltimore2 <- NEI %>% filter(fips == "24510") %>%
  group_by(type, year) %>%
  summarise(year.total = sum (Emissions))

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

g <- ggplot(baltimore2, aes(year, year.total))
g + geom_bar(stat = "identity") +
  facet_grid(.~type) +
  theme_bw() +
  ylab("Total PM2.5 Emission") +
  ggtitle("Question 3",
          subtitle = "total emissions from PM2.5 in Baltimore by source type")

dev.off()