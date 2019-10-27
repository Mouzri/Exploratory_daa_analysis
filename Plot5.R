oldpar <- par()
setwd("C:/Users/21260/Desktop/R learning/exploratoryDA_prj")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
t2 <- as.character(SCC$Short.Name)
z2 <- tolower(t2)
lg3 <- grepl(pattern = "[mM][otor]",SCC$Short.Name)
causeref2 <- as.character(SCC$SCC[lg3])
lg2 <- NEI$SCC%in%causeref2
motor_df <- NEI[lg2,]
motor_mean <- with(motor_df,tapply(Emissions, year, mean)) 
png("Plot5.png",width = 500)
plot(x = c(1999,2002,2005,2008),y = motor_mean,pch=20,type = "b",
     xlab = "Year",ylab = "motor emission's mean",main = "change of motor emission over time")
dev.off()