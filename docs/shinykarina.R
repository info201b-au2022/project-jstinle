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

