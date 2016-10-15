rm(list=ls())
users <- readRDS("./data/users_df_part2")

friends <- data.frame()
nrow(users)

strt<-Sys.time()
for (i in 1:nrow(users)) {
  cat(i,"")
     if (!is.na(users$friends[[i]][1])    ) {
       friends <- rbind(friends,as.data.frame(cbind(users$user_id[i],
                                                 unlist(users$friends[i]))))
     }
}

print(Sys.time()-strt)

write.csv(friends,paste0(url_out,"./data/friends.csv"),row.names = FALSE)

users$friends <- NULL
users$elite <- NULL
!!!!!!!
users$votes <- NULL
users$compliments <- NULL

write.csv(users,paste0("./data/users.csv"),row.names = FALSE)

sapply(users,class)


