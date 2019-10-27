oldpar <- par()
setwd("C:/Users/21260/Desktop/R learning/exploratoryDA_prj")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
t <- as.character(SCC$Short.Name)
z <- tolower(t)
lg <- grepl(pattern = "[mM][otor]",SCC$Short.Name)
causeref <- as.character(SCC$SCC[lg])
lg2 <- NEI$SCC%in%causeref2
motor_df <- NEI[lg2,]
ba_mot_df <- subset(motor_df,subset = motor_df$fips=="24510")
LA_nw_df <- motor_df[which(motor_df$fips=="06037"),]
png("Plot6.png",width = 1000)
par(mfrow=c(1,2))
ba_dt_mean <- with(ba_mot_df,tapply(Emissions, year, mean))
LA_dt_mean <- with(LA_nw_df,tapply(Emissions, year, mean))
rng <- range(ba_dt_mean,LA_dt_mean)
plot(x = c(1999,2002,2005,2008),y =ba_dt_mean,xlab = "year",
                   ylab = "motor vehicle sources emissions",pch=20,type = "b",ylim = rng,
                   main = "Mean of emissions in Baltimore")
plot(x = c(1999,2002,2005,2008),y =LA_dt_mean,xlab = "year",
                   ylab = "motor vehicle sources emissions",pch=20,type = "b",ylim=rng,
                   main = "Mean of emissions in Los Angeles ")
dev.off()

