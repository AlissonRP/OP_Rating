`%>%` <- magrittr::`%>%`
library(rvest)
#Fillers and Saga 
df <- "https://www.animefillerlist.com/shows/one-piece" %>%
  rvest::read_html() %>%
  rvest::html_node(xpath = '//*[@id="node-19"]/div[3]/table') %>%
  rvest::html_table()
#----
Saga <- c(
  rep("East Blue", 61), rep("Alabasta", 74),
  rep("Skypiea", 71), rep("Water 7", 119),
  rep("Thriller Bark", 59), rep("Guerra de Marineford", 132),
  rep("Ilha dos Homens-Peixe", 58), rep("Aliança Pirata", 172),
  rep("Yonkou", nrow(df) + 1 - 747)
)

#Rating and votes  first 250
t=function(start){httr::GET(
  paste0("https://www.ratingraph.com/show-episodes-list/17673/?draw=1&columns%5B0%5D%5Bdata%5D=trend&",
         "columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=false&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=season&",
         "columns%5B1%5D%5Bname%5D=&columns%5B1%5D%5Bsearchable%5D=false&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=episode&",
         "columns%5B2%5D%5Bname%5D=&columns%5B2%5D%5Bsearchable%5D=false&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=name&",
         "columns%5B3%5D%5Bname%5D=&columns%5B3%5D%5Bsearchable%5D=false&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=start&",
         "columns%5B4%5D%5Bname%5D=&columns%5B4%5D%5Bsearchable%5D=false&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=total_votes&",
         "columns%5B5%5D%5Bname%5D=&columns%5B5%5D%5Bsearchable%5D=false&columns%5B5%5D%5Borderable%5D=true&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=average_rating&",
         "columns%5B6%5D%5Bname%5D=&columns%5B6%5D%5Bsearchable%5D=false&columns%5B6%5D%5Borderable%5D=true&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=1&",
         "order%5B0%5D%5Bdir%5D=asc&order%5B1%5D%5Bcolumn%5D=2&order%5B1%5D%5Bdir%5D=asc&start=start&length=250&search%5Bvalue%5D=&search%5Bregex%5D=false&_=", Sys.time() %>% as.numeric() %>% paste0("000")))}

