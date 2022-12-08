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

  h3("Problem Domain"),
  p("Student debt has only risen in the recent years; and although the government 
    had tried various ways to relive debt, more and more people take on loans leading 
    to trillions of dollars of student debt in the United States. The loaning system 
    generates a system that leads to students paying off their original loan many times 
    over yet their debt continues to climb, while the governmental solutions are only a 
    bandaid on the ever growing pile of student debt. Direct stakeholder-wise, current 
    borrowers are affected by high interest rates; while private lenders as indirect 
    stakeholders are enabled to exploit borrowers for profit. There are many debt 
    relief programs—both private and federal—that attempt to help, however due to the 
    confusing and unfair relief systems has also done additional harm. Student debt 
    reductions allow borrowers offer slight relief to increasing and compounding balance; 
    further benefitting people in need in an accessible and digitized way. However, this 
    harms people with higher post-grad incomes but immense debt whose incomes eliminates 
    them from consideration of student loan relief; while their incomes may not match 
    their outstanding debt."),

  h3("Research Questions"),
  p("What factors make it so difficult for students to repay their student loans?"),
  p("What advantages and disadvantages would the economy and government have given the 
    option to eliminate all student loan debt?"),
  p("Will the problem of student debt ever be resolved and how?"),

  h3("Analyzed Data"),
  p("We analyzed Data.word’s datasets regarding debt balances by age, debt amount 
    distribution frequency, home ownership rates with and without loans, and non-mortage 
    debt types. We also analyzed various student loan statistics from the Education Data 
    Initiative including loan forgiveness acceptance rates and debt percentages for different 
    degree types. Lastly, we analyzed student loan borrowers, outstanding debt, and balances 
    for different age ranges and states."),

  h3("Key Findings"),
  p("Repaying student loans takes a long time. Most likely due to detrimental 
    compounding interest, loan debt is highest not during people's  young adult years,
    but at early-middle aged years; with, on avergae, slight decreases in debt after 
    peaking."),
  p("Student loans by far outrank other non-mortage type loans in terms of the amount of
    outstanding debt. This has gone up exponentially, especially in the past few years."),
  p("Additional schooling correlates with higher student debt, which is reasonable. However,
    this debt continues to last for up to decades after schooling is over.")
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
  p("Once interacting with Chart 3 you will discover that the higher the degree obtained the more people that have that degree will have debt and this is expected to occur since they usually cost a lot more to obtain. 
  However, a key takeaway is the duration of this debt by age group, we can see that this debt slowly decreases but for most people this amount will last decades despite the degree type. 
<<<<<<< HEAD
    This is a problem in the United States that should be looked at more closely because it draws people away from pursuing higher education since pursuing a graduate degree can mean paying 
    off your debt for the rest of your life and possibly never even paying it off. "),
# =======
  # This is a problem in the United States that should be looked at more closely because it draws people away from pursuing higher education since pursuing a graduate degree can mean paying 
  #   off your debt for the rest of your life and possibly never even paying it off."),
# >>>>>>> 0b32847ba49a73869f303fd5dd7e20314a890727
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
  titlePanel("INFO201 Project Proposal: Project 8"),
  h3("Code Name"),
  p("Broke Boyz"),
  h3("Project Title"),
  p("Student Loan Debt: The Growing Tillion-Dollar Crisis"),
  h3("Authors"),
  p("Michelle Arquiza | marquiza@uw.edu"),
  p("Justin Le | jxle@uw.edu"),
  p("Karina Chan | karinac@uw.edu"),
  
  h3("Affiliation"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  h3("Date"),
  p("December 8, 2022"),
  h3("Abstract"),
  p("Student debt has only continued to grow in the past few years overall and for individuals themselves; while it appears that many people take their debt with them all throughout their lives. Because of this, the main problem we plan to explore further is how and why student loan debt has only continued to increase as many students make payments and end up further in debt since it is an oxymoronic and damaging situation, especially for those struggling financially. This question concerns us, because as students that experience this problem first hand we not only see this problem for us, but also seeing the increase of student debt for other students nationally is an issue worth addressing. We will address this question by analyzing how student debt financial situations are for different categories of people and what advantages and drawbacks will arise with many governmental ideas constantly created to help in erasing student loan debt."),
  h3("Keywords"),
  p("College Loans, Students, Financial Aid, College, Debt Relief"),
  h3("Introduction"),
  p("While student loan debt continues to skyrocket year after year, the number of students with outstanding student loan debt still continues to increase. Many current or former students reliably repay their student loans, yet their debt does not seem to decrease—it does the exact opposite and continues to surge as time continues. This leaves many first-generation and economically disadvantaged people who required the money initially vulnerable to accumulating levels of debt; taking loans in an attempt to better their current situations but ultimately ending up buried under their debt burdens. This problematic interest capitalization has inflated to increasingly higher amounts and targeted desperate people in untenable circumstances, leaving many crippled with the idea that they will pass away with student loan debt. This begs the questions: how does this system operate, why is this the case, and why has there been no solution to this trillion-dollar crisis?"),
  h3("Problem Domain"),
  p("As student debt continues to rise, the government is trying solutions to relieve debts based on income-based needs. However, there are several internal and environmental factors to consider and concerns that should be accounted for. First, the loaning system itself – where interest is compounded exponentially even as students are paying off their loans, which can create unaffordable debts many people can’t afford to pay back. Secondly, governmental solutions have both benefits and unintended negative consequences that can relieve student loans and also be exploited by unintended parties; the two main solutions to date include Biden’s newest relief plan to cover up to $20,000 federally held loans to eligible income brackets and Pell grants to eligible students (Coy, 2022). Additionally, there may be more efficient ways to help students with their debts, but the ethics of data collection for these purposes may limit efficiency. Finally, we must consider the stakeholders that include, but are not limited to students, taxpayers, government (Department of Education in particular), schools/universities that control tuition costs, and opponents of Biden’s relief plan. 
    Addressing the direct stakeholders, the high interest rates on student loans can pressure borrowers into lending more over time, contributing to increasing debt as it’s paid off and affects mostly low-income and minority groups. Privatization of loaning services and private lenders also creates an advantage for lenders, an indirect stakeholder, to exploit borrowers for profit, making the process difficult and contributing to the compounding student debt in the U.S. (Herd, 2022). The Biden administration, a direct stakeholder as the source of debt relief,  is attempting to subsidize costs of higher education for eligible students using the pandemic’s emergent crisis as the catalyst for this program. This plan has met tension with opponents such as taxpayers and other indirect stakeholders, citing this plan will create unintended consequences.
    An unintended consequence that benefits higher income students but strains government resources and at times, lower income students is the incentive to spend more recklessly knowing there is a government subsidized safety net. This can cost taxpayers in the long run (estimated $379 billion in cost over 30 years), drain the government of funding resources, and contribute to inflation as borrowers have more to spend. An example of a failed relief program is the Federal Family Education Loan (FFEL) that suddenly changed its policy, cutting many eligible borrowers from receiving aid (Lieber, 2022). This exemplifies another disparity between federal loan borrowers and those who borrow under third-party loans, a result of confusing loan policies and unequal loan systems. 
    Another consequence of an income-based eligibility system is the disparity between post-grad income that can cut certain major groups out of eligibility due to higher salaries as opposed to lower salary jobs that still qualify for the relief’s income bracket. 
    Reviewing eligibility can be made easier for students and benefit a greater number of students through the Department of Education’s acquisition of IRS data, but would bring an ethical dilemma of public privacy.
    Benefits to solutions to relieve student debt first and foremost give borrowers a chance
    to relieve debt and that would otherwise be compounded by covering remaining balance (Herd, 2022) through Biden’s debt forgiveness program, and the Pell grant aids the most affected groups. Furthermore, the government is not giving out money, only reducing the debt of borrowers, which makes eligibility fraud minor and the benefit for borrowers major. Additionally, the application of the program is simple and digitized (contrary to most government forms), giving borrowers greater accessibility and setting a positive precedent for future government forms."),
  h3("Research Questions"),
  p("In the United States, student loan debt is structured to be paid off in just 10 years, but on average it takes students about 20 years, with some being even over 30 years. What factors make it so difficult for students to repay their student loans? 
  In today’s society many desire for student  debt to be forgiven. With many bills currently being set in place to eliminate certain amounts of debt, this brings up the question of: what advantages and disadvantages would the economy and government have given the option to eliminate all student loan debt?
  Over time the national student loan debt can be seen surging to record levels every year in trillions of dollars as more and more students continue to take out loans to fund their education. While there are many ideas put in place to relieve student debt, will this problem ever be resolved and how? If not, to what extent can student debt reach, or will it continue to rise to unimaginable heights?"),
  h3("The Datasets"),
  h3("The Dataset: Data.world Student Loan Debts"),
  p("This dataset specifically targets different levels of and prevalence of borrowers of student loans per different groups such as loans per age group or frequency by levels of debt. This will help us understand if age plays a role in the repayment of loans, how long this problem has prevailed, and the effect of student debt on other personal economic situations. 
  High-ranking members (vice presidents, administrators, research officers, and economists) of the Federal Reserve Bank of New York’s Research and Statistics Group conducted the research due to the, at the time, increased attention by policymakers and the media. The data collected was taken from the bank’s Consumer Credit Panel and anonymized Equifax credit data; so it follows that it is sponsored by their respective corporations. Since this data was recorded and analyzed directly by affiliate banks, it is safe to assume that the data is secure, credible, and trustworthy. We obtained the data through the google dataset search and credited Data.world, the website that makes the datasets accessible."),
  tableOutput('report_table1'),
  p("*LINK:* [Data.world Student Loan Debt](https://data.world/finance/student-loan-debt
) (full citation in references))"),
  h3("Dataset 2: Statista Student Loan Forgiveness"),
  p("This dataset addresses the conflicts that many have regarding student loan forgiveness, it shows how student loan debt is continuing to rise but at the same time applications for student loan forgiveness are at the highest it's ever been as well. The data shows that more and more applications are being submitted, and while the application rate is booming, the acceptance rate is very slowly increasing in comparison to the denial rate. This then brings up the problem that as a nation, the student debt is not getting better, it is getting worse and there are not enough loan forgiveness acts put in place.

This data was collected by Melanie Hanson, she is an educator, research analyst and the senior editor for the Education Data Initiative. The data was collected up to November 30th, 2020 to show how much student loans have been forgiven and what types were forgiven the most. The research is not funded by any third parties, and is conducted by an organization that takes donations. Students fighting for more loan forgiveness can be benefitted, as well as policymakers in understanding the statistics behind student loan forgiveness in order to create bills regarding this topic. The data can be assumed that it is trustworthy because it is data collected from government websites and it is stated that all their data is fact checked. I obtained this data by looking up datasets on student loan forgiveness and have credited educationdata.org for making it accessible to find this information."),
 tableOutput('report_table2'),
  p("*LINK:* [https://educationdata.org/student-loan-forgiveness-statistics] Hanson, Melanie. “Student Loan Forgiveness Statistics” EducationData.org, January 1, 2022,
https://educationdata.org/student-loan-forgiveness-statistics)"),
  h3("Dataset 3: Kaggle Student Loan Averages"),
  p("This dataset highlights how much student loan debt is outstanding within a sample population in age groups of under 24 years, 24-34 years, 35-49 years, 50-61, and 62 years and over. This dataset also organizes the data geographically by state within the U.S. This is relevant to our research because we can analyze the amount of debt over the course of time and infer on which factors are contributing to higher or lower amounts of debt. Using this dataset, we can observe and estimate future loan trends and whether a loan relief plan would be plausible or effective. With the intersectionality of geography and age group, we can analyze patterns of loans across states and ages and make projections on loan debt in future years. Additionally, we can refer back to these datasets and analyze any changes if a loan forgiveness program was implemented. 
  This data was collected on October 9, 2019 by Diana Lavery, a demographer, sociologist, and economics practitioner with over 10 years of experience. She is a senior engineer at ArcGIS Living Atlas and published many datasets and articles. For this dataset, she sourced her information from Enterprise Data Warehouse of Federal Student Aid, an office of the U.S. Department of Education and included different types of loans including Direct Loans, Federal Family Education Loans, and Perkins Loans, including principal and outstanding interest within her data. The data is likely informational and benefits borrowers or interested audiences in being more informed, but not exploitative. This dataset is also licensed under Esri Master License and is trustworthy as all the data sets and information come directly from government records."),
 tableOutput('report_table3'),
  p("*LINK:* [https://livingatlas-dcdev.opendata.arcgis.com/datasets/UrbanObservatory::student-loan-balances-by-age-by-state/explore?location=38.995091%2C-112.206293%2C4.52&showTable=true](full citation in references)"),

  h3("Findings"),
  p("There are several factors that make it increasingly difficult for students to repay their debt in student loans. For one, there is an increased amount of borrowers, correlating with an increased necessity, and near requirement to obtain a type of degree in higher education in order to make a career and land jobs. An increase in borrowers also means an increase in the number of loans borrowed, contributing to a higher amount of educational debt. The need to obtain degrees in higher education in order to succeed in higher careers is a prominent factor in racking up students’ debts, making it more and more difficult to pay it off within reasonable amounts within a lifetime. According to our data sets, the rate student loans increased exponentially over time surpasses other types of debt like auto loans or credit card loans, which remain relatively stable. At 1 trillion dollars in student debt by 2014 in America, student loans are increasing a rapid pace with other costs staying relatively constant, making it difficult for students in the past 20 years harder to pay back their debts as easily as those from 40 or 30 years ago. 
	If the government has the option to eliminate all student loan debts, borrowers may contribute and stimulate the economy by being able to spend, rather than using their savings to pay back their student loans. Loan forgiveness for those within the requirements for financial aid may also be able to contribute to the workforce more effectively rather than struggle financially (at increased rates with credit card interest fees). However, the loan forgiveness programs are still flawed in the structure of determining who is eligible, as income-based forgiveness can be biased and not reflect actual financial need. Additionally, according to our most recent data in 2022, those who are in the 18 to 29 and 30 to 44 age groups are still the highest loan borrowers and still owe significantly more than previous generations, highlighting the ineffectiveness of programs and current resources to resolve this issue. 
	While the Biden administration is striving to implement programs that forgive loans based on financial need, there is still a long way to go in structuring forgiveness programs the help those in most need (especially those disproportionately affected such as low income students). Furthermore, it can cost taxpayers in the long run and create unfair and ineffective labor markets if education continues to become more and more financially inaccessible.  There is hope to relieve some current student debt, but there will need major restructuring in reasonable tuition and charges from educational institutions and adequate funding to support Biden’s and other future loan relief programs.
"),
  
  h3("Discussion"),
  p("The significance of our findings strongly points to the exponentially increasing amount of student loan debt, correlating with an increased need for loan borrowing and steadily rising tuition costs, particularly affecting those around ages 18 to 24 in higher education. However, if we take a look at personal student loan balances across states, those in the 35 to 49 age range and 50 to 61 age range owe a greater balance amount. This means that the consequence of student loans is not only affecting those who are more recently graduated but also affects borrowers over a lifetime. This can imply several things. First, younger students aren’t able to pay the inflated education costs currently and have to depend on loans to be able to afford a near requirement to attain a job. Secondly, older borrowers are still burdened with the debt that was likely incurred years before and isn’t able to pay those debts back, particularly with compounding loan interest fees. 
Our findings highlight the rapidly increasing amount of borrowers and amount of loan debt built up within the last decades, and the continuing trend of high requirements and cost of higher education. These requirements disproportionately affect lower-income students and can be a dangerous trend in deepening income inequality. The higher barrier to attaining higher education will discourage students from applying, which can reduce the labor market and weaken the economy. 
In the long term, perpetually increasing student debt across the nation can affect the economy in terms of the labor market, and government, and ultimately cost taxpayers. Federal student loan programs are costing the government billions of dollars, and the current trend of higher debts means higher costs for the government. This in turn can affect taxpayers through compensating with higher taxes while not addressing the systemic issues. 
While private institutions are profiting from inflated tuitions that are becoming the norm, the loan borrowers, the government, and taxpayers are being costed in the short and long term. The easily accessible loan programs the government is giving out and the normalization of inflated education costs together contribute to higher and higher student loan debt. This is consequential in borrowers taking on debt while there are no tangible consequences in the short term, giving a false sense of security when in reality, could be difficult to pay back with high-interest rates in the long term. Overall, increased student loan debt has detrimental consequences across all age groups in higher education, and will be costly to the economy in the short and long term
"),
  
  h3("Conclusion"),
  p("Student loan debts have exponentially increased over the past 4-5 decades and continue to rise. Particularly in higher education and acquiring degrees, it is becoming increasingly difficult for borrowers to pay back their student loans. This especially affects borrowers who are low-income. It is more difficult to pay debts off within a lifetime, and this burden is exacerbated by the high-interest fees for loans given by government programs and private institutions. 
Additionally, the rate that educational loan debt is increasing is significantly higher than other types of loans, making education even more inaccessible and highlights the exploitation of borrowers for an increasingly necessary degree. 

Continuing the trend of inflated education and ease of loaning will have a domino effect in burdening borrowers with debt for decades to come, discouraging people from even attaining higher education, and in the long term weakening the economy. Current borrowers are burdened with the greater and greater costs of higher education, with long-term payback plans that include high-interest fees. Borrowers who have borrowed decades before are still in the midst of paying back their loans long after receiving their degree and face a similar problem in interest rates. Lower-income borrowers are left unable access higher education through standard means and either must meet the eligibility requirements or borrow hefty loans that can rack up, especially with multiple degrees. These factors have an ultimate impact on the future labor market, increased income inequality, costs to the government with high loan out costs, and compensating taxing to taxpayers. 

Though there are initiatives and programs in place for student loan relief, they are still flawed in targeting those who are in actual financial need due to the income-based eligibility requirements. We must take a look at the trending data that indicates a explosive increase in student loan debt that can be attributed to several factors such as inflated tuition fees for higher education, ease of loan approvals that allows those who may not be able to pay back within their means to borrow, and the neglect of long-term consequences that will result from rising educational loans. Overall, the spike in student loan debts over the past decades needs a second look in terms of ways we can combat inflated education costs and the amount of loans. Loans that have rippling consequences that can only be addressed through systemic changes in policy.
"),
  
  
  h3("Acknowledgements"),
  p("Big thank you and love to our lovely TA Shiina who helped us out in dire times <3. Also general shoutout to the internet but mostly a pat on the back for our team. Big love."),
  h3("References"),
  p("Brown, Meta, et al. Student Loan Landscape Data. 2015. Federal Reserve Bank of New York [producer]. Data.world [distributor], 2016. Web. 31 October 2022. https://data.world/finance/student-loan-debt"),
  p("Coy, P. (2022, September 26). Biden's student loan plan has issues. The New York Times. Retrieved October 31, 2022, from https://www.nytimes.com/2022/09/26/opinion/biden-student-loan-forgiveness.html?searchResultPosition=9"),
  p("Herd, P., & Moynihan, D. P. (2022, October 23). Turns out sometimes the government can get things right. The New York Times. Retrieved October 31, 2022, from https://www.nytimes.com/2022/10/23/opinion/student-loan-debt-relief-application-process.html?searchResultPosition=10"),
  p("Lavery, D. (2019, October 19). Student loan balances by age by State. Living Atlas of the World. (n.d.). Retrieved October 31, 2022, from https://livingatlas-dcdev.opendata.arcgis.com/datasets/UrbanObservatory::student-loan-balances-by-age-by-state/explore?location=36.536139%2C-112.206293%2C4.52&amp;showTable=true"),
  p("Lieber, R. (2022, October 15). The student loan borrowers who keep missing out on relief. The New York Times. Retrieved October 31, 2022, from https://www.nytimes.com/2022/10/15/your-money/ffel-student-loan-relief.html?searchResultPosition=1"),
  p("Liptak, A. (2022, October 20). Courts reject challenges to Biden Plan on student debt. The New York Times. Retrieved October 31, 2022, from https://www.nytimes.com/2022/10/20/us/politics/supreme-court-student-loan-forgiveness.html"),
)

chart3_main_content <- mainPanel(
  plotlyOutput("chart3"),
  p("This bar chart is a visualization of the percent of loan debt of age groups based on their degree type for Americans as of 2022.
    In this visualization, you are able to navigate and explore the amount of debt relative to other age groups by selecting a degree type .
    With this comparison, you'll be able to visualize the percentage of debt each age group has and the correlating degree types.")
  
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
  "Average Debt by Degree Type and Age",
  titlePanel("Educational Debt by Age Group and Degree Type"),
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
