berkeley <- read.csv("data/berkeley.csv", header = TRUE)
statistics <- read.csv("data/statistics.csv", header = TRUE)
tsdisplay(diff(diff(berkeley$berkeley, 52)))
tsdisplay(diff(diff(statistics$statistics, 52)))
