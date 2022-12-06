library(shiny)
library(plotly)
library(dplyr)

# -----------------------------------------------------------------------------
# Michelle's Section
# Summary + Chart1
# -----------------------------------------------------------------------------

# Summary Page
summary_main_content <- mainPanel(
  h3("Takeaway 1: Loans, Ages, and Locations"),
  p("chart1 stuff"),
  
  h3("Takeaway 2: Student Loans vs Other Loans"),
  p("chart2 stuff"),
  
  h3("Takeaway 3: Ages and Degrees with loans"),
  p("chart3 stuff"),
)

summary_panel <- tabPanel(
  "Summary",
  titlePanel("Takeaways: Loans & Debt Per Generation, Types, and Degrees"),
  summary_main_content
)

# Chart Page
chart1_sidebar_content <- sidebarPanel(
  textInput("search", label = "Find a State", value = "Washington"),
  checkboxGroupInput("ages", label="Ages to Show:", 
              choices = c("24 and Under"= "avg_balance_LE24", 
                          "25 to 34" = "avg_balance_25_34", 
                          "35 to 49" = "avg_balance_35_49", 
                          "50 to 61" = "avg_balance_50_61", 
                          "62 and Higher" = "avg_balance_GE62"))
)

chart1_main_content <- mainPanel(
  plotlyOutput("chart1"),
  textOutput("sample"),
  textOutput("sample_names")
)

chart1_panel <- tabPanel(
  "Average Student Loan Balance per Person",
  titlePanel("Personal Student Loan Balances for Different Ages per State"),
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)

# -----------------------------------------------------------------------------
# Justin's Section
# Intro + Chart2
# -----------------------------------------------------------------------------
intro_panel <- tabPanel(
  "Introduction"
)

chart2_panel <- tabPanel(
  "chart 2 descriptor"
)


# -----------------------------------------------------------------------------
# Karina's Section
# Report + Chart3
# -----------------------------------------------------------------------------
report_panel <- tabPanel(
  "Report",
  titlePanel("report title")
)

chart3_panel <- tabPanel(
  "chart 3 descriptor"
)


# -----------------------------------------------------------------------------
# Create UI
# -----------------------------------------------------------------------------
ui <- navbarPage(
  "Student Loan Debt: The Growing Trillion-Dollar Crisis",
  intro_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  summary_panel,
  report_panel
)
