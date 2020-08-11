data<- as.data.frame(precip)
names<- as.data.frame(names(precip))

data<- cbind(names,data)
data<- setNames(data, c("city","average_precipitation"))

library(dplyr)
library(ggplot2)

glimpse(data)

#### CENTRAL TENDANCIES
# we now want to compare the precipitation of west coast ith rest of the cities:

west_coast<- c("Los Angeles","Sacramento","San Francisco","Washington")

data<- data %>% mutate( west = city %in% west_coast) 

data %>% group_by(west) %>%
            summarise(mean(average_precipitation),median(average_precipitation))
#  west  `       mean(average_precipitation)`         `median(average_precipitation`
#1 FALSE                          35.6                          37
#2 TRUE                           22.7                          19

# therefore, cities on the west cost have lower av precipitation


####MEASURE OF DISPERSION

v1 <- c(-10,10,0,20,30)
mean(v1)
# [1] 10

v2 <- c(8,9,10,11,12)
mean(v2)
# [1] 10

# both have same mean but these two vectors are not similar to each other 
# v1 is more dispersed than v2


# ( 1 ) RANGE

range(v1)
# [1] -10  30

range(v2)
# [1]  8   12

# ( 2 ) VARIANCE
#         variance = sum( square(mean - element) ) / total elements

var(v1)
# [1] 250
# this happens because R uses (n-1) in the denominator

var_N = function(x){var(x)*(length(x)-1)/length(x)}
var_N(v1)
# [1] 200

# ( 3 ) STANDARD DEVIATION
#         standard deviation = sqrt( variance )
sd(v1)


# ( 4 )  INTERQUARTILE RANGE

summary(v1)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   -10       0      10      10      20      30 

#IQR = Range between 25th and 75th percntiles of a distribution

IQR(v1)
# [1] 20

quantile(v1)

### RANGE, VARIANCE AND SD ARE HIGHLY SENSITIVE TO OUTLIERS IN A DISTRIBUTION
### ON THE OTHER HAND, IQR IS NOT AND IS HENCE PREFFERED



##### SHAPES OF DISTRIBUTIONS

ggplot(data, aes(x=average_precipitation, fill = west)) + geom_density(alpha=0.4)
# both are bimodal and both are right skewed

ggplot(data, aes(x=log(average_precipitation), fill = west)) + geom_density(alpha=0.4)
# this fixed skeweness but increased modality


