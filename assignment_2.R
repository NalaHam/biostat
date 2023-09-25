#A clinical trial testing a drug for its anti-cancer effect enrolled 663 patients, 
#including 321 patients who were given placebos, and the rest were on the experimental arm. 
#After the treatments, there were 2 patients, who were taken placebos, were reported with undetected lymph nodes metastasis. 
#While for the patients, who were given the drug, sixty-five had undetected lymph nodes metastasis.

#notes: p' = (S + 0.5 (z)^2) / (n + z^2) and margin of error is W = z * sqrt((p'*(1-p'))/(n+z^2))

In this example:
#the experimental group is n = 342, S = 65. 
#the control group n = 321, S = 2. 
#when CI = 95%, then z = 1.96

install.packages("devtools")
library(devtools)
install_github("shearer/PropCIs")
library(PropCIs)

#1)By typing R command lines, using the modified Wald method, calculate the CI of proportion at 95% confidence 
#level for both the placebo-treated group and the drug-treated group. (3pts)

#experimental group
n<-342 
s<-65
z<- 1.96

pprime<-(s+z)/(n+z^2)
pprime #result:

w<-z*sqrt((pprime*(1-pprime))/(n+z^2)) 
w #result:

lowerCL<-pprime-w 
lowerCL #result:
upperCL<-pprime+w
upperCL #result:

print("the CI of experimental is " [lowerCL,upperCL]) #result:

#control group
n<-321
s<-2
z<- 1.96

pprime<-(s+z)/(n+z^2)
pprime #result:

w<-z*sqrt((pprime*(1-pprime))/(n+z^2)) 
w #result:

lowerCL<-pprime-w 
lowerCL #result:
upperCL<-pprime+w
upperCL #result:

print("the CI of control is " [lowerCL,upperCL]) #result:

#2)Use the R package (PropCIs) to find the CIs (exact CI, Wald method, and modified Wald method) of 
#proportion for both groups. Copy & paste your command lines and results. (3pts)
#x = number of successes

#experimental group
exactci(x=65 ,n=342, conf.level=0.95) #exactci uses the Exact method
#result:

addz2ci(x=65 ,n=342, conf.level = 0.95) #addz2ci uses the Standard Wald method
#result:

add4ci(x=65 ,n=342, conf.level = 0.95) #add4ci uses the Modified Wald method
#result:

#control group
exactci(x=2 ,n=321, conf.level=0.95) #exactci uses the Exact method
#result:

addz2ci(x=2 ,n=321, conf.level = 0.95) #addz2ci uses the Standard Wald method
#result:

add4ci(x=2 ,n=321, conf.level = 0.95) #add4ci uses the Modified Wald method
#result:


#3)For which group, can you take a shortcut and estimate the result by using either Rule of Three, 
#Rule of Five, or Rule of Seven? (1pt) Which rule would apply? (1pt) What is the result of using this rule? 
#Show your calculations. (1pt) Is it the same as what you got from using R? (1pt)

#We can take a shortcut and use one of the rules for the the control group, since the number of successes is equal to 2. We can use the rule of seven. 
#rule of 7: S=2, then CI = [0, 7/n]

n<- 321
lowerCL<- 0
upperCL<- 7/n
upperCL #result:

print("the CI of control is " [lowerCL,upperCL]) #result:

