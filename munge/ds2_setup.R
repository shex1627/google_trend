######################
# Setting Up Dataset 2
######################
ds2 <- read.csv("data/2DS.csv", header = FALSE)
dates <- seq(as.Date("2011/11/06"), as.Date("2015/11/06"), by = "week")
colnames(ds2) <- "percent"
ds2['Dates'] <- dates
ts2 <- ds2$percent

ds2_full <- read.csv("data/dna.csv")