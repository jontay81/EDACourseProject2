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
    
    pollutiontype <- function(pm25){
        pollution <-  c(sum(pm25[pm25$year == 1999, ]$Emissions),
                        sum(pm25[pm25$year == 2002, ]$Emissions),
                        sum(pm25[pm25$year == 2005, ]$Emissions),
                        sum(pm25[pm25$year == 2008, ]$Emissions))
        
        return(pollution)
    }

    point <- pm25[pm25$type == "POINT", ]
    nonpoint <- pm25[pm25$type == "NONPOINT", ]
    onroad <- pm25[pm25$type == "ON-ROAD", ]
    nonroad <- pm25[pm25$type == "NON-ROAD", ]
    
    point <-  c(sum(point[point$year == 1999, ]$Emissions),
                sum(point[point$year == 2002, ]$Emissions),
                sum(point[point$year == 2005, ]$Emissions),
                sum(point[point$year == 2008, ]$Emissions))
    
    nonpoint <-  c(sum(nonpoint[nonpoint$year == 1999, ]$Emissions),
                sum(nonpoint[nonpoint$year == 2002, ]$Emissions),
                sum(nonpoint[nonpoint$year == 2005, ]$Emissions),
                sum(nonpoint[nonpoint$year == 2008, ]$Emissions))
    
    onroad  <-  c(sum(onroad[onroad$year == 1999, ]$Emissions),
                sum(onroad[onroad$year == 2002, ]$Emissions),
                sum(onroad[onroad$year == 2005, ]$Emissions),
                sum(onroad[onroad$year == 2008, ]$Emissions))
    
    nonroad <-  c(sum(nonroad[nonroad$year == 1999, ]$Emissions),
                sum(nonroad[nonroad$year == 2002, ]$Emissions),
                sum(nonroad[nonroad$year == 2005, ]$Emissions),
                sum(nonroad[nonroad$year == 2008, ]$Emissions))
  
    years <- c("1999", "2002", "2005", "2008")
    
    data <- data.table("type"="Point","years"=years, "emissions"=point)     
    data2 <- data.table("type"="Non-point","years"=years, "emissions"=nonpoint) 
    data3 <- data.table("type"="On Road","years"=years, "emissions"=onroad) 
    data4 <- data.table("type"="Non-road","years"=years, "emissions"=nonroad) 
    
    data <- rbind(data,data2)
    data <- rbind(data,data3)
    data <- rbind(data,data4)
    
    png(filename="plot3.png")
    
    ggplot(data=data, aes(data$year, data$emissions, col=type)) + geom_bar()
    
    
    dev.off()
}
