#The intent of this script is to determine if there would be any effect in game 
#outcomes over rugby history if the different scoring systems had been used
#throughout history 

install.packages("rvest")

library(rvest)
multi_table <- 1
for(i in 1:2){ #look to get max page number from page
  url <- paste("http://stats.espnscrum.com/statsguru/rugby/stats/index.html?class=1;filter=advanced;orderby=date;page=",i,";size=200;template=results;type=team;view=match", sep = '')
  Scrum <- read_html(url)
  table <- html_table(html_nodes(Scrum, "table")[[4]])
  if(typeof(multi_table) != "list"){
    multi_table <- table[FALSE,]
  }
  multi_table <- rbind(multi_table, table)
}

head(table)
head(multi_table)

# TBD use to remove NA columns Filter(function(x)!all(is.na(x)), table)