library(shiny)
library(plotly)
library(dplyr)

# -----------------------------------------------------------------------------
# Michelle's Section
# Summary + Chart1
# -----------------------------------------------------------------------------

summary_panel <- tabPanel(
  "Summary",
  titlePanel("Takeaways: Loans & Debt Per Generation, Types, and Degrees")
)

chart1_main_content <- mainPanel(
  p("placeholder for main panel")
)
chart1_sidebar_content <- sidebarPanel(
  textInput("search", label = "Find a State", value = ""),
  checkboxGroupInput("ages", label="Ages to Show:", 
              choices = c("24 and Under", "25 to 34", "35 to 49", "50 to 61", "62 and Higher"))
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
