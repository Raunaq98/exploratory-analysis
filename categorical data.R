directory<- getwd()

path <- paste0(directory,"/comics.csv")
comics<- read.csv(path,header = TRUE, as.is = TRUE)

library(tibble)
comics<- tibble(comics)

comics$name <- as.factor(comics$name)
comics$id <- as.factor(comics$id)
comics$align <- as.factor(comics$align)
comics$eye <- as.factor(comics$eye)
comics$hair <- as.factor(comics$hair)
comics$gender <- as.factor(comics$gender)
comics$gsm <- as.factor(comics$gsm)
comics$alive <- as.factor(comics$alive)
comics$fist_appear <- as.factor(comics$first_appear)
comics$publisher <- as.factor(comics$publisher)
## did this to get the comics DF in the form that was used in the example

## in order to explore this data, we can move along the lines of their identity and their public appearance
## best way to do this is to make a table and then plot it

table(comics$id,comics$align)
#            Bad Good Neutral Reformed Criminals
#  No Dual  474  647     390                  0
#  Public  2172 2930     965                  1
#  Secret  4493 2475     959                  1
#  Unknown    7    0       2                  0

library(dplyr)
library(ggplot2)

## for categorical data, use a stacked bar chart ( barplot with a fill)
ggplot(comics, aes(x = id , fill = align)) +geom_bar()

## we can also use a side by side bar plot
ggplot(comics, aes(x = id , fill = align)) +geom_bar(position="dodge")


## another way to look at this table is to use proportions
tb <- table(comics$id,comics$align)
prop.table(tb)
#              Bad         Good       Neutral      Reformed Criminals
#No Dual 0.0305491106 0.0416988915 0.0251353442       0.0000000000
#Public  0.1399845321 0.1888373292 0.0621938644       0.0000644496
#Secret  0.2895720547 0.1595127610 0.0618071668       0.0000644496
#Unknown 0.0004511472 0.0000000000 0.0001288992       0.0000000000

## to look at proportions graphically:
ggplot(comics,aes(x=id,fill=align)) +
  geom_bar(position ="fill") +
  ylab("Proportions")

## if we want proportions based on the rows, we use
prop.table(tb,1)
#              Bad         Good       Neutral     Reformed Criminals
#No Dual 0.3136995367 0.4281932495 0.2581072138       0.0000000000   = 1
#Public  0.3579433092 0.4828609097 0.1590309822       0.0001647989   = 1
#Secret  0.5667255298 0.3121846620 0.1209636731       0.0001261352   = 1 
#Unknown 0.7777777778 0.0000000000 0.2222222222       0.0000000000   = 1

## based on columns
prop.table(tb,2)
#             Bad         Good        Neutral     Reformed Criminals
#No Dual 0.0663308144 0.1069068077 0.1683937824       0.0000000000
#Public  0.3039462636 0.4841374752 0.4166666667       0.5000000000
#Secret  0.6287433529 0.4089557171 0.4140759931       0.5000000000
#Unknown 0.0009795690 0.0000000000 0.0008635579       0.0000000000
#           = 1           = 1           = 1               = 1



##### DISTRIBUTION OF ONE VARIABLE

table(comics$id)
# No Dual  Public  Secret Unknown 
#  1788    6994    8698       9 

ggplot(comics,aes(x=id)) + geom_bar()

# we can add faceting to this single variable
ggplot(comics,aes(x=id)) + geom_bar() +facet_wrap(~align)



