#df_to_csv_users_part1:

cat("working on users dataset \n")
rm(list=ls())
#url     <- "https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/r_datasets/"
url <- "D:/Yelp/r_datasets/"
url_out <- "./r_datasets/"

#install.packages("jsonlite")

#library(jsonlite)
#users_df <- stream_in(file(user_file))
#saveRDS(users_df,"users_df")
users <- readRDS("users_df")
#####################################################################################
strt<-Sys.time()
for (i in 1:nrow(users)){
  users$FriendsNumber[i] <-   length(unlist(users$friends[i]))
}
print(Sys.time()-strt)

strt<-Sys.time()
for (i in 1:nrow(users)){
  users$EliteYearsNumber [i] <-   length(unlist(users$elite[i]))
}

print(Sys.time()-strt)
saveRDS(users,"users_df_part2")


print(Sys.time()-strt)

