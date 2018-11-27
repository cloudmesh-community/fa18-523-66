library(zoo)
library(utils)
library(tibble)
library(stats)
library(sciplot)
library(scatterplot3d)
library(rlang)
library(reshape2)
library(readr)
library(plogr)
library(methods)
library(lattice)
library(grDevices)
library(graphics)
library(ggplot2)
library(foreign)
library(e1071)
library(dplyr)
library(DescTools)
library(datasets)
library(data.table)
library(curl)
library(crayon)
library(cluster)
library(caret)
library(carData)
library(car)
library(boot)
library(bindr)


f1 = list("MMM","AXP","AAPL","BA","CAT","CVX","CSCO","KO", "XOM","GS","HD",
      "IBM","INTC","JNJ","JPM","MCD","MRK","NKE","PFE","PG","TRV","UNH","UTX",
      "VZ","V","WMT","DIS","MSFT")

#read data
DJI <- read_csv("/Users/Sanjay/Documents/StockPredictor/DJI.csv", 
                col_types = cols(Date = col_date(format = "%Y-%m-%d")))
MMM <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/MMM.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d"))) 
AXP <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/AXP.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
AAPL <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/AAPL.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
BA <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/BA.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
CAT <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/CAT.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
CVX <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/CVX.csv", 
                col_types = cols(Date = col_date(format = "%Y-%m-%d")))
CSCO <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/CSCO.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
KO <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/KO.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
XOM <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/XOM.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
GS <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/GS.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
HD <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/HD.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
IBM <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/IBM.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
INTC <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/INTC.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
JNJ <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/JNJ.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
JPM <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/JPM.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
MCD <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/MCD.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
MRK <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/MRK.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
NKE <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/NKE.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
PFE <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/PFE.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
PG <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/PG.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
TRV <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/TRV.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
UNH <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/UNH.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
UTX <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/UTX.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
VZ <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/VZ.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
V <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/V.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
WMT <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/WMT.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
DIS <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/DIS.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))
MSFT <- read_csv("/Users/Sanjay/Documents/StockPredictor/HistoricData/MSFT.csv", 
                 col_types = cols(Date = col_date(format = "%Y-%m-%d")))

#HistDowData <- data.frame("ticker","day","openprice","volume","dowindex")
# create empty df to store historical data of all stocks
HistDowData <- data.frame(matrix(ncol=5,nrow=0))
x <- c("ticker","date","openprice","volume","dowindex")
colnames(HistDowData) <- x

f1 = list("MMM","AXP","AAPL","BA","CAT","CVX","CSCO","KO", "XOM","GS","HD",
          "IBM","INTC","JNJ","JPM","MCD","MRK","NKE","PFE","PG","TRV","UNH","UTX",
          "VZ","V","WMT","DIS","MSFT")

MMM$ticker <- "MMM"
AXP$ticker <- "AXP"
AAPL$ticker <- "AAPL"
BA$ticker <- "BA"
CAT$ticker <- "CAT"
CVX$ticker <- "CVX"
CSCO$ticker <- "CSCO"
KO$ticker <- "KO"
XOM$ticker <- "XOM"
GS$ticker <- "GS"
HD$ticker <- "HD"
IBM$ticker <- "IBM"
INTC$ticker <- "INTC"
JNJ$ticker <- "JNJ"
JPM$ticker <- "JPM"
MCD$ticker <- "MCD"
MRK$ticker <- "MRK"
NKE$ticker <- "NKE"
PFE$ticker <- "PFE"  
PG$ticker <- "PG"
TRV$ticker <- "TRV"
UNH$ticker <- "UNH"
UTX$ticker <- "UTX"
VZ$ticker <- "VZ"
V$ticker <- "V"
WMT$ticker <- "WMT"
DIS$ticker <- "DIS"
MSFT$ticker <- "MSFT"

#HistDowData <- data.frame("ticker","day","openprice","volume","dowindex")
# create empty df to store historical data of all stocks
HistDowData <- data.frame(matrix(ncol=5,nrow=0))
x <- c("ticker","date","openprice","volume","dowindex")
colnames(HistDowData) <- x

merge1 <- merge(x=DJI, y=MMM, by = "Date")
merge2 <- merge(x=DJI, y=AXP, by = "Date")
merge3 <- merge(x=DJI, y=AAPL, by = "Date")
merge4 <- merge(x=DJI, y=BA, by = "Date")
merge5 <- merge(x=DJI, y=CAT, by = "Date")
merge6 <- merge(x=DJI, y=CVX, by = "Date")
merge7 <- merge(x=DJI, y=CSCO, by = "Date")
merge8 <- merge(x=DJI, y=KO, by = "Date")
merge9 <- merge(x=DJI, y=XOM, by = "Date")
merge10 <- merge(x=DJI, y=GS, by = "Date")


merge11 <- merge(x=DJI, y=HD, by = "Date")
merge12 <- merge(x=DJI, y=IBM, by = "Date")
merge13 <- merge(x=DJI, y=INTC, by = "Date")
merge14 <- merge(x=DJI, y=JNJ, by = "Date")
merge15 <- merge(x=DJI, y=JPM, by = "Date")
merge16 <- merge(x=DJI, y=MCD, by = "Date")
merge17 <- merge(x=DJI, y=MRK, by = "Date")
merge18 <- merge(x=DJI, y=NKE, by = "Date")
merge19 <- merge(x=DJI, y=PFE, by = "Date")
merge20 <- merge(x=DJI, y=PG, by = "Date")


merge21 <- merge(x=DJI, y=TRV, by = "Date")
merge22 <- merge(x=DJI, y=UNH, by = "Date")
merge23 <- merge(x=DJI, y=UTX, by = "Date")
merge24 <- merge(x=DJI, y=VZ, by = "Date")
merge25 <- merge(x=DJI, y=V, by = "Date")
merge26 <- merge(x=DJI, y=WMT, by = "Date")
merge27 <- merge(x=DJI, y=DIS, by = "Date")
merge28 <- merge(x=DJI, y=MSFT, by = "Date")

#stock_p_change = ((row['Open'] - starting_stock_value) / starting_stock_value) * 100
#dow30_p_change = ((dow30_value - starting_dow30_value) / starting_dow30_value) * 100

#mergetest <- merge1
#mergetest$stock_p_change <- ((mergetest$Open.y - mergetest[1,8])/mergetest[1,8])*100

merge1$stock_p_change <- ((merge1$Open.y - merge1[1,8])/merge1[1,8])*100
merge2$stock_p_change <- ((merge2$Open.y - merge2[1,8])/merge2[1,8])*100
merge3$stock_p_change <- ((merge3$Open.y - merge3[1,8])/merge3[1,8])*100
merge4$stock_p_change <- ((merge4$Open.y - merge4[1,8])/merge4[1,8])*100
merge5$stock_p_change <- ((merge5$Open.y - merge5[1,8])/merge5[1,8])*100
merge6$stock_p_change <- ((merge6$Open.y - merge6[1,8])/merge6[1,8])*100
merge7$stock_p_change <- ((merge7$Open.y - merge7[1,8])/merge7[1,8])*100
merge8$stock_p_change <- ((merge8$Open.y - merge8[1,8])/merge8[1,8])*100
merge9$stock_p_change <- ((merge9$Open.y - merge9[1,8])/merge9[1,8])*100
merge10$stock_p_change <- ((merge10$Open.y - merge10[1,8])/merge10[1,8])*100


merge11$stock_p_change <- ((merge11$Open.y - merge11[1,8])/merge11[1,8])*100
merge12$stock_p_change <- ((merge12$Open.y - merge12[1,8])/merge12[1,8])*100
merge13$stock_p_change <- ((merge13$Open.y - merge13[1,8])/merge13[1,8])*100
merge14$stock_p_change <- ((merge14$Open.y - merge14[1,8])/merge14[1,8])*100
merge15$stock_p_change <- ((merge15$Open.y - merge15[1,8])/merge15[1,8])*100
merge16$stock_p_change <- ((merge16$Open.y - merge16[1,8])/merge16[1,8])*100
merge17$stock_p_change <- ((merge17$Open.y - merge17[1,8])/merge17[1,8])*100
merge18$stock_p_change <- ((merge18$Open.y - merge18[1,8])/merge18[1,8])*100
merge19$stock_p_change <- ((merge19$Open.y - merge19[1,8])/merge19[1,8])*100
merge20$stock_p_change <- ((merge20$Open.y - merge20[1,8])/merge20[1,8])*100


merge21$stock_p_change <- ((merge21$Open.y - merge21[1,8])/merge21[1,8])*100
merge22$stock_p_change <- ((merge22$Open.y - merge22[1,8])/merge22[1,8])*100
merge23$stock_p_change <- ((merge23$Open.y - merge23[1,8])/merge23[1,8])*100
merge24$stock_p_change <- ((merge24$Open.y - merge24[1,8])/merge24[1,8])*100
merge25$stock_p_change <- ((merge25$Open.y - merge25[1,8])/merge25[1,8])*100
merge26$stock_p_change <- ((merge26$Open.y - merge26[1,8])/merge26[1,8])*100
merge27$stock_p_change <- ((merge27$Open.y - merge27[1,8])/merge27[1,8])*100
merge28$stock_p_change <- ((merge28$Open.y - merge28[1,8])/merge28[1,8])*100


#mergetest <- merge1
#mergetest$dow_p_change <- ((mergetest$`Adj Close` - mergetest[1,6])/mergetest[1,6])*100

merge1$dow_p_change <- ((merge1$`Adj Close` - merge1[1,6])/merge1[1,6])*100
merge2$dow_p_change <- ((merge2$`Adj Close` - merge2[1,6])/merge2[1,6])*100
merge3$dow_p_change <- ((merge3$`Adj Close` - merge3[1,6])/merge3[1,6])*100
merge4$dow_p_change <- ((merge4$`Adj Close` - merge4[1,6])/merge4[1,6])*100
merge5$dow_p_change <- ((merge5$`Adj Close` - merge5[1,6])/merge5[1,6])*100
merge6$dow_p_change <- ((merge6$`Adj Close` - merge6[1,6])/merge6[1,6])*100
merge7$dow_p_change <- ((merge7$`Adj Close` - merge7[1,6])/merge7[1,6])*100
merge8$dow_p_change <- ((merge8$`Adj Close` - merge8[1,6])/merge8[1,6])*100
merge9$dow_p_change <- ((merge9$`Adj Close` - merge9[1,6])/merge9[1,6])*100
merge10$dow_p_change <- ((merge10$`Adj Close` - merge10[1,6])/merge10[1,6])*100


merge11$dow_p_change <- ((merge11$`Adj Close` - merge11[1,6])/merge11[1,6])*100
merge12$dow_p_change <- ((merge12$`Adj Close` - merge12[1,6])/merge12[1,6])*100
merge13$dow_p_change <- ((merge13$`Adj Close` - merge13[1,6])/merge13[1,6])*100
merge14$dow_p_change <- ((merge14$`Adj Close` - merge14[1,6])/merge14[1,6])*100
merge15$dow_p_change <- ((merge15$`Adj Close` - merge15[1,6])/merge15[1,6])*100
merge16$dow_p_change <- ((merge16$`Adj Close` - merge16[1,6])/merge16[1,6])*100
merge17$dow_p_change <- ((merge17$`Adj Close` - merge17[1,6])/merge17[1,6])*100
merge18$dow_p_change <- ((merge18$`Adj Close` - merge18[1,6])/merge18[1,6])*100
merge19$dow_p_change <- ((merge19$`Adj Close` - merge19[1,6])/merge19[1,6])*100
merge20$dow_p_change <- ((merge20$`Adj Close` - merge20[1,6])/merge20[1,6])*100


merge21$dow_p_change <- ((merge21$`Adj Close` - merge21[1,6])/merge21[1,6])*100
merge22$dow_p_change <- ((merge22$`Adj Close` - merge22[1,6])/merge22[1,6])*100
merge23$dow_p_change <- ((merge23$`Adj Close` - merge23[1,6])/merge23[1,6])*100
merge24$dow_p_change <- ((merge24$`Adj Close` - merge24[1,6])/merge24[1,6])*100
merge25$dow_p_change <- ((merge25$`Adj Close` - merge25[1,6])/merge25[1,6])*100
merge26$dow_p_change <- ((merge26$`Adj Close` - merge26[1,6])/merge26[1,6])*100
merge27$dow_p_change <- ((merge27$`Adj Close` - merge27[1,6])/merge27[1,6])*100
merge28$dow_p_change <- ((merge28$`Adj Close` - merge28[1,6])/merge28[1,6])*100



newdataset <- rbind(merge1,merge2,merge3,merge4,merge5,merge6,merge7,merge8,
                    merge9,merge10,merge11,merge12,merge13,merge14,merge15,merge16,
                    merge17,merge18,merge19,merge20,merge21,merge22,merge23,merge24,
                    merge25,merge26,merge27,merge28)


#underperform = 0
#outperform = 1

newdataset$difference <- newdataset$stock_p_change-newdataset$dow_p_change
newdataset$status <- ifelse(newdataset$difference > 0,'Outperform','Underperform')
dow30perf <-newdataset


#***************************#

# plot the market performance
ggplot(newdataset,aes(x=newdataset$Date),group = newdataset$ticker,col=newdataset$ticker)+
  geom_line(aes(y= newdataset$difference))+
  ylab(label="Performance") + 
  xlab("Date")
  
#scatter plot 
scatterplot3d(
  dow30perf[,8:11],pch = 19, color = "blue",
  grid = TRUE, box = TRUE,
  mar = c(3,3,0.5,3)
)


#svm
#n = nrow(mtcars)
#trainIndex = sample(1:n, size = round(0.7*n), replace=FALSE)
#train = mtcars[trainIndex ,]
#test = mtcars[-trainIndex ,]


subdata <- dow30perf[,c(8:11,24)]
n = nrow(subdata)
trainIndex <- sample(1:n, size = round(0.7*n), replace=FALSE)
subdata_train <- subdata[trainIndex ,]
subdata_test  <- subdata[-trainIndex ,]

dataset1 <- subdata_train[,c(1:4)]
dataset2 <- subdata_train$status

dataset3 <- subdata_test[,c(1:4)]
dataset4 <- subdata_test$status

attach(subdata_train)

#***************************#

# svm model-1
svm_model1 <- svm(dataset1,
                  dataset2,
                  type = 'C-classification',
                  kernel='linear')
summary(svm_model1)

pred1 <- predict(svm_model1,dataset1)
system.time(pred1 <- predict(svm_model1,dataset1))
table(pred1,dataset2)


#***************************#

#svm model-2

svm_model2 <- svm(dataset1,
                  dataset2, 
                 data= subdata_train,
                 type = 'C-classification',
                 kernel ='radial')
summary(svm_model2)

pred2 <- predict(svm_model2,dataset1)
system.time(pred2 <- predict(svm_model2,dataset1))
table(pred2,dataset2)

#*****************************#

#tune model-2

#svm_tune <- tune(svm_model2, train.x=dataset1, train.y=dataset2, 
#                 kernel="radial", ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))
#*****************************#

# test prediction accuracy of model against test data

test_pred1 <- predict(svm_model2,type='response',newdata = dataset3)
table(test_pred1,dataset4)
