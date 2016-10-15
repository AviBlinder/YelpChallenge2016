
rm(list=ls())
users <- readRDS("./data/users_df_part2")

unwind <- function(user,idx){
  unwinded_friends <- unlist(user$friends[idx])
  if(length(unwinded_friends > 0)){
    friends_list <- data.frame()
    friends_list <- data.frame(cbind(user$user_id[idx],unwinded_friends))
    return (friends_list)
  } else{
    return (friends_list <- data.frame())
  }
}


strt<-Sys.time()
friends1 <- data.frame()
for (i in 1:100000) {
  cat(i,"")
  if ( length(users$friends[[i]]) > 0){
      friends1 <- rbind(friends1,unwind(users,i))  
  }
}
print(Sys.time()-strt)


strt<-Sys.time()
friends2 <- data.frame()
for (i in 100001:200000) {
  cat(i,"")
  if ( length(users$friends[[i]]) > 0){
    friends2 <- rbind(friends2,unwind(users,i))  
  }
}

strt<-Sys.time()
friends3 <- data.frame()
for (i in 200001:300000) {
  cat(i,"")
  if ( length(users$friends[[i]]) > 0){
    friends3 <- rbind(friends3,unwind(users,i))  
  }
}

strt<-Sys.time()
friends4 <- data.frame()
for (i in 300001:400000) {
  cat(i,"")
  if ( length(users$friends[[i]]) > 0){
    friends4 <- rbind(friends4,unwind(users,i))  
  }
}

strt<-Sys.time()
friends5 <- data.frame()
for (i in 400001:500000) {
  cat(i,"")
  if ( length(users$friends[[i]]) > 0){
    friends5 <- rbind(friends5,unwind(users,i))  
  }
}

strt<-Sys.time()
friends6 <- data.frame()
for (i in 500001:600000) {
  cat(i,"")
  if ( length(users$friends[[i]]) > 0){
    friends6 <- rbind(friends6,unwind(users,i))  
  }
}


strt<-Sys.time()
friends7 <- data.frame()
for (i in 600001:nrow(users)) {
  cat(i,"")
  if ( length(users$friends[[i]]) > 0){
    friends6 <- rbind(friends6,unwind(users,i))  
  }
}


friends <- rbind(friends1,friends2,friends3,friends4,friends5,friends6,friends7)