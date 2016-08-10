plot1 <- function(){
    # Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
    # Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
    # for each of the years 1999, 2002, 2005, and 2008.
    
    library(data.table)
    
    pm25  <- readRDS("summarySCC_PM25.rds")
    pm25code  <- readRDS("Source_Classification_Code.rds")
    
    years <- c("1999", "2002", "2005", "2008")
    
    pollution <-  c(sum(pm25[pm25$year == 1999, ]$Emissions),
                    sum(pm25[pm25$year == 2002, ]$Emissions),
                    sum(pm25[pm25$year == 2005, ]$Emissions),
                    sum(pm25[pm25$year == 2008, ]$Emissions))
    
    data <- data.table("years"=years, "pollution"=pollution)
    
    #sum(pm25[pm25$year == 1999, ]$Emissions)#
    
    png(filename="plot1.png")
    
    barplot(names.arg = data$years, height = data$pollution,  col="red",
         main="Total Emissions by Year (1999-2008) ", 
         xlab="Year", 
         ylab="Total Emissions (tons)")
    
    dev.off()

}