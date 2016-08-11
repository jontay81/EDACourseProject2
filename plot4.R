plot4 <- function(){
    #Across the United States, how have emissions from coal 
    #combustion-related sources changed from 1999-2008?
    
    library(data.table)
    library(dplyr)
    
    pm25  <- readRDS("summarySCC_PM25.rds")
    pm25scc <- readRDS("Source_Classification_Code.rds")

    #retrieve coal SCC
    pm25sccCoal  <- pm25scc[pm25scc$Short.Name %like% "coal", ]
    
    
    #subset emissions where SCC = coal SCC
    pm25coal <- pm25[pm25$SCC %in% pm25sccCoal$SCC, ]
    
    pollution <-  c(sum(pm25coal[pm25coal$year == 1999, ]$Emissions),
                    sum(pm25coal[pm25coal$year == 2002, ]$Emissions),
                    sum(pm25coal[pm25coal$year == 2005, ]$Emissions),
                    sum(pm25coal[pm25coal$year == 2008, ]$Emissions))
    
    years <- c("1999", "2002", "2005", "2008")
    
    data <- data.table("years"=years, "pollution"=pollution)
    
    png(filename="plot4.png")
    
    barplot(names.arg = data$years, height = data$pollution,  col="red",
            main="Carbon Emissions by Year (United States, 1999-2008) ", 
            xlab="Year", 
            ylab="Carbon Emissions (tons)")
    
    dev.off()S
    
}