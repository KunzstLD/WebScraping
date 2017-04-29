# https://cran.r-project.org/web/packages/weatherData/weatherData.pdf
# Github of the developer: http://ram-n.github.io/weatherData/example_PWS.html

# For finding ID's:
# This txt.file can be used to find ID's: http://weather.rap.ucar.edu/surface/stations.txt
# OR go to wunderground.com, insert a station you want to get the data from and scroll down 
# to weather stations nearby
# OR use https://www.wunderground.com/wundermap?lat=46.55&lon=23.88&sat=1
# Finally you can use the getStationCode function -> only works for US (until now?)

# install.packages("weatherData")
require(weatherData)

# Check Data availability
# LRCL is code for Cluj 
checkSummarizedDataAvailability("IFLOREST2","2016-04-01","2016-06-30")

# Get summarized weather (will be returned with date stamp!)
# columns MaxTemp, MinTemp, Avg.Temp, Precip and Events were selected 
# Refer to columns via number
# Cluj  (Close to Site R)
Weather_Cluj = getSummarizedWeather("LRCL","2016-04-01","2016-06-30", opt_custom_columns =TRUE,
                                            custom_columns=c(2,3,4,20,22))

# Satu Mare (close to Site E )
Weather_SatuMare = getSummarizedWeather("LRSM","2016-04-01","2016-06-30", 
                                            station_type="id",opt_custom_columns =TRUE,
                                            custom_columns=c(2,3,4,20,22))

# Baia Mare (close to Site E)
Weather_BaiaMare =  getSummarizedWeather("LRBM","2016-04-01","2016-06-30", 
                                            station_type="id",opt_custom_columns =TRUE,
                                            custom_columns=c(2,3,4,20,22))

# Campia Turzii (close to O and P (Turda))
Weather_CampiaTurzii =  getSummarizedWeather("LRCT","2016-04-01","2016-06-30", 
                                            station_type="id",opt_custom_columns =TRUE,
                                            custom_columns=c(2,3,4,20,22))

