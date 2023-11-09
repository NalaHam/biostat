#assignment 3 associated with lab 4

#Use the data from the file “Lab1_Mouse_DNA_methylation_small_table.txt”. At 92%
#confidence level, compute the confidence interval of the mean of the DNA methylation of gene
#Sh2b3 of all the 12 mice.


#1) Do the calculations step-by-step in R. (4pts)
#Find SD:
a<-mean(samples)
b<-samples-a
c<-b^2
d<-sum(c)
n<-12
e<-d/(n-1)
f<-sqrt(e)

#or us built in R function
f1<-sd(samples)

#margin of error:
w<-t*f/sqrt(n) #find t first
upperCL<-a+w
lowerCL<-a-w


#2) Define your own function to compute the margin of error and then the CI of the mean.
(4pts)
w<-function(alpha,a,n){qt(1-alpha/2,n-1)*sd(a)/sqrt(n)}
UpperLimit<-mean(samples)+w(alpha,samples,n)
LowerLimit<-mean(samples)-w(alpha,samples,n)



#3) Use the built-in R function to calculate the CI of the mean. (2pts)
t.test(samples, conf.level=0.95)










