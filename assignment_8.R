#assignment 8 associated with lab 10

#You are studying the relationships between diets and body weight, as well as sex. You fed
#both male and female mice with 4 different diets for 2 months. These mice had the same genetic
#background, at the same age, and were housed in the same room, had the same body weight
#before the study. You measured their body weight after 2 months, recorded the data (in gram) in
#the file “MiceBodyWeight.csv”.

#If you want to find out whether gender and diets have an effect on the body weight, and at
#this stage of the study you might not be interested in whether sex interacts with diet:

#1) What kind of statistical test would you perform? (1pt)
#two-way ANOVA test. compare means for each diet and for each sex

#2) What are your null hypothesis/hypotheses? (1pt)
#The means of weight for males and females are equal for every diet type.

#3) Show your R commands and the results (7pts)
#diet A males and females
DietA_m <- MiceBodyWeight[1:3,1:2]
DietA_m$diet <- "DietA"
names(DietA_m)[c(1,2)] <- c("sex","weight")

DietA_f <- MiceBodyWeight[4:6,1:2]
DietA_f$diet <- "DietA"
names(DietA_f)[c(1,2)] <- c("sex","weight")


#diet B males and females
DietB_m <- MiceBodyWeight[1:3,c(1,3)]
DietB_m$diet <- "DietB"
names(DietB_m)[c(1,2)] <- c("sex","weight")

DietB_f <- MiceBodyWeight[4:6,c(1,3)]
DietB_f$diet <- "DietB"
names(DietB_f)[c(1,2)] <- c("sex","weight")


#diet C males and females
DietC_m <- MiceBodyWeight[1:3,c(1,4)]
DietC_m$diet <- "DietC"
names(DietC_m)[c(1,2)] <- c("sex","weight")

DietC_f <- MiceBodyWeight[4:6,c(1,4)]
DietC_f$diet <- "DietC"
names(DietC_f)[c(1,2)] <- c("sex","weight")


#diet D males and females
DietD_m <- MiceBodyWeight[1:3,c(1,5)]
DietD_m$diet <- "DietD"
names(DietD_m)[c(1,2)] <- c("sex","weight")

DietD_f <- MiceBodyWeight[4:6,c(1,5)]
DietD_f$diet <- "DietD"
names(DietD_f)[c(1,2)] <- c("sex","weight")


#combine the above data frames
weight_df <- rbind(DietA_m, DietA_f, DietB_m, DietB_f, DietC_m, DietC_f, 
                   DietD_m, DietD_f)

weight <- weight_df$weight

diet <- weight_df$diet

sex <- weight_df$sex

aov2 <- aov(weight~sex*diet, data = weight_df)

aov2

summary(aov2)

#4) What are your conclusions? (1pt)
#All factors are significantly different. 



