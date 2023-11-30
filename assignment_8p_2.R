#assignment 8 part 2 associated with lab 10

#Previously, to answer the question that whether or not the expression level of a gene of
#interest in a colon cancer cell line was different resulted from 3 different treatments, we
#performed a one-way ANOVA test to compare the 3 means of the delta CT of the gene of
#interest.
#From our one-way ANOVA test, we know the P-value is less than 0.05, and the difference
#between the means is statistically significant. However, from the ANOVA test, we do not know
#which two means are different from each other.


#Assume you have designed a post hoc test in your experiment design. Please perform this
#post hoc test to find out which means are different from the others.

#1) Which post hoc test would you perform? (1pt)
#Dunnett's test

#2) Show your R commands and results. (3pts)

#DAC_VC1
DAC_VC1_df <- data.frame(DAC_VC$DAC_VC1)
DAC_VC1_df$Treatment <- "DAC_VC1"
names(DAC_VC1_df)[1] <- "GeneExpression"

#DAC_VC1
DAC_VC2_df <- data.frame(DAC_VC$DAC_VC2)
DAC_VC2_df$Treatment <- "DAC_VC2"
names(DAC_VC2_df)[1] <- "GeneExpression"

#DAC_VC1
DAC_VC3_df <- data.frame(DAC_VC$DAC_VC3)
DAC_VC3_df$Treatment <- "DAC_VC3"
names(DAC_VC3_df)[1] <- "GeneExpression"

#combine above data frames
expression_df <- rbind(DAC_VC1_df,DAC_VC2_df,DAC_VC3_df)

GeneExpression <- expression_df$GeneExpression

Treatments <- expression_df$Treatment

#ANOVA test
expression_df$Treatment <- as.factor(expression_df$Treatment)

c <- aov(GeneExpression~Treatments, data = expression_df)

c

summary(c)

#pos-hoc
library(multcomp)

d<-glht(c,linfct=mcp(Treatments="Dunnett"))


#3) According to your result, which mean(s) is/are significantly different from the others? (1pt)

