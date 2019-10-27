oldpar <- par()
setwd("C:/Users/21260/Desktop/R learning/exploratoryDA_prj")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
t1 <- as.character(SCC$Short.Name)
z1 <- tolower(t1)
lg <- grepl(pattern = "[comb][ustion]+(*.)+[coal]",z1)
causeref <- as.character(SCC$SCC[lg])
lg2 <- NEI$SCC%in%causeref
coal_df <- NEI[lg2,]
coal_mean <- with(coal_df,tapply(Emissions, year, mean)) 
png("Plot4.png",width = 500)
plot(x = c(1999,2002,2005,2008),y = coal_mean,pch=20,type = "b",
     xlab = "Year",ylab = "Coal emission's mean",main = "change of coal emission over time")
dev.off()