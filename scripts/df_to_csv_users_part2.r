rm(list=ls())
users <- readRDS("./data/users_df_part2")

#source("scripts/df_to_csv_users_unwind.r")

users$friends <- NULL
users$elite <- NULL
head(users$FriendsNumber)
head(users$EliteYearsNumber)
names(users)
sapply(users,class)
################################################################
users$votesFunny <- users$votes$funny
users$votesUseful <- users$votes$useful
users$votesCool <- users$votes$cool
users$votes <- NULL
####
rm(df1)
df1 <- sapply(users$compliments,rbind)
df2 <- data.frame(df1)
names(df2)
row.names(df2) <- NULL
dim(users);dim(df2)
users <- cbind(users,df2)
rm(df1,df2)
################################################################

users$compliments <- NULL

write.csv(users,paste0("./data/users.csv"),row.names = FALSE)




