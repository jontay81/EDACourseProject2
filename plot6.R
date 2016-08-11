plot6 <- function(){
    #Compare emissions from motor vehicle sources in Baltimore City
    #with emissions from motor vehicle sources in Los Angeles County,
    #California (fips == "06037"). Which city has seen 
    #greater changes over time in motor vehicle emissions?  
 
    
    library(data.table)
    library(dplyr)
    library(ggplot2)
    
    pm25  <- readRDS("summarySCC_PM25.rds")
    pm25scc <- readRDS("Source_Classification_Code.rds")
    
    #subset baltimore
    pm25bm <-  pm25[pm25$fips == 24510, ]
    pm25la <- pm25[pm25$fips == "06037", ]
    
    pm25sccVehicle  <- pm25scc[pm25scc$SCC.Level.Two %like% "Vehicle", ]
    
    pm25Vehiclebm <- pm25bm[pm25bm$SCC %in% pm25sccVehicle$SCC, ]
    pm25Vehiclela <- pm25la[pm25la$SCC %in% pm25sccVehicle$SCC, ]
    
    
    pollutionbm <-  c(sum(pm25Vehiclebm[pm25Vehiclebm$year == 1999, ]$Emissions),
                    sum(pm25Vehiclebm[pm25Vehiclebm$year == 2002, ]$Emissions),
                    sum(pm25Vehiclebm[pm25Vehiclebm$year == 2005, ]$Emissions),
                    sum(pm25Vehiclebm[pm25Vehiclebm$year == 2008, ]$Emissions))
    
    pollutionla <-  c(sum(pm25Vehiclela[pm25Vehiclela$year == 1999, ]$Emissions),
                      sum(pm25Vehiclela[pm25Vehiclela$year == 2002, ]$Emissions),
                      sum(pm25Vehiclela[pm25Vehiclela$year == 2005, ]$Emissions),
                      sum(pm25Vehiclela[pm25Vehiclela$year == 2008, ]$Emissions))
    
    years <- c("1999", "2002", "2005", "2008")
    
    data <- data.table("years"=years, "emissions"=pollutionbm, "city"="Baltimore")
    data2 <- data.table("years"=years, "emissions"=pollutionla, "city"="Los Angeles")
    
    
    
    data <- rbind(data,data2)
    
    png(filename="plot6.png")
    
    print(ggplot(data=data, aes(data$years, data$emissions, col=city, group = city))
          + geom_point() + geom_line() + labs(x="Year", y="Emissions",
                                            title="Emissions by Year ( Baltimore and Los Angeles County, 1999-2008)"))
    
    dev.off()
    
       
}