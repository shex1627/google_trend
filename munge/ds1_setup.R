######################
# Setting Up Dataset 1
######################
ds1 <- read.csv("data/1DS.csv", header = FALSE)
dates <- seq(as.Date("2011/11/06"), as.Date("2015/11/06"), by = "week")
colnames(ds1) <- "percent"
ds1['Dates'] <- dates

ts1 <- ds1$percent