#assignment 7 associated with lab 9

#1. Use R to solve the same problem from Midterm II:
#You are interested in whether or not Germ-free mice have the same lifespan as the SPF mice.
#You randomly picked 10 Germ-free mice and 10 SPF mice. You recorded how long these mice
#lived and tabulate the data in file “MouseLifeSpan.csv”.

#What kind of statistical test would you like to perform? (0.5pt)
#Because the mice are independent, we should use the unpaired t-test to compare
#their mean life spans

#What is your null hypothesis? (0.5pt)
#The mean of the life span for the Germ-free mice and SPF mice are the same.
#Mgf - Mspf = 0

#Set your alpha.
#0.05

#Find the p-value, if you decide to do a statistical test to compute a p-value. Show your R
#commands and results. (3.5pts)

#first test the variances of each mouse type (find if sd are ~equal)
sd(MouseLifeSpan$Germ.free.Mice..months.) #Result: 4.954235
sd(MouseLifeSpan$SPF.Mice..months.) #Result: 3.541814

#I think the sds are pretty similar
#unpaired t-test with var.equal = TRUE:
t.test(MouseLifeSpan$Germ.free.Mice..months., MouseLifeSpan$SPF.Mice..months.,
       paired = FALSE, var.equal = TRUE)

#Results: t=3.0117, df=18, p-value = 0.007493

#It's possible the sds are not very similar (maybe 1.4 is significantly different?)
#If so, we can use the Welch's t-test

t.test(MouseLifeSpan$Germ.free.Mice..months., MouseLifeSpan$SPF.Mice..months.,
       paired = FALSE, var.equal = FALSE)

#Results: t=3.0117, df= 16.294, p-value = 0.008146

#What is your conclusion? (0.5pt)
#In both cases we get a p-value < 0.05, which means that the average life spans 
#of each mouse type are significantly different. In both t-tests the Germ free
#mice had significantly longer life spans compared to the SPF mice. I believe that this
#is correct and the mean life spans are not equal. 

#2. Multiple comparison corrections
#2.1) Use FDR correction to adjust the P values in file
#“MouseMultipleComparisonsPCorrectionsAssignment.csv”. Show your R commands.(1.5pts)

MCC <- MouseMultipleComparisonsPCorrectionsAssignment

PS <- MCC[,16] #select the p-values column

PFDR <- p.adjust(PS, method = "fdr", n=11)

#2.2) Add a new column of to the table to list the adjusted P values. Show your R commands.
#(1pt)

MCC$FDR_P <- PFDR #does both 2.2 and 2.3

#2.3) Change the column name for the FDR corrected P values to “FDR_P” Show your R
#commands. (1pt)


#2.4) Write a CSV file to save your result. Name the CSV file as
#“MultipleComparisonCorrectionFDRAssignment”. Show your R commands. (1.5pts)

write.csv(MCC, "MultipleComparisonCorrectionFDRAssignment.csv")

