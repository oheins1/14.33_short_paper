
install.packages("vtable")
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

#########   PART 1 : Analysis of data and mean/count calculations
#initializes dataset 
data1 = ex
data1

#create a table of the number of exonerates by sex, male or female
data.frame ( table ( data$sex) )

#create a table of the number of exonerates by race
data.frame ( table ( data$race) )


#finds the mean of the years in prsion, which is computed as year exonerated - year convicted
mean(data$`Years in prison`)


#finds mean of years in prison by race
aggregate(x = data$`Years in prison`,                
          by = list(data$race),              
          FUN = mean)  

#finds mean of years in prison by the worst crime committed
aggregate(x = data$`Years in prison`,                
          by = list(data$worstcrime),              
          FUN = mean)  

#finds mean of years in prison by a simpliefied worst crime committed
aggregate(x=data$`Years in prison`,
          by=list(data$race,data$simpleworstcrime),
          FUN=mean)

#finds mean of years in prison  for Treatment group and Control group
aggregate(x = data$`Years in prison`,                
          by = list(data$Treatment),              
          FUN = mean)  

#finds mean of years in prison  for Treatment group and Control group by race
aggregate(x = data$`Years in prison`,                
          by = list(data$Treatment, data$race),              
          FUN = mean)  



#counts the number of each type of crime in the dataset
ows.per.group  <- aggregate(rep(1, length(data$worstcrime)),
                            by=list(data$worstcrime), sum)
ows.per.group

##counts the number of each type of crime in the dataset by race
data.frame ( table ( data$race, data$simpleworstcrime ) )



#########   PART 2 : Linear Regresson Model

#one-hot encoding for the race, so we can use categorical data in the regression
data$race = as.factor(data$race)

x3 <- factor(round(runif(100,1,6)),labels=c("White", "Black", "Asian", "Hispanic", "Native American", "Other"))

#creates linear regession predicting years in prison by race and the rank of the crime commited
lin_model <- lm(`Years in prison`~ race  + number, data=data1)
summary(lin_model)

#########   PART 3 : Analyis of Effect of policy, t-test

#t test for black people to test effet of DNA-testing law
#split data in 2 groups, Control and Treatment 
treat_black<- subset(data, Treatment == "YES"&  race=="Black")
con_black <- subset(data, Treatment == "NO"&  race=="Black")
#test variability to see if the control and treated group share the same variation. If P-value 
#is < .05, run Welch 2-sided t test where var.equal = FALSE
var.test(treat_black$'Years in prison',con_black$'Years in prison' )
t_black <- t.test(con_black$'Years in prison', treat_black$'Years in prison', var.equal = FALSE)
t_black

#t test for white people to test effet of DNA-testing law
#split data in 2 groups, Control and Treatment 
treat_white<- subset(data, Treatment == "YES"&  race=="White")
con_white <- subset(data, Treatment == "NO"&  race=="White")
#test variability to see if the control and treated group share the same variation. If P-value 
#is < .05, run Welch 2-sided t test where var.equal = FALSE
var.test(treat_white$'Years in prison',con_white$'Years in prison' )
t_white <- t.test(con_white$'Years in prison', treat_white$'Years in prison', var.equal = FALSE)
t_white

#t test for Hispanic people to test effet of DNA-testing law
#split data in 2 groups, Control and Treatment 
treat_hisp<- subset(data, Treatment == "YES"&  race=="Hispanic")
con_hisp <- subset(data, Treatment == "NO"&  race=="Hispanic")
#test variability to see if the control and treated group share the same variation. If P-value 
#is < .05, run Welch 2-sided t test where var.equal = FALSE
var.test(treat_hisp$'Years in prison',con_hisp$'Years in prison' )
t_hisp <- t.test(con_hisp$'Years in prison', treat_hisp$'Years in prison', var.equal = FALSE)
t_hisp

#t test for Asian people to test effet of DNA-testing law
#split data in 2 groups, Control and Treatment 
treat_as<- subset(data, Treatment == "YES"&  race=="Asian")
con_as <- subset(data, Treatment == "NO"&  race=="Asian")
#test variability to see if the control and treated group share the same variation. If P-value 
#is < .05, run Welch 2-sided t test where var.equal = FALSE
var.test(treat_as$'Years in prison',con_as$'Years in prison' )
t_hisp <- t.test(con_as$'Years in prison', treat_as$'Years in prison', var.equal = FALSE)
t_hisp

#t test for Native Americans to test effet of DNA-testing law
#split data in 2 groups, Control and Treatment 
treat_na<- subset(data, Treatment == "YES"&  race=="Native American")
con_na <- subset(data, Treatment == "NO"&  race=="Native American")
#test variability to see if the control and treated group share the same variation. If P-value 
#is < .05, run Welch 2-sided t test where var.equal = FALSE
var.test(treat_na$'Years in prison',con_na$'Years in prison' )
t_na <- t.test(con_na$'Years in prison', treat_na$'Years in prison', var.equal = FALSE)
t_na



#########   PART 4 : Graphing
#load dataset
avg_time <- exon_avg


  
races = c("Black","White","#Asian","Native American",
             "Asian","Hispanic")
#Beside bar-plot of avg Years in Prison by race and crime type
#I used the excel graph in my paper because it was more aestically pleasing
barplot(table(avg_time$Race, avg_time$Murder), beside= TRUE, 
        legend = levels(avg_time$Race))







