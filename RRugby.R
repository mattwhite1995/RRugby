#The intent of this script is to determine if there would be any effect in game 
#outcomes over rugby history if the different scoring systems had been used
#throughout history 

install.packages("rvest")

library(rvest)

Scrum <- read_html("http://stats.espnscrum.com/statsguru/rugby/stats/index.html?class=1;orderby=date;template=results;type=team;view=match")

table <- html_table(html_nodes(Scrum, "table")[[4]])

