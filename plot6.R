library(dplyr)
library(ggplot2)
library(ggthemes)

data<-readRDS("summarySCC_PM25.rds")

data6<- data[(data$fips=="24510" | data$fips=="06037") & data$type=="ON-ROAD",c("fips","year", "Emissions")]


ques6<- data6 %>% group_by(fips,year) %>% summarize(total = sum(Emissions))
ques6$fips<-factor(ques6$fips, labels=c("Los Angeles", "Baltimore"))
colnames(ques6)<-c("City","Year", "Emissions")

g1<-ggplot(data=ques6, aes(x=Year, y=Emissions, col=City))+facet_grid(City ~ ., scales="free") +theme_solarized_2()
g1<-g1 + geom_point(size=5, fill="beige", alpha=3/4) +geom_line(size=1)  +labs(title="Changes in Emissions of PM2.5", x="Year", y="Emissions")
# +geom_smooth(method="lm", se=FALSE, size=1) , col="firebrick4"
g1<-g1+theme(plot.title = element_text(color="firebrick4",size=20, face="bold", vjust=1.5, lineheight=.6))
g1<-g1+theme(axis.title.x=element_text(face="bold", vjust=-.2, size=14))
g1<-g1+theme(axis.title.y=element_text(face="bold", vjust=1.5, size=14))
g1


dev.copy(png, "plot6.png", width=500)
dev.off()

