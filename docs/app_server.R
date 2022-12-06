library(shiny)
library(plotly)
library(dplyr)

loan_balances_byage <- read.csv("../data/Student_Loan_Balances_by_Age_by_State.csv", stringsAsFactors = FALSE) %>%
  select(Location, avg_balance_LE24,	avg_balance_25_34,	avg_balance_35_49,	avg_balance_50_61,	avg_balance_GE62)

server <- function(input, output) {
  # chart 1 plot
  output$chart1 <- renderPlotly({
    chart1_data <- loan_balances_byage %>%
      filter(Location == input$search) %>%
      select(avg_balance_LE24,	avg_balance_25_34,	avg_balance_35_49,	avg_balance_50_61,	avg_balance_GE62)

    ages_to_show <- c("24 and Under", "25 to 34", "35 to 49", "50 to 61", "62 and Higher")
    balances <- unlist(chart1_data[1,])
    
    p1 <- plot_ly(x = ages_to_show,
                 y = balances,
                 type = "bar")
    
    return(p1)
  })
}