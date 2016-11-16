#######################
# Utilities
#######################
mse <- function(v1, v2) {
  # Computes the mse of two vectors with the same length
  #
  # Args:
  #   v1: a vector
  #   v2: a vector with same length as v1
  #   
  # Returns:
  #   the Mean Square Error of two vectors
  return (mean((v1 - v2)^2))
}

pred_plot <- function(pred, future) {
  # graphs the future value and forecasted value
  # 
  # Args:
  #   pred: vector, predicted values
  #   future: vector, future values
  #   
  # Returns:
  #   None but graphs
  plot(future, type = "l")
  par(new=TRUE)
  lines(pred, col = "red")
}

mod_mse <- function(train, test, norder, sorder, plot = FALSE) {
  # compute the mse of an arima model based on train data, test data and model
  # 
  # Args:
  #   train: vector, training set
  #   test: vector, test set
  #   norder: arima non seasonal order
  #   sorder: arima seasonal order
  #   plot: boolean, whether to plot test values and predicted values on the same graph
  #
  # Returns:
  #   the mse of predicted values and the test set values
  mod <- arima(train, order = norder, seasonal = list(order = sorder, period = 52))
  pred <- predict(mod, n.ahead = 52)$pred
  if (plot) {
    pred_plot(pred[1:52], test)
  }
  return (c(mse(pred, test), mod$aic))
}

