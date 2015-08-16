data<-readRDS("summarySCC_PM25.rds")
data$Emissions<-data$Emissions/1000

library(dplyr)
ques1<-data %>% group_by(year) %>% summarize(total = sum(Emissions))

plot(ques1,xlab="Year", ylab="Emissions (in thousands)", main="Total Emissions of PM2.5 in the United States", type="b", lwd=2,xaxt="n", col="blue")
axis(1, at=c("1999", "2002", "2005", "2008"))

dev.copy(png, "plot1.png")
dev.off()

