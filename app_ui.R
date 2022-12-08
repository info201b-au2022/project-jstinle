# #library(shiny)
# #library(shinythemes)
library(plotly)
# #library(dplyr)
# 
# # -----------------------------------------------------------------------------
# # Michelle's Section
# # Intro + Chart1
# # -----------------------------------------------------------------------------
# 
# # Intro Page Code
intro_main_content <- mainPanel(
  img(src="https://tennesseelookout.com/wp-content/uploads/2022/12/student-loan-debt-forgiveness-demonstration-getty-700x467-1.jpeg",
      height="80%", width="80%"),
  p("text"),

  h3("Problem Domain"),
  p("text"),

  h3("Research Questions"),
  p("text"),

  h3("Analyzed Data"),
  p("text"),

  h3("Key Findings"),
  p("text")
)

intro_panel <- tabPanel(
  "Introduction",
  intro_main_content
)
# 
# 
# # Chart Page Code
chart1_sidebar_content <- sidebarPanel(
  textInput("search", label = "Find a State", value = "National"),
  checkboxGroupInput("ages", label="Ages to Show:",
              choices = c("24 and Under" = "avg_balance_LE24",
                          "25 to 34" = "avg_balance_25_34",
                          "35 to 49" = "avg_balance_35_49",
                          "50 to 61" = "avg_balance_50_61",
                          "62 and Higher" = "avg_balance_GE62"),
              selected = c("avg_balance_LE24",
                           "avg_balance_25_34",
                           "avg_balance_35_49",
                           "avg_balance_50_61",
                           "avg_balance_GE62"))
)

chart1_main_content <- mainPanel(
  plotlyOutput("chart1"),
  p("This chart represents the average student loan balances for bororwers of
    different age groups. Through this interactive visualization, you are able
    to input different states across the United States and view information
    on the average oustanding loans for a person living within that state. This
    enables you to compare different generation's outstanding loan debt in
    different states.")
)

chart1_panel <- tabPanel(
  "Average Student Loan Balance per Person",
  titlePanel("Personal Student Loan Balances for Different Ages per State"),
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)
# 
# # -----------------------------------------------------------------------------
# # Justin's Section
# # Summary + Chart2
# # -----------------------------------------------------------------------------
# 
summary_main_content <- mainPanel(
  h3(em("Takeaway 1: Loans, Ages, and Locations")),
  p("From Chart 1, a huge takeaway that can be understood from the National level data is that loans can last for a detrimental period of time.
  For example, we see the average loan amount reach its peak of $43k on average for those aged 35-49;
  however, as time passes this average only decreases to $40.2k for those ages 62 and older.
  This is a key problem that we must note from this chart because as a society we should be wondering why this average is still so high despite those being at such an old age.
  It is also important to note that despite whatever state it is, this sighting still applies where even at old age there is a significant amount of student debt that remains."),

  h3(em("Takeaway 2: Student Loans vs Other Loans")),
  p("After looking at Chart 2, what can be determined is that student loans have exponentially increased over time compared to other types of loans and continue to skyrocket to unimaginable amounts,
  setting records every year. For example, in March of 2004 total student loans were just 260 billion dollars in total, while the total in March of 2014 has surpassed 1 trillion dollars.
  This data is vital to note because no other type of loan has exponentially increased and continues to increase as student loans which shows how big of a problem this is.
  Other large amount of loans such as auto loans have always been absurd amounts and it slowly increases unlike student loans which is why it is not something to be as worried about as student loans.

 "),

  h3(em("Takeaway 3: Ages and Degrees with loans")),
  p("chart3 stuff"),
)

summary_panel <- tabPanel(
  "Summary",
  titlePanel("Takeaways: Loans & Debt Per Generation, Types, and Degrees"),
  summary_main_content
)
# 
chart2_sidebar_content <- sidebarPanel(
  selectInput(inputId = "y_axis",
              label = "Selection of HELOC, Auto Loan, Credi Card, Student Loan, Other",
              choices = list("HELOC"= "HELOC", "Auto Loan" = "Auto.Loan", "Credit Card" = "Credit.Card", "Student Loan" =
                               "Student.Loan", "Other Loans" = "Other"),
              selected = "Student Loan")
)

chart2_main_content <- mainPanel(
  plotlyOutput("chart2"),
  p("This chart visualizes the quarterly amount of loan balances for Americans by type in BILLIONS of dollars.
  With this interactive visualization, you are able
    to input a variety of loan types in the United States and view data
    on the total amount of loans by that selected type. This allows you to compare and see the differences between the amounts of loans.")
)

chart2_panel <- tabPanel(
  "Loan Amount By Type",
  sidebarLayout(
  chart2_sidebar_content,
  chart2_main_content
))
# 
# 
# # -----------------------------------------------------------------------------
# # Karina's Section
# # Report + Chart3
# # -----------------------------------------------------------------------------
report_panel <- tabPanel(
  "Report",
  titlePanel("report title")
)

chart3_main_content <- mainPanel(
  plotlyOutput("chart3"),
  p(" ")
  
)

# Shiina's Changes:
# I reverted your choices vector and added an "inputId = " for clairty.
chart3_sidebar_content <- sidebarPanel(
  selectInput(inputId = "degree",
              label = "Degrees to show:",
              choices = c("Bachelor's Degree" = "bachelor_percentage",
                          "Associate's Degree" = "associate_percentage", 
                          "Certificate's Degree" = "certificate_percentage",
                          "Graduate's Degree" = "graduate_percentage"),
              selected = TRUE
  )
) 

chart3_panel <- tabPanel(
  "Average debt by Degree type and Age",
  titlePanel("Educational Debt by Age group and Degree Type"),
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)

# 
# 
# # -----------------------------------------------------------------------------
# # Create UI
# # -----------------------------------------------------------------------------
 ui <- navbarPage(
#   theme = shinytheme("simplex"),
   "Student Loan Debt: The Growing Trillion-Dollar Crisis",
  intro_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  summary_panel,
  report_panel
 )
