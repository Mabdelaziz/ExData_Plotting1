
plot2 <- function ( wd = "C:/f/R/git/ExData_Plotting1", datefrom = "31/1/2007" , dateto = "3/2/2007"  ,...)
{
  setwd( wd)
  directory <- "exdata_data_household_power_consumption"
  fn <- "household_power_consumption.txt"
  filen <- file.path (directory, fn)
  conn <- file ( filen , "r")
  data<-read.table (conn , header=  TRUE , sep= ";" ,na.strings="?")
  close(conn)
  
  #######################################################################
  
  ## filter required data 
  data07 <- data[ as.Date(data$Date ,"%d/%m/%Y") > as.Date(datefrom ,"%d/%m/%Y") &  
                    as.Date(data$Date,"%d/%m/%Y") < as.Date(dateto,"%d/%m/%Y") ,]
  Data<- NULL
  data07$datetime<- as.POSIXct(strptime(paste(data07$Date, data07$Time), "%d/%m/%Y %H:%M:%S"))
  
  ##data$datetime <- paste(data$Date, data$Time)
  ##data$datetime<- as.Date(strptime(data$datetime,"%d/%m/%Y %H:%M:%S"  )) 
  data07$Global_active_power  <- as.numeric( data07$Global_active_power)
  
  #######################################################################
  ## plot1
  par( mfrow = c( 1,1))
  
  RR<- plot(   data07$datetime ,data07$Global_active_power   , type ="l" , xlab= " " ,ylab = "Global Active Power (Kilowatts)"  ) 
  
  ## coping output to png file "plot4.png"
  dev.copy(png,filename="plot2.png" , height=480, width=480);
  dev.off()
  
  return(RR)
  
}

