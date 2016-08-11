plot2 <-  function(){
    #Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
    #(fips == "24510") from 1999 to 2008? Use the base plotting system to make
    #a plot answering this question.
    
    library(data.table)
    
    pm25  <- readRDS("summarySCC_PM25.rds")
    
    #subsets for baltimore, fips == 24510
    pm25 <-  pm25[pm25$fips == 24510, ]
     
    years <- c("1999", "2002", "2005", "2008")
    
    pollution <-  c(sum(pm25[pm25$year == 1999, ]$Emissions),
                    sum(pm25[pm25$year == 2002, ]$Emissions),
                    sum(pm25[pm25$year == 2005, ]$Emissions),
                    sum(pm25[pm25$year == 2008, ]$Emissions))
    
    data <- data.table("years"=years, "pollution"=pollution)
    
    png(filename="plot2.png")
    
    barplot(names.arg = data$years, height = data$pollution,  col="red",
         main="Total Emissions by Year (Baltimore City, 1999-2008) ", 
         xlab="Year", 
         ylab="Total Emissions (tons)")
    
    dev.off()
    
}

