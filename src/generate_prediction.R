#############################################################################################
# deciding the generic arima(0, 1, 1), (0, 1, 1)52 model because of good speed and accuracy
#############################################################################################
## setup
setwd("/home/shicheng/github/google_trend")
source("munge/ds1_setup.R")
source("munge/ds2_setup.R")

## ds1
mod_ts1 <- arima(ts1, order = c(0, 1, 1), seasonal = list(order = c(0,1,1), period = 52))
pred_ts1 <- predict(mod_ts1, n.ahead = 52)
write.table(pred_ts1$pred[1:52], "q1_shicheng_huang_25364767.txt", row.names = FALSE, col.names = FALSE)

## ds2
mod_ts2 <- arima(ts2, order = c(0, 1, 1), seasonal = list(order = c(0,1,1), period = 52))
pred_ts2 <- predict(mod_ts2, n.ahead = 52)
write.table(pred_ts2$pred[1:52], "q2_shicheng_huang_25364767.txt", row.names = FALSE, col.names = FALSE)

