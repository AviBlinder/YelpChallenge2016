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

reviews_Charlotte <- subset(reviews,reviews$Maincity == "Charlotte")0
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
