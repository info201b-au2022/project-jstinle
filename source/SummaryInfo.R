#load packages
library(dplyr)
library(tidyverse)

#load datasets
approved <- c(3458)
denied <- c(241910)
pending <- c(145965)
loan_forgiveness <- data.frame(approved, denied, pending)

ages <- c("18-29", "30-44", "45-59", "60+")
bachelor_percentage <- c("60", "59", "48", "29")
graduate_percentage <- c("73", "68", "56", "36")

percentage_debt <- data.frame(ages, bachelor_percentage, graduate_percentage)
View(percentage_debt)

balances <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-jstinle/main/data/Student_Loan_Balances_by_Age_by_State.csv")


#summary function
summary_info <- list()

summary_info$loan_percentage_approved <- round(loan_forgiveness["approved"] / rowSums(loan_forgiveness) * 100, 2)[1,]

money <- balances %>%
  select(dollars_LE24,dollars_25_34,dollars_35_49,dollars_50_61,dollars_GE62) %>%
  summarise(dollars_LE24 = mean(dollars_LE24) * 1000000000,
            dollars_25_34 = mean(dollars_25_34) * 1000000000,
            dollars_35_49 = mean(dollars_35_49) * 1000000000,
            dollars_50_61 = mean(dollars_50_61) * 1000000000,
            dollars_GE62 = mean(dollars_GE62)) %>%
  rowwise() %>% mutate(max = max(c(dollars_LE24,dollars_25_34,dollars_35_49,dollars_50_61,dollars_GE62)),
                       min = min(c(dollars_LE24,dollars_25_34,dollars_35_49,dollars_50_61,dollars_GE62))) %>%
  rename("less than 24" = dollars_LE24,
         "25 to 34" = dollars_25_34,
         "35 to 49" = dollars_35_49,
         "50 to 61" = dollars_50_61,
         "greater than 62" = dollars_GE62)

summary_info$max_num_loans = money %>%
  pull(max)
summary_info$max_num_loans_age <- names(money)[money[1,] == summary_info$max_num_loans][1]

summary_info$min_num_loans = money %>%
  pull(min)
summary_info$min_num_loans_age <- names(money)[money[1,] == summary_info$min_num_loans][1]

borrowers <- balances %>%
  select(borrowers_LE24,borrowers_25_34,borrowers_35_49,borrowers_50_61,borrowers_GE62) %>%
  summarise(borrowers_LE24 = mean(borrowers_LE24) * 1000,
            borrowers_25_34 = mean(borrowers_25_34) * 1000,
            borrowers_35_49 = mean(borrowers_35_49) * 1000,
            borrowers_50_61 = mean(borrowers_50_61) * 1000,
            borrowers_GE62 = mean(borrowers_GE62) * 1000) %>%
  rowwise() %>% mutate(max = max(c(borrowers_LE24,borrowers_25_34,borrowers_35_49,borrowers_50_61,borrowers_GE62))) %>%
  rename("less than 24" = borrowers_LE24,
         "25 to 34" = borrowers_25_34,
         "35 to 49" = borrowers_35_49,
         "50 to 61" = borrowers_50_61,
         "greater than 62" = borrowers_GE62)

summary_info$max_num_borrowers = borrowers %>%
  pull(max)

summary_info$max_num_borrowers_age <- names(borrowers)[borrowers[1,] == summary_info$max_num_borrowers][1]

summary_info$highest_bachelor_debt <- percentage_debt %>%
  mutate(max_degree = max(bachelor_percentage)) %>%
  pull(max_degree)
summary_info$highest_bachelor_debt <- summary_info$highest_bachelor_debt[1]

summary_info$highest_bachelor_debt_age <- percentage_debt %>%
  filter(bachelor_percentage == max(bachelor_percentage)) %>%
  pull(ages)

summary_info$lowest_bachelor_debt <- percentage_debt %>%
  mutate(min_degree = min(bachelor_percentage)) %>%
  pull(min_degree)
summary_info$lowest_bachelor_debt <- summary_info$lowest_bachelor_debt[1]

summary_info$lowest_bachelor_debt_age <- percentage_debt %>%
  filter(bachelor_percentage == min(bachelor_percentage)) %>%
  pull(ages)

summary_info