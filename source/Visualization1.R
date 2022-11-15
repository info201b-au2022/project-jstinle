Debt_Distr <- read.csv("../data/debt_amt_distribution2014.csv")

Num_Borrow <- c(Debt_Distr$NumberOfBorrowers)

Group <- c("<$5001", "$5000-$10000", "$10000-$25000", "$25000-$50000", "$50000-$75000", 
           "$75000-$100000", "$100000-$150000", "$150000-$200000", "$200000+")

#Creating a barplot showing how many number of borrowers there are for each group of loans

visual1 <- barplot((Num_Borrow),
                   names.arg = Group,
                   title(main = "Debt Distribution in 2014",
                         xlab = "Debt Balance in 2014",
                         ylab = "Number of Borrowers"))
