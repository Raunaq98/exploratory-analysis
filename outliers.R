glimpse(data)

quantile(data$average_precipitation)
# 0%    25%    50%    75%   100% 
# 7.000 29.375 36.600 42.775 67.000 

ggplot(data,aes(x= average_precipitation,fill=west)) + geom_density(alpha= 0.4) + 
  labs(title="distribution of av precipitation based on west and non-west coast with outliers")

ggplot(data,aes(x= average_precipitation)) + geom_boxplot() + 
  labs(title="distribution of av precipitation based on west and non-west coast with outliers(boxplot)")


# outliers ---> 15> avg preci && 60< avg preci

data<- data %>% mutate( outlier = average_precipitation > 60 ) %>% 
  mutate( outlier = average_precipitation < 15)

data_clean <- data %>% filter( outlier == FALSE)
ggplot(data_clean,aes(x= average_precipitation,fill=west)) + geom_density(alpha= 0.4) + 
  labs(title="distribution of av precipitation based on west and non-west coast without outliers")

ggplot(data_clean,aes(x= average_precipitation)) + geom_boxplot() + 
  labs(title="distribution of av precipitation based on west and non-west coast without outliers(boxplot)")
