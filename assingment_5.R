#assignment 5 associated with lab 7

#Use the “Mouse_DNA_methylation_Aging.csv” to generate bar charts for all the data, the x-
#axis is the Age_Months with a name of “Age of the mice”, the y-axis is the mean with a name of
#"Average DNA Methylation". The title of the chart is "DNA methylation level in GF and SPF
#mice at different ages". The error bars are for the mean=+/-SEM. The background is clean
#without gray color or any grids. Show me your R command lines and the final graph.

library(ggplot2)

methyl_df <- read.csv("Mouse_DNA_methylation_Aging.csv")

#Age of the mice vs Average DNA Methylation

(a <-ggplot(methyl_df,aes(x=Age_Months, y=Mean, fill=Mouse))+ 
    geom_bar(stat="identity", position="dodge")+
    ggtitle("DNA methylation level in GF and SPF mice at different ages")+
    xlab("Age of the mice")+ylab("Average DNA Methylation")+
    geom_errorbar(aes(ymin=Mean-SEM, ymax=Mean+SEM), width=.2 ,position=position_dodge(.9)) +
    theme_bw()+
    theme(panel.grid.major=element_blank())+
    theme(panel.grid.minor=element_blank())
  )
