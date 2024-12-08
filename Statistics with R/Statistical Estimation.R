setwd("E:/Set Sail For Scientific Research/Academic World/My Projects/Toolkit For Scientific Research/Statistics with R")


# Point Estimation of an Expectation
data <- c(2781,2836,2807,2763,2858)
expected_value <- mean(data)
expected_value

# Confidence Interval with a given confidence level
# With the assumption of normal distribution
result=t.test(data,conf.level = 0.95)
result

# Plotting t-distribution
x <- seq(-4, 4, length = 500)  # Range for x-axis
df_list <- c(1, 5, 10, 30)    # Degrees of freedom to plot

plot(x, dt(x, df = df_list[1]), type = "l", lwd = 2, col = "blue",
     ylab = "Density", xlab = "t", main = "t-Distribution for Different Degrees of Freedom")

for (df in df_list[-1]) {
  lines(x, dt(x, df = df), lwd = 2, col = sample(colors(), 1))
}

legend("topright", legend = paste("df =", df_list), col = 1:length(df_list), lwd = 2)





#Point Estimation of a Variance
sample_variance <- var(data)
sample_variance

# Confidence Interval with a given confidence level
# With the assumption of normal distribution
library(EnvStats)
result <- varTest(data, conf.level = 0.95)
result

# Plotting Chi-square Distribution
library(ggplot2)
x <- seq(0, 20, length = 500)
df_list <- c(2, 5, 10, 20)
data_chi <- data.frame(
  x = rep(x, times = length(df_list)),
  Density = unlist(lapply(df_list, function(df) dchisq(x, df))),
  df = rep(df_list, each = length(x))
)

ggplot(data_chi, aes(x, Density, color = as.factor(df))) +
  geom_line(size = 1.2) +
  labs(title = "Chi-Square Distribution for Different Degrees of Freedom",
       x = "Chi-Square", y = "Density", color = "Degrees of Freedom") +
  theme_minimal()





