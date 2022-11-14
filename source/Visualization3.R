library(tidyverse)

loan_agestate <- read.csv("https://livingatlas-dcdev.opendata.arcgis.com/datasets/UrbanObservatory::student-loan-balances-by-age-by-state/explore?location=36.882087%2C-112.206293%2C4.52&showTable=true")
#View(loan_agestate)

Locations<- c(loan_agestate$Location)

visual3 <- loan_agestate %>%
  ggplot(aes(x = borrowers_LE24,
             y = dollars_LE24,
             colour = Location)) +
  geom_point()+
  labs(x = "Number of Borrowers (Thousands)",
       y = "Dollars Owed (Billions)",
       title = "Student Loans Owed By Those Less Than 24 Years Old In Each State")+
  theme_minimal()


print(visual3)

#geom_smooth(method = lm, se = F)+


