#------------------------------------ Lab 2 -----------------------------------------
#Means and beyond--more descriptive statistics, define functions, install and use R
#packages

mean(a) #finds the arithmetic mean of 'a'

median(a) #finds the median of a list of numbers 'a'

sd(a) #finds the standard deviation of 'a'

var(a) #finds the variance of a. var = sd(a)^2

#to download a package:
install.packages("psych")

#load the package into environment/session:
library(psych)

geometric.mean(a) #uses the psych package and calculates the geometric mean of 'a'

harmonic.mean(a) #uses the psych package and calculates the harmonic mean of 'a'

cv(a) #uses the raster package and calculates the coefficient of variation. reports a percentage of the cv.

#manual function for cv:

ssd <- sd(a)
sm <- mean(a)
scv <- ssd/sm #doesn't report a % 

#or 

CV <- function(sd,mean){sd/mean}
scv <- CV(ssd,sm)

#or 

CV <- function(x){sd(x)/mean(x)}
scv <- CV(a)

#example from lab 2: create a function that calculates the A=SD/sqrt(n) and define it as B
B <- function(x){sd(x)/sqrt(length(x))}

A <- B(samples)

#------------------------------------ Lab 3 -----------------------------------------
#Confidence Interval of a Proportion

#median absolute deviation (MAD) 

mad(a, constant = 1) #finds the MAD of 'a'. If the list is small then we have to specify constant = 1.

summary(a) #gives the min, 1st quartile, median, mean, 3rd quartile, max

#interquartile_range <- 3rd Q - 1st Q from the summary(a)

#or we can use the R base function 

IQR(a) #gives the interquartile range of 'a'. There are different types so you can specific type = 1. By default R uses type = 7. 

#lab 3 example: 
n <- 565
s <- 16 

s/n #0.02831858

pprime <- (s+2)/(n+4) #gives 0.0316445

w <- 1.96 * sqrt((pprime * (1-pprime)) / (n+4)) #gives 0.01438135

lowerCL <- pprime - w #0.01725309
upperCL <- pprime + w #0.0460158

#or we can create our own functions 

lowerCL<-function(s,n){(s+2)/(n+4)-1.96*sqrt(((s+2)/(n+4)*(1-(s+2)/(n+4)))/(n+4))}
upperCL<- function(s,n){(s+2)/(n+4)+1.96*sqrt(((s+2)/(n+4)*(1-(s+2)/(n+4)))/(n+4))}

#using packages to do this faster: 

install.packages("devtools")
library(devtools)

install_github("shearer/PropCIs") #requires the devtools
library(PropCIs)

add4ci(x=16, n=565, conf.level= 0.95) #Uses the Modified Wald Method and gives the lowerCL and upperCL. 
                                      #the Modified Wald is more accurate but harder to compute

addz2ci(x=16, n=565, conf.level= 0.95) #Used the Standard Wald Method.

exactci(x=16, n=565, conf.level= 0.95) #used the Exact Method. 

#can also use this website: http://www.graphpad.com/quickcalcs/ConfInterval1.cfm

#Rule of three = when S = 0, upper limit = 3/n
#Rule of five = when S = 1, upper limit = 5/n
#Rule of seven = when S= 2, upper limit = 7/n
#for all of the above rules the lower limit = 0 

#------------------------------------ Lab 4 -----------------------------------------
#Confidence Interval of a Mean

#alpha = 1 - confidence level

#find z using R:

z = qnorm(1-alpha/2) 
#or
z = abs(qnorm(alpha/2))

#find t* using R:

t = abs(qt(alpha/2, df)) 
#or 
t = qt(1-alpha/2, df)

#margin of error:

w <- t* sd(a) / sqrt(length(a))

upperCl <- mean(a) + w
lowerCL <- mean(a) - w

#or we can make our own functions: 

w<-function(alpha,a,n){qt(1-alpha/2,n-1)*sd(a)/sqrt(n)}
# or

w<-function(alpha,a,n){abs(qt(alpha/2,n-1))*sd(a)/sqrt(n)}
# or

w<-function(alpha,samples){abs(qt(alpha/2,length(samples)- 1))*sd(samples)/sqrt(length(samples))}
alpha<-0.05
n<-length(samples)

# or
n<-sum(table(samples))

UpperLimit<-mean(samples)+w(alpha,samples,n)
LowerLimit<-mean(samples)-w(alpha,samples,n)

#the t.test also gives you the confidence interval of a mean
t.test(samples, conf.level=0.95)

#------------------------------------ Lab 5 -----------------------------------------
#Import, Select, Output Data and Data frame
setwd("C:/R") #set working directory 

a<-read.table("Mouse_DNA_methylation_small_table.txt", header = TRUE)

dim(a) #the dimension of the table: rows, colns

head(a) #gives you the header and the first six rows of the data table.

b<-data.frame(a[2,2:6],a[3,7:13]) #you are using data.frame() to select the numbers in the table “a” from column 2
                                  #to column 6 in row 2, and then combine them with the values from column 7 to column 13 in
                                  #row 3 of table a.

#------------------------------------ Lab 6 -----------------------------------------
#Processing data II: tibble and tidyverse

order(a$coln1) #gives you the numbers of coln1 in ascending order, for decending order do -a$coln1

a[order(a$coln1),] #rearrange the rows of object “a” according to the positions of coln1

library(tidyverse)

seq(1,10, length.out = 3) #a function that generates a sequence of numbers with 1 being min and 10 being max. 
                          #The argument “length.out=” tells R, how many
                          #numbers in the sequence, then by default, R will evenly distribute the numbers.

rep(NA,3) #repeats NA 3 times

(filter(c,b %in% c(2,12))) #The “b %in% c(2,12)” means in variable b when it is 2 or 12.

(filter(c,b!=12))

(filter(c,between(b,1,8)))

arrange(df, coln1) #changes the order of the rows to be ascending order

select(df,c("a","b"))

(select(d,starts_with("a")))

(select(d,ends_with("a")))

(select(d,contains("a")))

select(d,matches("c"))

#sprintf() to create row and column names using a constant string with variable
#numbers
a <- matrix(1:100,ncol=10,byrow=TRUE)
colnames(a)=c(sprintf("a%s",1:10))
rownames(a)=c(sprintf("b%s",1:10))

(A1 <- mutate(A,a11=a2+a3)) #Adding a variable/column

(transmute(A,a11=a2+a3)) #show the new variable/column only

#------------------------------------ Lab 7 -----------------------------------------
#Plotting Figures and Error Bars

boxplot(M,ylab="scores",main="5-summary of Midterm Scores",col="red") 
#what are the top cap, lower cap, the upper line of the box, the
#lower line of the box, and the middle line of the box represent, respectively?
#gives Maximum, minimum, 3rd quartile, 1st quartile, and the median.

library(ggplot2)

#example from lab 7:
(a <-ggplot(methyl_df,aes(x=Age_Months, y=Mean, fill=Mouse))+ 
    geom_bar(stat="identity", position="dodge")+
    ggtitle("DNA methylation level in GF and SPF mice at different ages")+
    xlab("Age of the mice")+ylab("Average DNA Methylation")+
    geom_errorbar(aes(ymin=Mean-SEM, ymax=Mean+SEM), width=.2 ,position=position_dodge(.9)) +
    theme_bw()+
    theme(panel.grid.major=element_blank())+
    theme(panel.grid.minor=element_blank())
  )

#------------------------------------ Lab 8 -----------------------------------------
#Comparing proportions—Fisher’s Exact Test and Chi-squared test

#We select the numbers only and deposit them into an object
c<-b[,2:3]
fisher.test(c) #use when there are only two categories

chisq.test(c)

#------------------------------------ Lab 9 -----------------------------------------
#Comparing Two Means—Paired and Unpaired t-tests and Multiple Comparison Corrections

b <- data.frame('A' = c(2, 7, 8, 9, 10), 'B' = c(3,9,6,17,19))

t.test(b$A,b$B,paired=TRUE,var.equal=TRUE) 

t.test(b$A,b$B,paired=FALSE,var.equal=TRUE) 

t.test(Hos1,Hos2,paired=FALSE, var.equal=FALSE) #The Welch Two Sample t-test. if you think the standard deviations are v different

PA<-p.adjust(df$coln,method="bonferroni",n=30)

PFDR<-p.adjust(df$coln,method="fdr",n=30)


#------------------------------------ Lab 10 -----------------------------------------
#Comparing Multiple Means—One-way and two-way ANOVA tests

#one way:
All <- data.frame("BlackMouse" = c(3,  7,  9,  9,  8,  9, 13, 14, 15), 
                'diets'= c("DietA", "DietA", "DietA", "DietB", "DietB", "DietB", "DietC", "DietC", "DietC"))

MD <-aov(BlackMouse~diets, data=All) 

summary(MD) #gives p-value

#two way:
aov2<-aov(GeneExpression~TimeLength*Treatments,data=DACVCTime)

#------------------------------------ Lab 11 -----------------------------------------
#After ANOVA—post hoc analyses
library(multcomp)
library(ggplot2)

d<-glht(c,linfct=mcp(Treatments="Dunnett")) #where c is the ANOVA test

#glht() stands for “general linear hypothesis test”
#The “linfct” is a specification of the linear hypotheses to be tested. Here we tell R the
#specific linear hypothesis we are going to test is the “Dunnett” test of multiple comparisons
#(“mcp()”).

confint(d) #find confidence intervals 

summary(d) #gives p-value 

e<-glht(c,linfct=mcp(Treatments="Tukey"))

# or 

f<-TukeyHSD(c,ordered=T) #base R function









