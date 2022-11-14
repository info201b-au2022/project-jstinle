library(tidyverse)

claim_approved <- c("6943","5830","5069","4444","4263","4012","3697",
                    "3376","3174","2828","2544")
claim_denied <- c("263118","213535","205744","198662","192323","187142","187053",
                  "177422","171321","163476","155719")
claim_pending <- c("26729","20025","18402","16954","15252","15983","15041",
                   "15248","13901","12338","10931")
month <- c("2020 11", "2020 10", "2020 09", "2020 08","2020 07", "2020 06", "2020 05",
           "2020 04", "2020 03", "2020 02", "2020 01")
claimchart<- data.frame(month, claim_denied, claim_pending, claim_approved)



ggplot(data = claimchart, mapping = aes(x = month))+
  geom_line(data = claimchart, mapping = aes(x = month, y = claim_denied, group = 1), color="red")+
  geom_point(data = claimchart, mapping = aes(x = month, y = claim_denied, group = 1), color="red")+
  geom_line(data = claimchart, mapping = aes(x = month, y = claim_approved, group = 2), color="green")+
  geom_point(data = claimchart, mapping = aes(x = month, y = claim_approved, group = 2), color="green")+
  geom_line(data = claimchart, mapping = aes(x = month, y = claim_pending, group = 3), color="blue")+
  geom_point(data = claimchart, mapping = aes(x = month, y = claim_pending, group = 3), color="blue")+
  scale_x_discrete(breaks = function(x){x[c(TRUE, FALSE)]})+
scale_y_discrete(breaks = function(y){y[c(TRUE, FALSE)]})+
  labs(title = "PSLF Claims Jan 2020 - Nov 2020",
       x = "Date",
       y = "Number of Claims")




  
