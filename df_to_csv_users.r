cat("working on users dataset \n")
rm(list=ls())
url     <- "https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/r_datasets/"
#url_out <- "D:/Yelp/r_datasets/"
url_out <- "./r_datasets/"

#users <- readRDS(paste0(url,"users_df"))
#users <- readRDS("https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/r_datasets/users_df")
#################
url <- "https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/datasets/"
user_file     <- paste0(url,"yelp_academic_dataset_user.json")
install.packages("jsonlite")

library(jsonlite)
users_df <- stream_in(file(user_file))
saveRDS(users_df,"users_df")
users <- readRDS("users_df")
#################
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


friends <- data.frame()
nrow(users)
library(foreach)
#library(doParallel)
number_of_processors <- detectCores()
number_of_processors

cl<-makeCluster(number_of_processors)
registerDoParallel(cl)

strt<-Sys.time()
foreach (i = 1:nrow(users)) %dopar% {
  cat(i,"")
  if (!is.na(users$friends[[i]][1])    ) {
    friends <- rbind(friends,as.data.frame(cbind(users$user_id[i],
                                                 unlist(users$friends[i]))))
  }
}
print(Sys.time()-strt)
stopCluster(cl)

write.csv(friends,paste0(url_out,"friends.csv"),row.names = FALSE)

users$friends <- NULL
users$elite <- NULL
!!!!!!!
  users$votes <- NULL
users$compliments <- NULL

write.csv(users,paste0(url_out,"users.csv"),row.names = FALSE)

sapply(users,class)


