library(tidyverse)


#Importing data into a dataframe.
loan_agestate <- read.csv("../data/Student_Loan_Balances_by_Age_by_State.csv")

Locations<- c(loan_agestate$Location)

#Creating a scatterplot, with each color representing a state.
#Showing how number of borrowers relates to dollars owed.

loan_agestate %>%
  ggplot(aes(x = borrowers_LE24,
             y = dollars_LE24,
             colour = Location))+
  geom_point()+
  labs(x = "Number of Borrowers (Thousands)",
       y = "Dollars Owed (Billions)",
       title = "Student Loans Owed By Those Less Than 24 Years Old In Each State")+
  theme_minimal()

