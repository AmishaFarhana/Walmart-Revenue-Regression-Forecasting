
## USE FORECAST LIBRARY.

install.packages("forecast")
library(forecast)
library(zoo)


## CREATE DATA FRAME. 

# Set working directory for locating files.
setwd("/Users/amishafarhanashaik/Desktop/MSBA/BAN673TimeSeries /Case Studies")

# Create data frame.
data <- read.csv("673_case2.csv")

#QUESTION 1A

walmart.ts <- ts(data$Revenue, 
              start = c(2005, 1), end = c(2024, 4), freq = 4)
walmart.ts

#QUESTION 1B
# Plot the time series data. 
plot(walmart.ts, 
     xlab = "Time", ylab = "Walmart Revenue ($ Million)", ylim = c(60000, 200000), bty = "l",
     xaxt = "n", xlim = c(2005, 2026.25), main = "Walmart Quarterly Revenue Data", lwd = 3, col="blue") 
axis(1, at = seq(2005, 2026, 1), labels = format(seq(2005, 2026, 1)))

#QUESTION 2A

nValid <- 16 
nTrain <- length(walmart.ts) - nValid
train.ts <- window(walmart.ts, start = c(2005, 4), end = c(2005, nTrain))
valid.ts <- window(walmart.ts, start = c(2005, nTrain + 1), 
                   end = c(2005, nTrain + nValid))

#QUESTION 2B

#Regression model with linear trend

train.lin <- tslm(train.ts ~ trend)
summary(train.lin)

train.lin.pred <- forecast(train.lin, h = nValid, level = 0)
train.lin.pred

#Regression mode with quadratic trend

train.quad <- tslm(train.ts ~ trend + I(trend^2))
summary(train.quad)

train.quad.pred <- forecast(train.quad, h = nValid, level = 0)
train.quad.pred

#Regression model with seasonality

train.season <- tslm(train.ts ~ season)
summary(train.season)

train.season.pred <- forecast(train.season, h = nValid, level = 0)
train.season.pred

#Regression model with linear trend and seasonality
train.lin.season <- tslm(train.ts ~ trend + season)
summary(train.lin.season)

train.lin.season.pred <- forecast(train.lin.season, h = nValid, level = 0)
train.lin.season.pred

#Regression model with quadratic trend and seasonality.

train.quad.season <- tslm(train.ts ~ trend + I(trend^2) + season)
summary(train.quad.season)

train.quad.season.pred <- forecast(train.quad.season, h = nValid, level = 0)
train.quad.season.pred

#QUESTION 2C

round(accuracy(train.lin.pred$mean, valid.ts),3)
round(accuracy(train.quad.pred$mean, valid.ts),3)
round(accuracy(train.season.pred$mean, valid.ts),3)
round(accuracy(train.lin.season.pred$mean, valid.ts),3)
round(accuracy(train.quad.season.pred$mean, valid.ts),3)

#QUESTION 3A

#CHOICE1
#Regression model with linear trend and seasonality
full.lin.season <- tslm(walmart.ts ~ trend + season)
summary(full.lin.season)

full.lin.season.pred <- forecast(full.lin.season, h = 8, level = 0)
full.lin.season.pred

#CHOICE2
#Regression model with linear trend

full.lin <- tslm(walmart.ts ~ trend)
summary(full.lin)

full.lin.pred <- forecast(full.lin, h = 8, level = 0)
full.lin.pred

#CHOICE3
#Regression model with quadratic trend and seasonality.

full.quad.season <- tslm(walmart.ts ~ trend + I(trend^2) + season)
summary(full.quad.season)

full.quad.season.pred <- forecast(full.quad.season, h = 8, level = 0)
full.quad.season.pred

#QUESTION 3B

round(accuracy(full.lin.season.pred$fitted, walmart.ts),3)
round(accuracy(full.lin.pred$fitted, walmart.ts),3)
round(accuracy(full.quad.season.pred$fitted, walmart.ts),3)

round(accuracy((naive(walmart.ts))$fitted, walmart.ts), 3)
round(accuracy((snaive(walmart.ts))$fitted, walmart.ts), 3)















