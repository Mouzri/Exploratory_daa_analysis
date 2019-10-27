oldpar <- par()
setwd("C:/Users/21260/Desktop/R learning/exploratoryDA_prj")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore <- subset(NEI,subset = NEI$fips=="24510")
ft <- factor(baltimore$type,levels = unique(baltimore$type))
spl_balt <- split(baltimore,f = ft )
emiss_mean <- function(df){
  with(df,tapply(Emissions, year, mean,na.rm=TRUE))
}
type_mean <- sapply(spl_balt, emiss_mean)
#using ggplot
library(ggplot2)
library(reshape2)
head(type_mean)
year <- row.names(type_mean)
type <- colnames(type_mean)
reshapedata <- melt(type_mean,id.vars="year",measure.vars="type",varnames = c("year","type"))
png("Plot3.png",antialias = "cleartype",width = 1500)
ggplot(reshapedata,mapping = aes(x = year,y = value))+geom_point()+
  facet_wrap(.~type,scales = "free")+theme_bw()+geom_line()
dev.off()
# #or using base plot system
# rng <- range(type_mean)
# par(mfrow=c(2,2))
# #Pont type gragh
# X1 <- c(1999,2002,2005,2008)
# Y1 <- type_mean[,1]
# plot(X1,Y1,type = "b",pch=20,xlab = "Years",ylab = "Emissions",
#      main ="'Point' type Baltimore's pollution",ylim = rng)
# #NonPoint type gragh
# Y2 <- type_mean[,2]
# plot(X1,Y2,type = "b",pch=20,xlab = "Years",ylab = "Emissions",
#      main ="'NONPoint' type Baltimore's pollution",ylim = rng)
# #OnroadPoint type gragh
# Y3 <- type_mean[,3]
# plot(X1,Y3,type = "b",pch=20,xlab = "Years",ylab = "Emissions",
#      main ="'Onroad' type Baltimore's pollution",ylim = rng)
# #NonRoad type gragh
# Y4 <- type_mean[,4]
# plot(X1,Y4,type = "b",pch=20,xlab = "Years",ylab = "Emissions",
#      main ="'NonRoad' type Baltimore's pollution",ylim = rng)


