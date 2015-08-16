library(dplyr)
library(ggplot2)
library(ggthemes)

data<-readRDS("summarySCC_PM25.rds")

data6<- data[(data$fips=="24510" | data$fips=="06037") & data$type=="ON-ROAD",c("fips","year", "Emissions")]


ques6<- data6 %>% group_by(fips,year) %>% summarize(total = sum(Emissions))
ques6$fips<-factor(ques6$fips, labels=c("Los Angeles", "Baltimore"))
colnames(ques6)<-c("City","Year", "Emissions")

g1<-ggplot(data=ques6, aes(x=Year, y=Emissions))+facet_grid(.~City, scales="free_y") +theme_solarized_2()
g1<-g1 + geom_point(size=3, alpha=3/4) +geom_smooth(method="lm", se=FALSE, size=2) +labs(title="Changes in Emissions of PM2.5", x="Year", y="Emissions")
g1

g2<-ggplot(data=ques6[ques6$City=="Baltimore",], aes(x=Year, y=Emissions))
g2<-g2 + geom_point(size=3, alpha=3/4) +geom_smooth(method="lm", se=FALSE, size=2) +labs(title="Changes in Emissions of PM2.5 in Baltimore", x="Year", y="Emissions")

grid.arrange(g1, g2, nrow=1, ncol=2)

dev.copy(png, "plot6.png", width=800)
dev.off()

