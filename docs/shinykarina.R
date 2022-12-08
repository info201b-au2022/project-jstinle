report_panel <- tabPanel(
  "Report",
  titlePanel("report title")
)

chart3_main_content <- mainPanel(
  plotlyOutput("chart3"),
  p(" ")
  
)
chart3_sidebar_content <- sidebarPanel(
  textInput("search", label = "Find a Degree", value = ""),
  checkboxGroupInput("degree types", label = "Degrees to show:",
                     choices = c("18 to 29" = "",
                                 "30 to 44" = "",
                                 "45 to 59" = "",
                                 "60 and over" = ""),
                     selected = c("",
                                  "",
                                  "",
                                  "",
                     ))
) 

chart3_panel <- tabPanel(
  "Average debt by Degree type and Age",
  titlePanel("Educational Debt by Age group and Degree Type"),
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)

This bar chart is a visualization of the percent of loan debt of age groups based on their degree type for Americans as of 2022.
In this visualization, you are able to navigate and explore the amount of debt relative to other age groups by selecting a degree type .
With this comparison, you'll be able to visualize the percentage of debt each age group has and the correlating degree types.")

"From Chart 3, the data showcases that 18 to 29 year olds  consistently the highest percent of edducational debt across the board in terms of degrees with the exception with associates degree, a slight 4% under the 30 to 44 year old age group.
    This means that educational debt is affecting 18 to 29 year olds the most, and correlates with increased borrowers and amount of loans relative to other age groups. The older the age group, the less loan debt they accrue, 
    which can imply a drastic increase in amount of loans borrowed in the last 4 decades. For example, the differences in percent loan debt across degrees between the 18 to 29 age group and 30 to 44 age group does 
    not vary more than 5%. However, between the 18 to 29 age group and 60 year and above, the loan debt varies from 31%-37%, illustrating a significant difference from 40 years ago. 
    From this data, it can also be determined that the loan amount increases by how advanced the degree is. From lowest to greatest loan debt across all age groups the amount increases from the certificate, then associate's, bachelor's 
    and graduate degrees respectively. 
    This can be attributed to accumulation of debts from previous degrees and increasing need to borrow in order to pursue higher education. 
    