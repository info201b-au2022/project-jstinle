#Loading Packages
#library(ggplot2)
#library(shiny)
#library(tidyr)
library(dplyr)
#library(shinythemes)
library(plotly)

#Loading/Editing Data 1 
loan_balances_byage <- read.csv("data/Student_Loan_Balances_by_Age_by_State.csv", stringsAsFactors = FALSE) %>%
  select(Location, avg_balance_LE24,	avg_balance_25_34,	avg_balance_35_49,	avg_balance_50_61,	avg_balance_GE62) %>%
  summarise(Location = c(Location, "National"),
            across(where(is.numeric), ~ c(., mean(.))))
#Loading/Editing Data 2
loan_balance_bytype <- read.csv("data/non_mort_balance.csv", stringsAsFactors = FALSE)

#Loading/Editing Data 3
ages <- c("18-29", "30-44", "45-59", "60+")
bachelor_percentage <- c("60", "59", "48", "29")
graduate_percentage <- c("73", "68", "56", "36")
associate_percentage <- c("48", "54", "41", "17")
certificate_percentage <- c("43","40", "25","9" )

#creating data frames for report
name1 <- c("Balance By Age", " Debt Amount Distribution", "Home Secured Debt Age 30", "Non-Mortgage Debt Types")
num_rows1 <- c(11, 9, 12, 44)
num_cols1 <- c(7, 2, 4, 6)

table1 <- data.frame(name1, num_rows1, num_cols1) %>%
  rename("Data.world Student Loan Debts" =  "name1",
         "Number of Rows" = "num_rows1",
         "Number of Columns" = "num_cols1") %>%
  mutate(across(where(is.numeric), trunc))

#data frame 2
name2 <- c("PSLF Progress (Since Nov. 30, 2020)", "PSLF Progress (Prior to Nov. 30, 2020)", "TEPSLF Progress (Prior to Nov. 30, 2020", "ED’s Borrower Defense Progress", "Educational Debt Among Post-Secondary-Educated-Adults")
num_rows2 <- c(3, 15, 8, 19, 5)
num_cols2 <- c(3, 3, 2, 3, 4)

table2 <- data.frame(name2, num_rows2, num_cols2) %>%
  rename("Statista Student Loan Forgiveness" =  "name2",
         "Number of Rows" = "num_rows2",
         "Number of Columns" = "num_cols2") %>%
  mutate(across(where(is.numeric), trunc))

#data frame 3
name3 <- c("Student Loan Balances by Age by State", "Portfolio By Borrower Location Age")
num_rows3 <- c(52, 15)
num_cols3 <- c(15, 3)

table3 <- data.frame(name3, num_rows3, num_cols3) %>%
  rename("Kaggle Student Loan Averages" =  "name3",
         "Number of Rows" = "num_rows3",
         "Number of Columns" = "num_cols3") %>%
  mutate(across(where(is.numeric), trunc))

percentage_debt <- data.frame(ages, bachelor_percentage, graduate_percentage, associate_percentage, certificate_percentage)
# View(percentage_debt)

server <- function(input, output) {
  # chart 1 plot
  output$chart1 <- renderPlotly({
    chart1_data <- loan_balances_byage %>%
      filter(Location == input$search) %>%
      select(avg_balance_LE24,	avg_balance_25_34,	avg_balance_35_49,	avg_balance_50_61,	avg_balance_GE62)

    ages_to_show <- c("24 and Under"= "avg_balance_LE24", 
                      "25 to 34" = "avg_balance_25_34", 
                      "35 to 49" = "avg_balance_35_49", 
                      "50 to 61" = "avg_balance_50_61", 
                      "62 and Higher" = "avg_balance_GE62")
    ages_to_show <- names(ages_to_show[ages_to_show %in% input$ages])
    
    
    balances <- unlist(chart1_data[1,])
    balances <- balances[which(names(balances) %in% input$ages)]
    balances <- round(balances, digits = 2)
    
    p1 <- plot_ly(x = ages_to_show,
                 y = balances,
                 type = "bar") %>%
      layout(title ="Student Loan Balance per Person",
             xaxis = list(title = "Age Range"),
             yaxis = list(title = "Dollars"))
    
    return(p1)
  })
  #chart 2 plot
  output$chart2 <- renderPlotly({
    plot <- loan_balance_bytype %>%
      select(Time, HELOC, Auto.Loan, Credit.Card, Student.Loan, Other)
    plot_data <- ggplot(plot,
                        aes(x= Time, y= !!as.name(input$y_axis)
                   )) +
      geom_bar(stat = "identity") +
      labs(title = "Quarterly Loan Balance in the United States by Type 2004-2014"
      )
    return(plot_data)
  }) 
  
  #chart 3 plot
  
  # Shiina's Changes:
  # It was taking the input as a string, not as a column name, hence the get() function
  # Good luck with the rest of the porject ! It's looking really good so far

  output$chart3 <- renderPlotly({
   p3 <- plot_ly(percentage_debt,
                 x = ages,
                 y = get(input$degree), 
                 type = "bar")
  })
 
  output$report_table1 <- renderTable(table1)
  output$report_table2 <- renderTable(table2)
  output$report_table3 <- renderTable(table3)
   
}



