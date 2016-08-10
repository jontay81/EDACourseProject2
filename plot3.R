plot3 <- function(){
    #Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
    #variable, which of these four sources have seen decreases in emissions 
    #from 1999-2008 for Baltimore City? Which have seen increases in emissions 
    #from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
    
    library(data.table)
    library(ggplot2)
    
    pm25  <- readRDS("summarySCC_PM25.rds")
    
    #subsets for baltimore, fips == 24510
    pm25 <-  pm25[pm25$fips == 24510, ]

    
    sum(pm25[pm25$year == 1999, ]$Emissions)#
    
    png(filename="plot2.png")
    
    ggplot(data=pm25bm, aes(pm25bm$year, fill=type)) + geom_bar() +
        
  
    
    #dev.off()
}
