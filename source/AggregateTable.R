#load packages
library(dplyr)
library(tidyverse)

#load datasets
balance_borrows_per_ages <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-jstinle/main/data/Student_Loan_Balances_by_Age_by_State.csv")

ages <- c("18-29", "30-44", "45-59", "60+")
bachelor_percentage <- c("60", "59", "48", "29")
graduate_percentage <- c("73", "68", "56", "36")

percentage_debt <- data.frame(ages, bachelor_percentage, graduate_percentage)

#filter datasets
average_balance <- balance_borrows_per_ages %>%
  select(avg_balance_LE24,avg_balance_25_34,avg_balance_35_49,avg_balance_50_61,avg_balance_GE62) %>%
  summarise(avg_balance_LE24 = mean(avg_balance_LE24),
            avg_balance_25_34 = mean(avg_balance_25_34),
            avg_balance_35_49 = mean(avg_balance_35_49),
            avg_balance_50_61 = mean(avg_balance_50_61),
            avg_balance_GE62 = mean(avg_balance_GE62)) %>%
  mutate("Under 30" = (avg_balance_LE24 + avg_balance_25_34) / 2,
         "30 to 50" = (avg_balance_25_34 + avg_balance_35_49) / 2,
         "50 to 60" = avg_balance_50_61,
         "Above 60" = avg_balance_GE62,
         avg_balance_LE24 = NULL,
         avg_balance_25_34 = NULL,
         avg_balance_35_49 = NULL,
         avg_balance_50_61 = NULL,
         avg_balance_GE62 = NULL)

balance <- as.numeric(average_balance[1,])
ages <- c("Under 30", "30 to 50", "50 to 60", "Above 60")

average_balance <- data.frame(ages, balance) %>%
  rename("Approximate Ages" = ages, "Average Balance (in USD)" = balance)


borrowers_outstanding <- balance_borrows_per_ages %>%
  select(dollars_LE24,borrowers_LE24,dollars_25_34,borrowers_25_34,dollars_35_49,borrowers_35_49,dollars_50_61,
         borrowers_50_61,dollars_GE62,borrowers_GE62) %>%
  summarise(dollars_LE24 = mean(dollars_LE24),
            borrowers_LE24 = mean(borrowers_LE24),
            dollars_25_34 = mean(dollars_25_34),
            borrowers_25_34 = mean(borrowers_25_34),
            dollars_35_49 = mean(dollars_35_49),
            borrowers_35_49 = mean(borrowers_35_49),
            dollars_50_61 = mean(dollars_50_61),
            borrowers_50_61 = mean(borrowers_50_61),
            dollars_GE62 = mean(dollars_GE62),
            borrowers_GE62= mean(borrowers_GE62))

borrowers <- borrowers_outstanding %>%
  select(contains("borrowers")) %>%
  mutate("Under 30" = (borrowers_LE24 + borrowers_25_34) / 2,
         "30 to 50" = (borrowers_35_49 + borrowers_35_49) / 2,
         "50 to 60" = borrowers_50_61,
         "Above 60" = borrowers_GE62,
         borrowers_LE24 = NULL,
         borrowers_25_34 = NULL,
         borrowers_35_49 = NULL,
         borrowers_50_61 = NULL,
         borrowers_GE62 = NULL)
borrowers <- as.numeric(borrowers[1,])

outstanding <- borrowers_outstanding %>%
  select(contains("dollars")) %>%
  mutate("Under 30" = (dollars_LE24 + dollars_25_34) / 2,
         "30 to 50" = (dollars_35_49 + dollars_35_49) / 2,
         "50 to 60" = dollars_50_61,
         "Above 60" = dollars_GE62,
         dollars_LE24 = NULL,
         dollars_25_34 = NULL,
         dollars_35_49 = NULL,
         dollars_50_61 = NULL,
         dollars_GE62 = NULL)
outstanding <- as.numeric(outstanding[1,])


borrowers_outstanding <- data.frame(ages, borrowers, outstanding ) %>%
  rename("Approximate Ages" = ages, 
         "Number of Borrowers (in thousands)" = borrowers, 
         "Amount of Unpaid Loans (in billions of USD" = outstanding)
View(borrowers_outstanding)


View(borrowers_outstanding)

percentage_debt <- percentage_debt %>%
  mutate("Approximate Ages" = c("Under 30", "30 to 50", "50 to 60", "Above 60")) %>%
  select("Approximate Ages", "bachelor_percentage", "graduate_percentage") %>%
  rename("Bachelor-Degree Havers in Debt (in percentage)" = "bachelor_percentage",
         "Graduate-Degree Havers in Debt (in percentage)" = "graduate_percentage")

#final table
aggregate_table <- borrowers_outstanding %>%
  full_join(average_balance) %>%
  full_join(percentage_debt)