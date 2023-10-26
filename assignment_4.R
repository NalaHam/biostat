#assignment for lab 6
#Do NOT use the function “rank()” or “order()” from base R,

#1) rank the scores in “MidtermGradeSheet.csv” by using a function from package “tidyverse”
#and make sure who got the highest score would receive rank “1” (5pts)

library(tidyverse)

grades <- read.csv("MidtermGradeSheet.csv")

grades <- (arrange(grades,-Midterm)) #order's grades by descending Midterm numbers

grade_rank <- c(1:length(grades[,1])) #just gives a number or rank for each student

#2) and then add a new column to the original table with the name “new_rank” showing the
#ranks (3pts).

grades <- data.frame(grades,grade_rank) #combines the grades and the student's ranks

#3) Save it as a csv file with the name as “ranked_midterm_scores_again” (1.5pt). Tell me where
#it was saved to (in which folder I can find it). (0.5pt)

write.csv(grades,"ranked_midterm_scores_again.csv",row.names=FALSE) 
#the file is saved to the working directory, which in my case is /Users/nalahamilton/Desktop/Fall_2023/biostat

