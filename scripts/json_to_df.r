##First Time preparation
rm(list=ls())
getwd()
#url <- "https://s3-eu-west-1.amazonaws.com/yelpchallenge2016/datasets/"
url <- "D:/Yelp/dataset/"
url_out <- "D:/Yelp/r_datasets/"

business_file <- paste0(url,"yelp_academic_dataset_business.json")
checkin_file  <- paste0(url,"yelp_academic_dataset_checkin.json")
review_file   <- paste0(url,"yelp_academic_dataset_review.json")
tip_file      <- paste0(url,"yelp_academic_dataset_tip.json")
user_file     <- paste0(url,"yelp_academic_dataset_user.json")

#install.packages("jsonlite")

library(jsonlite)

businesses <- stream_in(file(business_file))
saveRDS(businesses,paste0(url_out,"business_df"))

checkins <- stream_in(file(checkin_file))
saveRDS(checkins,paste0(url_out,"checkins_df"))

reviews <- stream_in(file(review_file))
saveRDS(reviews,paste0(url_out,"reviews_df"))

tips <- stream_in(file(tip_file))
saveRDS(tips,paste0(url_out,"tips_df"))

users <- stream_in(file(user_file))
saveRDS(users,paste0(url_out,"users_df"))

gc()
