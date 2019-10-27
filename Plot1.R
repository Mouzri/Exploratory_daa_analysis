oldpar <- par()
setwd("C:/Users/21260/Desktop/R learning/exploratoryDA_prj")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#looping over the list to calculate the sum of the third column

Y <- tapply(NEI$Emissions, NEI$year, sum)
X <- c(1999,2002,2005,2008)
png("Plot1.png")
plot(X,Y,pch=20,type = "b",xlab = "Years",ylab = "total pollution",
     main ="sum of pollution substance over years")
dev.off()
