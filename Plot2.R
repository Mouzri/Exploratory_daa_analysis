oldpar <- par()
setwd("C:/Users/21260/Desktop/R learning/exploratoryDA_prj")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore <- subset(NEI,subset = NEI$fips=="24510")
Y <- tapply(baltimore$Emissions, baltimore$year, sum)
X <- c(1999,2002,2005,2008)
png("Plot2.png")
plot(X,Y,pch=20,type = "b",xlab = "Years",ylab = "total pollution",
     main ="Baltimore's sum of pollution substance over years")

dev.off()
