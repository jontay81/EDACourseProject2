plot5 <- function(){
    #How have emissions from motor
    #vehicle sources changed from 
    #1999-2008 in Baltimore City?
    
    library(data.table)
    library(dplyr)
    
    pm25  <- readRDS("summarySCC_PM25.rds")
    pm25scc <- readRDS("Source_Classification_Code.rds")
    
    #subset baltimore
    pm25 <-  pm25[pm25$fips == 24510, ]
    
    #subset for motor vehicles
    pm25sccVehicle  <- pm25scc[pm25scc$SCC.Level.Two %like% "Vehicle", ]
    
    pm25Vehicle <- pm25[pm25$SCC %in% pm25sccVehicle$SCC, ]
    
    pollution <-  c(sum(pm25Vehicle[pm25Vehicle$year == 1999, ]$Emissions),
                    sum(pm25Vehicle[pm25Vehicle$year == 2002, ]$Emissions),
                    sum(pm25Vehicle[pm25Vehicle$year == 2005, ]$Emissions),
                    sum(pm25Vehicle[pm25Vehicle$year == 2008, ]$Emissions))
    
    years <- c("1999", "2002", "2005", "2008")
    
    data <- data.table("years"=years, "pollution"=pollution)
    
    png(filename="plot5.png")
    
    barplot(names.arg = data$years, height = data$pollution,  col="red",
            main="Vehicle Emissions by Year (Baltimore, 1999-2008) ", 
            xlab="Year", 
            ylab="Vehicle Emissions (tons)")
    
    dev.off()
    
}