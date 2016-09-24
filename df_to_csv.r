rm(list=ls())
#######################################################################
cat("working on business dataset \n")
business <- readRDS("./business_df")

business$Monday_Open <- factor(business$hours$Monday$open)
business$Tuesday_Open <- factor(business$hours$Tuesday$open)
business$Tuesday_Close <- factor(business$hours$Tuesday$close)
#
business$Wednesday_Open <- factor(business$hours$Wednesday$open)
business$Wednesday_Close <- factor(business$hours$Wednesday$close)
#
business$Thursday_Open <- factor(business$hours$Thursday$open)
business$Thursday_Close <- factor(business$hours$Thursday$close)
#
business$Friday_Open <- factor(business$hours$Friday$open)
business$Friday_Close <- factor(business$hours$Friday$close)

business$Saturday_Open <- factor(business$hours$Saturday$open)
business$Saturday_Close <- factor(business$hours$Saturday$close)

business$Sunday_Open <- factor(business$hours$Sunday$open)
business$Sunday_Close <- factor(business$hours$Sunday$close)
business$hours <- NULL

###
cat1 <- c()
cat2 <- c()
cat3 <- c()
for (i in seq_along(1:length(business$categories))){
  if(is.na(business$categories[[i]][1])) {
    cat1[i] <- "NONE"
  } else {
    cat1[i] <- business$categories[[i]][1]
  }
  if(is.na(business$categories[[i]][2])) {
    cat2[i] <- "NONE"
  } else {
    cat2[i] <- business$categories[[i]][2]
  }
  if(is.na(business$categories[[i]][3])) {
    cat3[i] <- "NONE"
  } else {
    cat3[i] <- business$categories[[i]][3]
    #      cat( business$categories[[i]][j],"\n")
  }
}

business$cat1 <- cat1
business$cat2 <- cat2
business$cat3 <- cat3
business$categories <- NULL
###
nbh1 <- c()

for (i in seq_along(1:length(business$neighborhoods))){
  if(is.na(business$neighborhoods[[i]][1])) {
    nbh1[i] <- "NONE"
  } else {
    nbh1[i] <- business$neighborhoods[[i]][1]
  }
}
business$neighborhoods <- NULL
business$neighborhoods <- nbh1


# Ambience 
for (i in names(business$attributes$Ambience)) {
  cat("attribute name = ", i , "\n")
  business[,i] <- business$attributes$Ambience[,i]
  business[,i][is.na(business[,i])] <- FALSE
}
business$attributes$Ambience <- NULL

# Good_For 
for (i in names(business$attributes$Good_For )) {
  business[,i] <- business$attributes$Good_For [,i]
  business[,i][is.na(business[,i])] <- FALSE
}
business$attributes$`Good For` <- NULL

# Parking 
for (i in names(business$attributes$Parking )) {
  business[,i] <- business$attributes$Parking [,i]
  business[,i][is.na(business[,i])] <- FALSE
}
business$attributes$Parking <- NULL

# Music 
for (i in names(business$attributes$Music )) {
  business[,i] <- business$attributes$Music [,i]
  business[,i][is.na(business[,i])] <- FALSE
}
business$attributes$Music <- NULL

# Hair_Types_Specialized_In 
for (i in names(business$attributes$Hair_Types_Specialized_In )) {
  business[,i] <- business$attributes$Hair_Types_Specialized_In [,i]
  business[,i][is.na(business[,i])] <- FALSE
} 
business$attributes$`Hair Types Specialized In` <- NULL


# Dietary_Restrictions 
for (i in names(business$attributes$`Dietary Restrictions` )) {
  business[,i] <- business$attributes$`Dietary Restrictions` [,i]
  business[,i][is.na(business[,i])] <- FALSE
} 
business$attributes$`Dietary Restrictions` <- NULL


##### !!!!
for (i in names(business$attributes)) {
  cat("attribute name = ", i , "\n")
  if(class(business$attributes[,i]) == "logical"){
    business[,i] <- business$attributes[,i]
    business[,i][is.na(business[,i])] <- FALSE
  } 
  if(class(business$attributes[,i]) %in% c("integer")){
    business[,i] <- business$attributes[,i]
    business[,i][is.na(business[,i])] <- 0
  }
  
  if(class(business$attributes[,i]) %in% c("character")){
    
    #     business[,i][is.na(business[,i])] <- "Unknown"
    business[,i] <- as.factor(business$attributes[,i])
    cat("var = ", i," ",length(levels(business[,i])), "\n") 
    
  }
  
  if(class(business$attributes[,i]) %in%  c("data.frame")){
    #        cat("i = ", i , class(business$attributes[,i]) , "\n")
    for(df_name in names(business$attributes[,i])){
      #        cat("df_name =" , df_name, "\n")
      business[,df_name] <-   business$attributes[[i[df_name]]]
    }
  } 
}


business$attributes <- NULL

####
business$lon <- round(business$longitude,0)
business$lat <- round(business$latitude,0)
business$Maincity <- 0
business$Maincity <- ifelse((business$lon == 8 | business$lon == 9)
                            & business$lat == 49,
                            "Karlsruhe",business$Maincity)
business$Maincity <- ifelse(business$lon == -3 & business$lat == 56,
                            "Edinburgh",business$Maincity)
business$Maincity <- ifelse((business$lon == -73 | business$lon == -74) & 
                              (business$lat == 45 | business$lat == 46),
                            "Montreal",business$Maincity)
business$Maincity <- ifelse((business$lon == -80 | business$lon == -81) & 
                              (business$lat == 43 | business$lat == 44),
                            "Waterloo",business$Maincity)
#
business$Maincity <- ifelse(business$lon == -80 & business$lat == 40,
                            "Pittsburgh",business$Maincity)
business$Maincity <- ifelse(business$lon == -81 & business$lat == 35,
                            "Charlotte",business$Maincity)
business$Maincity <- ifelse(business$lon == -88 & business$lat == 40,
                            "Urbana-Champaign",business$Maincity)
business$Maincity <- ifelse((business$lon == -113 | business$lon == -112 | 
                               business$lon == -111) & 
                              (business$lat == 33 | business$lat == 34),
                            "Phoenix",business$Maincity)
business$Maincity <- ifelse(business$lon == -115 & business$lat == 36,
                            "Las Vegas",business$Maincity)
business$Maincity <- ifelse((business$lon == -89 | business$lon == -90) & business$lat == 43,
                            "Madison",business$Maincity)
business$Maincity <- as.factor(business$Maincity)
table(business$Maincity)



business$country <- "United States"
business$country <- ifelse(business$Maincity == "Karlsruhe","Germany",business$country)
business$country <- ifelse(business$Maincity == "Edinburgh","United Kingdom",business$country)
business$country <- ifelse(business$Maincity == "Montreal","Canada",business$country)
business$country <- ifelse(business$Maincity == "Waterloo","Canada",business$country)
business$country <- as.factor(business$country)

business$state <- as.factor(business$state)
table(business$country)

#library(xlsx)
#file_name <- "business.xlsx"
#if (file.exists(file_name))    file.remove(file_name)
#write.xlsx(business,"Yelp.xlsx",sheetName = "Business",append=FALSE ,row.names = FALSE)
write.csv(business,"business.csv",row.names = FALSE)


########################
cat("handling checkings dataset \n")
checkins    <- readRDS("./checkins_df")

sapply(business,class)
for (i in names(checkins$checkin_info) ) {
  cat("handling " , i , "class = ", class(checkins$checkin_info[,i]) , "\n" )
  i_pretty <- paste0("checkin_info_",gsub("-","_",i))
  checkins[,i_pretty] <- checkins$checkin_info [,i]
  checkins[,i_pretty][is.na(checkins[,i_pretty])] <- 0
} 
checkins$checkin_info <- NULL
write.csv(checkins,"checkings.csv",row.names = FALSE)

####
cat("handling reviews datasets \n")
reviews     <- readRDS("./reviews_df")
for (i in names(reviews$votes) ) {
  cat("handling " , i , "class = ", class(reviews$votes[,i]) , "\n" )
  i_new <- paste0("votes_",i)
  reviews[,i_new] <- reviews$votes [,i]
  reviews[,i_new][is.na(reviews[,i_new])] <- 0
} 

reviews$votes <- NULL
library(lubridate)
reviews$date <- ymd(reviews$date)
#head(reviews$text[1])

reviews_by_business_id <- data.frame(table(reviews$business_id))
names(reviews_by_business_id) <- c("business_id","Number_of_Reviews")
business <- merge(business,reviews_by_business_id,by="business_id",all.x = T)

round(prop.table(table(reviews$stars)),2)
#round(prop.table(table(business$stars,business$Maincity)),2)
cities <- as.vector(data.frame(table(business$Maincity))$Var1)
cities

props <- function(city,feature){
  cat(city[1,"Maincity"]," : ")
  round(prop.table(table(city[,feature])),2) 
  df <- data.frame(round(prop.table(table(city[,feature])),2))
  cat(sum(df[1:3,]$Freq), " ")
  cat(sum(df[4:6,]$Freq), " ")
  cat(sum(df[7:9,]$Freq), " ")
}


business_Charlotte <- subset(business,business$Maincity == "Charlotte")
business_Edinburgh <- subset(business,business$Maincity == "Edinburgh")
business_Karlsruhe <- subset(business,business$Maincity == "Karlsruhe")
business_LasVegas <- subset(business,business$Maincity == "Las Vegas")
business_Madison <- subset(business,business$Maincity == "Madison")
business_Montreal <- subset(business,business$Maincity == "Montreal")
business_Phoenix <- subset(business,business$Maincity == "Phoenix")
business_Pittsburgh <- subset(business,business$Maincity == "Pittsburgh")
business_Urbana_Champaign <- subset(business,business$Maincity == "Urbana-Champaign")
business_Waterloo <- subset(business,business$Maincity == "Waterloo")

props(business_Charlotte,"stars")
props(business_Edinburgh,"stars")
props(business_Karlsruhe,"stars")
props(business_LasVegas,"stars")
props(business_Madison,"stars")
props(business_Montreal,"stars")
props(business_Phoenix,"stars")
props(business_Pittsburgh,"stars")
props(business_Urbana_Champaign,"stars")
props(business_Waterloo,"stars")

short_business <- business[,c("business_id","Maincity","stars")]
names(short_business) <- c("business_id","Maincity","business_stars")
reviews <- merge(reviews,short_business,all.x = T,by="business_id")

reviews_Charlotte <- subset(reviews,reviews$Maincity == "Charlotte")
reviews_Edinburgh <- subset(reviews,reviews$Maincity == "Edinburgh")
reviews_Karlsruhe <- subset(reviews,reviews$Maincity == "Karlsruhe")
reviews_LasVegas <- subset(reviews,reviews$Maincity == "Las Vegas")
reviews_Madison <- subset(reviews,reviews$Maincity == "Madison")
reviews_Montreal <- subset(reviews,reviews$Maincity == "Montreal")
reviews_Phoenix <- subset(reviews,reviews$Maincity == "Phoenix")
reviews_Pittsburgh <- subset(reviews,reviews$Maincity == "Pittsburgh")
reviews_Urbana_Champaign <- subset(reviews,reviews$Maincity == "Urbana-Champaign")
reviews_Waterloo <- subset(reviews,reviews$Maincity == "Waterloo")

props(reviews_Charlotte[year(reviews_Charlotte$date)==2015,],"business_stars")
props(reviews_Charlotte[year(reviews_Charlotte$date)==2014,],"business_stars")
props(reviews_Charlotte[year(reviews_Charlotte$date)==2013,],"business_stars")
props(reviews_Charlotte[year(reviews_Charlotte$date)==2012,],"business_stars")
props(reviews_Charlotte[year(reviews_Charlotte$date)==2011,],"business_stars")
props(reviews_Edinburgh,"business_stars")
props(reviews_Karlsruhe,"business_stars")
props(reviews_LasVegas,"business_stars")
props(reviews_Madison,"business_stars")
props(reviews_Montreal,"business_stars")
props(reviews_Phoenix,"business_stars")
props(reviews_Pittsburgh,"business_stars")
props(reviews_Urbana_Champaign,"business_stars")
props(reviews_Waterloo,"business_stars")

write.csv(reviews,"reviews.csv",row.names = FALSE)


#####################################################################################
cat("working on tips dataset \n")
tips        <- readRDS("./tips_df")
tips$date <- ymd(tips$date)
write.csv(tips,"tips.csv",row.names = FALSE)


cat("working on userss dataset \n")
users       <- readRDS("./users_df")
sapply(users$compliments,class)

friends <- data.frame()
tail(friends)

for (i in 1:nrow(users)) {
  if (!is.na(users$friends[[i]][1])    ) {
    friends <- rbind(friends,as.data.frame(cbind(users$user_id[i],
                                                 unlist(users$friends[i]))))
  }
}


###############End of Datasets Cleanup ###############################################
