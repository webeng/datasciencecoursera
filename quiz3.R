myurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
z <- tempfile()
download.file(myurl,z,mode="wb")
pic <- readJpeg(z)
file.remove(z) # cleanup

download.file(fileImage, destfile = "./data/img.jpeg", method = "curl")
img <- readJPEG("img.jpeg" , TRUE)
quantile(img, probs=c(0.3,0.8))
fileURLGDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURLGDP, destfile = "./data/gdp.csv", method = "curl")
fileURLEducation <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURLEducation, destfile = "./data/education.csv", method = "curl")
gdp <- read.csv("./data/gdp.csv")
education <- read.csv("./data/education.csv")
mergedData_f = merge(gdp,education, by.x = "X", by.y="CountryCode", all=FALSE)

as.numeric(gsub(",","",mergedData_f[,c(5)]))
mergedData_f[order(-as.numeric(gsub(",","",mergedData_f[,5]))),c(1,5,11)][18,]
is.na(as.numeric(gdp[,2]))
gdp[complete.cases(gdp[,2]),]
mean(mergedData_f[mergedData_f[,12] == 'High income: nonOECD',][,c(2)])
mean(mergedData_f[mergedData_f[,12] == 'High income: OECD',][,c(2)])

library('Hmisc')
mergedData_f$gdpGroups <- cut2(mergedData_f[,5], g=5,m=38)
table(mergedData_f$gdpGroups, mergedData_f$Income.Group)