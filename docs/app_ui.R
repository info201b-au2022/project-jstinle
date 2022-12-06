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
  p("placeholder for sidebar panel")
)

chart1_panel <- tabPanel(
  "chart 1 descriptor",
  titlePanel("chart 1 title"),
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
  "Introduction",
  titlePanel("introduction titlea")
)

chart2_panel <- tabPanel(
  "chart 2 descriptor",
  titlePanel("chart 2 title")
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
  "chart 3 descriptor",
  titlePanel("chart 3 title")
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
