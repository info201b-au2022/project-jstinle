intro_panel <- tabPanel(
  "Introduction",
  titlePanel("intro title")
)

chart1_panel <- tabPanel(
  "chart 1 descriptor",
  titlePanel("chart 1 title")
)

chart2_panel <- tabPanel(
  "chart 2 descriptor",
  titlePanel("chart 2 title")
)

chart3_panel <- tabPanel(
  "chart 3 descriptor",
  titlePanel("chart 3 title")
)

summary_panel <- tabPanel(
  "Summary",
  titlePanel("summary title")
)

report_panel <- tabPanel(
  "Introduction",
  titlePanel("report title")
)

ui <- navbarPage(
  "Student Loan Debt",
  intro_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  summary_panel,
  report_panel
)
