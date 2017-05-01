### See R Bloggers! use fread, then loop over the date!
# https://www.r-bloggers.com/getting-data-from-an-online-source/
# Here I scrap daily historic data from wunderground.com for the city Cluj (Romania)
require(data.table)
# X = fread("http://www.wunderground.com/history/airport/KMDW/2017/04/27/DailyHistory.html?HideSpecis=1&format=1")


### There is a general pattern how the URL's of wunderground are created (URL's to Comma deliminated file for Weather data of every day)
# Here the example is for the Weather station in Cluj, from 1. April until 30. June
# baseURL + date + suffixURL
baseURL = "http://www.wunderground.com/history/airport/LRCL"
# for another state change the ID (last for letters of the baseURL, ID's can be found on the wunderground.com website)
suffixURL= "DailyHistory.html?HideSpecis=1&format=1"

# Creating a datestring with all the dates we want 
days <- seq(from=as.Date('2016/04/01'), to=as.Date('2016/06/30'),by='days' )
datestring = format(days,"%Y/%m/%d/")

# Getting all the links we want and store them in a list 
links=lapply(datestring, function(x) paste(baseURL, x, suffixURL, sep='/')) 

# Getting the Data!
Data = lapply(links, function(x) fread(x,header=TRUE))
head(Data, n=2L)

# Turning List into data.table!
Data_Cluj = rbindlist(Data,use.names=TRUE,fill=TRUE)
head(Data_Cluj,n=3L)
names(Data_Cluj)[14] <- 'DateUTC'
Data_Cluj$DateUTC <- gsub('(.+)(<br />)', '\\1', Data_Cluj$DateUTC)
# write as csv
write.csv(Data_Cluj, file="D:/Studium/Documents/Weather data/Data_Cluj.csv")

# reload 
Data_Cluj = fread("D:/Studium/Documents/Weather data/Data_Cluj.csv")

# To do: 
# polish table:remove V1, convert DateUTC.. column or add days as a new column

