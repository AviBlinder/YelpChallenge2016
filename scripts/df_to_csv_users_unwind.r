rm(list=ls())
library(doParallel)
registerDoParallel()
getDoParWorkers()

users <- readRDS("./data/users_df_part2")

rbind_fn <- function(a,b){
  rbind(a,b)
}

unwind <- function(df,col1,col2,idx){
  unwinded_column <- unlist(df[idx,col2])
  unwinded_list <- data.frame()
  unwinded_list <- data.frame(cbind(df[idx,col1],unwinded_column))
  if ( (dim(unwinded_list)[2]) == 2){  
    names(unwinded_list) <- c(col1,col2)
  } else{
    unwinded_list <- data.frame()
  }
  return (unwinded_list)
}



###
strt<-Sys.time()
friends1 <- data.frame()
for (i in 1:100000) {
  cat(i,"")
    friends1 <- rbind(friends1,unwind(users,"user_id","friends",i))  
}
print(Sys.time()-strt)
write.csv(friends1,"./data/friends1.csv",row.names = FALSE)


strt<-Sys.time()
friends2 <- data.frame()
for (i in 100001:200000) {
  cat(i,"")
    friends2 <- rbind(friends2,unwind(users,"user_id","friends",i))  
}
print(Sys.time()-strt)
write.csv(friends2,"./data/friends2.csv",row.names = FALSE)

strt<-Sys.time()
friends3 <- data.frame()
for (i in 200001:300000) {
  cat(i,"")
    friends3 <- rbind(friends3,unwind(users,"user_id","friends",i))  
}
print(Sys.time()-strt)
write.csv(friends3,"./data/friends3.csv",row.names = FALSE)

strt<-Sys.time()
friends4 <- data.frame()
for (i in 300001:400000) {
  cat(i,"")
    friends4 <- rbind(friends4,unwind(users,"user_id","friends",i))  
}
print(Sys.time()-strt)
write.csv(friends4,"./data/friends4.csv",row.names = FALSE)

strt<-Sys.time()
friends5 <- data.frame()
for (i in 400001:500000) {
  cat(i,"")
    friends5 <- rbind(friends5,unwind(users,"user_id","friends",i))  
}
print(Sys.time()-strt)
write.csv(friends5,"./data/friends5.csv",row.names = FALSE)

strt<-Sys.time()
friends6 <- data.frame()
for (i in 500001:600000) {
  cat(i,"")
    friends6 <- rbind(friends6,unwind(users,"user_id","friends",i))  
}
print(Sys.time()-strt)
write.csv(friends6,"./data/friends6.csv",row.names = FALSE)
##Time difference of 3.862903 hours

strt<-Sys.time()
friends7 <- data.frame()
for (i in 600001:nrow(users)) {
  cat(i,"")
  friends7 <- rbind(friends7,unwind(users,"user_id","friends",i))  
}
print(Sys.time()-strt)
write.csv(friends7,"./data/friends7.csv",row.names = FALSE)

strt<-Sys.time()
friends <- rbind(friends1,friends2,friends3,friends4,friends5,friends6,friends7)
write.csv(friends,"./data/friends.csv",row.names = FALSE)
strt<-Sys.time()

###################################################################################
##parallel running - part 6

strt<-Sys.time()
friends6 <- data.frame()
results <- foreach (i = 500001:600000,.combine=rbind_fn) %dopar% {
  friends6 <- rbind(friends6,unwind(users,"user_id","friends",i))  
}
print(Sys.time()-strt)
write.csv(friends6,"./data/friends6_parallel.csv",row.names = FALSE)

#########
   

registerDoSEQ()
