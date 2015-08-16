library(dplyr)

data<-readRDS("summarySCC_PM25.rds")
data5<- data[data$fips==24510 & data$type=="ON-ROAD",c("year","type", "Emissions")]


ques5<- data5 %>% group_by(year) %>% summarize(total = sum(Emissions))

g<-ggplot(data=ques5, aes(x=year, y=total))
g +geom_line(size=.5) + geom_point(size=5, alpha=3/4) +labs(title="Vehicle Emissions of PM2.5 in Baltimore", x="Year", y="Emissions")



dev.copy(png, "plot5.png", width=500)
dev.off()

