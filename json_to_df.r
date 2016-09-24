##First Time preparation
rm(list=ls())
url <- "https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/datasets/"
business_file <- paste0(url,"yelp_academic_dataset_business.json")
checkin_file  <- paste0(url,"yelp_academic_dataset_checkin.json")
review_file   <- paste0(url,"yelp_academic_dataset_review.json")
tip_file      <- paste0(url,"yelp_academic_dataset_tip.json")
user_file     <- paste0(url,"yelp_academic_dataset_user.json")

#install.packages("jsonlite")

library(jsonlite)

businesses <- stream_in(file(business_file))
saveRDS(businesses,"./business_df")
checkins <- stream_in(file(checkin_file))
saveRDS(checkins,"./checkins_df")
reviews <- stream_in(file(review_file))
saveRDS(reviews,"./reviews_df")
tips <- stream_in(file(tip_file))
saveRDS(tips,"./tips_df")
users <- stream_in(file(user_file))
saveRDS(users,"users_df")
gc()
