plot1 <- function(){
    # Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
    # Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
    # for each of the years 1999, 2002, 2005, and 2008.
    
    #import data table library
    library(data.table)
    
    #import fata file
    pm25  <- readRDS("summarySCC_PM25.rds")
    
    #create year list
    years <- c("1999", "2002", "2005", "2008")
    
    #ceate list of total emissions by year
    pollution <-  c(sum(pm25[pm25$year == 1999, ]$Emissions),
                    sum(pm25[pm25$year == 2002, ]$Emissions),
                    sum(pm25[pm25$year == 2005, ]$Emissions),
                    sum(pm25[pm25$year == 2008, ]$Emissions))
    
    #create data table of year and emissions
    data <- data.table("years"=years, "pollution"=pollution)
    
    png(filename="plot1.png")
    
    #plot data
    barplot(names.arg = data$years, height = data$pollution,  col="red",
         main="Total Emissions by Year (United States, 1999-2008) ", 
         xlab="Year", 
         ylab="Total Emissions (tons)")
    
    dev.off()

}