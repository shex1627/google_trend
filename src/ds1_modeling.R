##################
## making an arima model using auto.arima
mod_ts1_auto <- auto.arima(ts1, stepwise = FALSE, approximation = FALSE)
pred_ts1_auto <- forecast(mod_ts1_auto, 52)
plot(forecast(mod_ts1_auto, h = 52))
#no!!! autorima is giving me crap
plot(mod_ts1_auto$fitted)
lines(ts1, col = "red")

mod_ts1_auto
mod_ts1_auto$arma

####################
# doing crazy stuff with the lecture R codes
# I mean generating multiple arima model

#index for third year's data 107, forth 158
yr4_index <- 158:209
yr123_index <- 1:157
mod_mse(ts1[yr123_index], ts1[yr4_index], c(0, 1, 1), c(0, 1, 1), TRUE)
#14.00751
mse(ts1[106:157], ts1[yr4_index])
#21.40385
mod_mse(ts1[yr123_index], ts1[yr4_index], c(1, 1, 0), c(1, 1, 0), TRUE)
#19.02005
mod_mse(ts1[yr123_index], ts1[yr4_index], c(1, 1, 1), c(1, 1, 1), TRUE)
#16.14703

# Profiling the models 
library(profvis)
profvis(
  expr = {
    mod_mse(ts1[yr123_index], ts1[yr4_index], c(0, 1, 1), c(0, 1, 1))
    mse(ts1[106:157], ts1[yr4_index])
    mod_mse(ts1[yr123_index], ts1[yr4_index], c(1, 1, 0), c(1, 1, 0))
    mod_mse(ts1[yr123_index], ts1[yr4_index], c(1, 1, 1), c(1, 1, 1))
  }
)
####################
# Deciding the generic arima(0, 1, 1), (0, 1, 1)52 model because of good speed and accuracy
mod_ts1 <- arima(ts1, order = c(0, 1, 1), seasonal = list(order = c(0,1,1), period = 52))
pred_ts1 <- predict(mod_ts1, n.ahead = 52)
write.csv(pred_ts1$pred[1:52], "Q1_shicheng_huang_25364767.txt", row.names = FALSE, col.names = FALSE)
