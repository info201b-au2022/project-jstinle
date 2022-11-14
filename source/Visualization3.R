library(tidyverse)
loan_agestate <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-jstinle/main/data/Student_Loan_Balances_by_Age_by_State.csv")
View(loan_agestate)

Locations<- c(loan_agestate$Location)

loan_agestate %>%
  ggplot(aes(x = borrowers_LE24,
             y = dollars_LE24,
             colour = Location))+
  geom_point()+
  geom_smooth(method = lm,
              se = F)+
  labs(x = "Number of Borrowers (Thousands)",
       y = "Dollars Owed (Billions)",
       title = "Student Loans Owed By Those Less Than 24 Years Old In Each State")+
  theme_minimal()

