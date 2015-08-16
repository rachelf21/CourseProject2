data<-readRDS("summarySCC_PM25.rds")


data3<-data[data$fips==24510,c("type", "Emissions","year")]
library(dplyr)

ques3<-data3 %>% group_by(type, year) %>% summarize(total = sum(Emissions))

g<-ggplot(data=ques3, aes(x=year, y=total, group=type, color=type))
g +geom_line(size=.5) + geom_point(size=5, alpha=3/4) +labs(title="Baltimore Emissions of PM2.5 by Type", x="Year", y="Emissions")



dev.copy(png, "plot3.png", width=600)
dev.off()

