dir<- getwd()
cars <- read.csv(paste0(dir,"/cars.csv"),header = TRUE, as.is = TRUE)

# we can first explore the weight column
ggplot(cars,aes(x=weight)) +geom_dotplot( dotsize = 0.5) 
ggplot(cars,aes(x=weight)) +geom_histogram() 

# we can also use a density plot
ggplot(cars,aes(x=weight)) +geom_density() 

## boxplot : middle line is median
##         : first line is 25% of the data
##         : third line is 75% of data
##         : whiskers represent the bulk of the data
##         : extreme dots represent outliers

library(dplyr)
cars_common <- cars %>% filter( ncyl %in% c(4,6,8))
ggplot(cars_common, aes(x=as.factor(ncyl), y = city_mpg)) + geom_boxplot()



## higher dimensions

ggplot(cars,aes(x=msrp)) + 
  geom_density() + facet_wrap(pickup ~ rear_wheel, labeller = label_both)
