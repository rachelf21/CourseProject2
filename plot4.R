data<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal<-grep("^fuel comb -(.*)- coal$", SCC$EI.Sector, ignore.case=T)
coal<-SCC[coal,c("SCC")]
data4<- data[data$SCC%in% coal,c("year","Emissions")]

library(dplyr)

  
ques4<-data4 %>% group_by(year) %>% summarize(total = sum(Emissions))

g<-ggplot(data=ques4, aes(x=year, y=total))
g +geom_line(size=.5) + geom_point(size=5, alpha=3/4) +labs(title="Coal Emissions in the United States", x="Year", y="Emissions")



dev.copy(png, "plot4.png", width=500)
dev.off()

