#Loading Packages
#library(ggplot2)
#library(shiny)
#library(tidyr)
#library(dplyr)
#library(shinythemes)
#library(plotly)

#Loading/Editing Data 1 
loan_balances_byage <- read.csv("../data/Student_Loan_Balances_by_Age_by_State.csv", stringsAsFactors = FALSE) %>%
  select(Location, avg_balance_LE24,	avg_balance_25_34,	avg_balance_35_49,	avg_balance_50_61,	avg_balance_GE62) %>%
  summarise(Location = c(Location, "National"),
            across(where(is.numeric), ~ c(., mean(.))))
#Loading/Editing Data 2
loan_balance_bytype <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-jstinle/main/data/non_mort_balance.csv", stringsAsFactors = FALSE)

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
}



