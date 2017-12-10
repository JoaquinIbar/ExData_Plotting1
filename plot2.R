## PLOT 2

# UNZIPPING AND LOADING DATA
unzip("data\\exdata_data_household_power_consumption.zip") #It will be stored temporally in the root folder
power_con <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# CLEANING DATA
# Set the right class for each variable
power_con$Date <- as.Date(power_con$Date, format="%d/%m/%Y")
power_con$Time <- format(power_con$Time, format="%H:%M:%S")
power_con$Global_active_power <- as.numeric(power_con$Global_active_power)
power_con$Global_reactive_power <- as.numeric(power_con$Global_reactive_power)
power_con$Voltage <- as.numeric(power_con$Voltage)
power_con$Global_intensity <- as.numeric(power_con$Global_intensity)
power_con$Sub_metering_1 <- as.numeric(power_con$Sub_metering_1)
power_con$Sub_metering_2 <- as.numeric(power_con$Sub_metering_2)
power_con$Sub_metering_3 <- as.numeric(power_con$Sub_metering_3)

# Subset to the asked data (2007-02-01 and 2007-02-02)
ploting_data <- subset(power_con, Date == "2007-02-01" | Date =="2007-02-02")

# MAKE AND SAVE THE PLOT
# Specify the lang in English
Sys.setlocale("LC_TIME","English")
png(file="plot2.png",width=480,height=480)
plot(x = as.POSIXct(paste(ploting_data$Date, ploting_data$Time)), y = ploting_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

## END PLOT 2