#assignment 6 for lab 8

#1. Generate a data frame and name it as “AB”. This “AB” includes the data of reduced
#tumor size and increased tumor size for the two tested drugs only. Write R codes to
#rename the column names as “Reduced Tumor Size” and “Increased Tumor Size”. Show
#your R commands and the result. (2pts)

AB <- DrugScreening1[c(2:3), c("Tumor_Size_Reduced", "Tumor_Size_Increased")]

names(AB) <- c("Reduced Tumor Size", "Increased Tumor Size")

print(AB)

#2. For tumors having reduced size, and for the tumors remaining the same size, compare
#Drug1 with the placebo. Compute a P value, to see if Drug1 is better than the placebo,
#which means if the ratio of the number of tumors having reduced size to the number of
#tumors remaining the same size is smaller for Drug1 than for the placebo. What’s your
#H0? State your own alpha. Which test should you use? Show your R commands and the
#result. (4pts)

#H0: the ratio of the drug ratio and the placebo ratio is = 1 (Odds ratio = 1)
#alpha = 0.05
#use fisher's exact test when there are only two comparisons

drug1_n_plb <- DrugScreening1[c(1:2), c(1:3)] #gives the rows placebo and drug1 and 
                                         #the columns Treatment, Tumor_Size_Reduced, Same_Tumor_Size
c <- drug1_n_plb[,2:3]

fisher.test(c)

#gives p-value = 0.4999 
#this is not a significant p-value and we fail to reject the H0
#We can not say that Drug1 is better or worse than the placebo.


#3. For tumors having reduced size and for the tumors increased size, compare Drug2 with
#Drug1. Is Drug1 better than Drug2? In other word, if the ratio of the number of tumors
#having reduced size to the number of tumors increased size is smaller for Drug1 than for
#Drug2? Show your R commands and your conclusions. (2pts)

#H0: the ratio of the drug1 ratio and the drug2 ratio is = 1 (Odds ratio = 1)
#alpha = 0.05
#use fisher's exact test when there are only two comparisons

drugs <- DrugScreening1[c(2:3), c(1,2,4)] #gives the rows drug1 and drug2 and 
                                          #the columns Treatment, Tumor_Size_Reduced, Tumor_Size_Increased
c <- drugs[,2:3]

fisher.test(c)

#gives p-value = 0.3835 
#this is not a significant p-value and we fail to reject the H0
#We can not say that Drug1 is better or worse than Drug2.


#4. Compare Drug 1 with the placebo for tumors having reduced size and tumors having
#increased size. Is Drug 1 better than the placebo? Show your R commands and your
#conclusions. (2pts)

#H0: the ratio of the drug1 ratio and the placebo ratio is = 1 (Odds ratio = 1)
#alpha = 0.05
#use fisher's exact test when there are only two comparisons

drug1_n_plb_2 <- DrugScreening1[c(1:2), c(1,2,4)] #gives the rows placebo and drug1 and 
                                          #the columns Treatment, Tumor_Size_Reduced, Tumor_Size_Increased
c <- drug1_n_plb_2[,2:3]

fisher.test(c)

#gives p-value = 5.646e-14 
#this is a significant p-value and we can reject the H0
#assuming that 


