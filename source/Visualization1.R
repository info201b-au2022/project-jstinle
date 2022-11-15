#Importing debt distribution data into a dataframe
Debt_Distr <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-jstinle/main/data/debt_amt_distribution2014.csv")
View(Debt_Distr)

Num_Borrow <- c(Debt_Distr$NumberOfBorrowers)

Group <- c("<$5001", "$5000-$10000", "$10000-$25000", "$25000-$50000", "$50000-$75000", 
           "$75000-$100000", "$100000-$150000", "$150000-$200000", "$200000+")

#Creating a barplot showing how many number of borrowers there are for each group of loans

Debt_Distr %>% ggplot(aes(x = Balance2014, y = NumberOfBorrowers))+
  geom_col(aes(fill = Balance2014))+
  scale_x_discrete(breaks = function(x){x[c(TRUE, FALSE)]})+
  scale_y_discrete(breaks = function(y){y[c(TRUE, FALSE)]})+
        labs(title = "Debt Distribution in 2014",
        x = "Debt Balance in 2014",
        y = "Number of Borrowers") +
  theme_minimal()
