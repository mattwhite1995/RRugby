#The intent of this script is to determine if there would be any effect in game 
#outcomes over rugby history if the different scoring systems had been used
#throughout history 

install.packages("rvest")
install.packages("tidyverse")

library(rvest)
library(tidyverse)
multi_table <- 1
for(i in 1:30){ #look to get max page number from page
  url <- paste("http://stats.espnscrum.com/statsguru/rugby/stats/index.html?class=1;filter=advanced;orderby=date;page=",i,";size=200;template=results;type=team;view=match", sep = '')
  Scrum <- read_html(url)
  table <- html_table(html_nodes(Scrum, "table")[[4]])
  if(typeof(multi_table) != "list"){
    multi_table <- table[FALSE,]
  }
  multi_table <- rbind(multi_table, table)
}


#remove NA columns
results <- Filter(function(x)!all(is.na(x)), multi_table)
colnames(results) <- c("Team","Results","For","Aga","Diff","Tries","Conv","Pens","Drop","GfM","Opponent","Ground","Date")
six_nations <- c("England","Scotland","Ireland","Wales","Italy","France")
results2 <- filter(results, Team %in% six_nations)
row_match <- merge(results2, results2, by = c("Ground","Date"))
View(filter(row_match, Team.x != Team.y))
# View(results)

