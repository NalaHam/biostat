library(psych)
library(raster)

samples <- c(32.88,40.63,34.43,39.97,36.9,34.71,57.74,57.42,61.3,56.47,57.87,59.39)

#result:  [1] 32.88 40.63 34.43 39.97 36.90 34.71 57.74 57.42 61.30 56.47 57.87 59.39

mean(samples) #result: 47.47583

median(samples) #result: 48.55

sd(samples) #result: 11.62864

geometric.mean(samples) #result: 46.13101

harmonic.mean(samples) #result: 44.79721

cv(samples) #result: 24.49381

B <- function(x){sd(x)/sqrt(length(x))}

B(samples) #result: 3.356899
