data<-readRDS("summarySCC_PM25.rds")
data$Emissions<-data$Emissions/1000
data2<-data[data$fips==24510,c("Emissions","year")]
library(dplyr)

ques2<-data2 %>% group_by(year) %>% summarize(total = sum(Emissions))


par(col.lab="slateblue4", col.main="slateblue4",col.axis="slateblue4", font.axis=2, font.lab=2, fg="azure2")  
plot(ques2,xlab="Year", ylab="Emissions (in thousands)",  main="Total Emissions of PM2.5 in Baltimore City", type="b",pch=18, lwd=2,xaxt="n", col="slateblue4")
axis(1, at=c("1999", "2002", "2005", "2008"))
grid()

dev.copy(png, "plot2.png")
dev.off()

