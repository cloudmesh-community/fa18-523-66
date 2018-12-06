library(plotly)
library(plot3Drgl)
library(rgl)
library(plot3D)
library(GGally)
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
#please change path to your own directory
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


#merge the stock data sets with Dow index dataset

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

#formulae:
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

#**********************#

#function to shift column values up or down

#testing to find previous row values
#anothertestdata <-newdataset[1:100,]

shift<-function(x,shift_by){
  stopifnot(is.numeric(shift_by))
  stopifnot(is.numeric(x))
  
  if (length(shift_by)>1)
    return(sapply(shift_by,shift, x=x))
  
  out<-NULL
  abs_shift_by=abs(shift_by)
  if (shift_by > 0 )
    out<-c(tail(x,-abs_shift_by),rep(NA,abs_shift_by))
  else if (shift_by < 0 )
    out<-c(rep(NA,abs_shift_by), head(x,-abs_shift_by))
  else
    out<-x
  out
}

#d$df_lead2<-shift(d$x,2)
#anothertestdata$prevopen <-shift(anothertestdata$Open.y,-1)

# we need the previous day Close values
newdataset$prevopen <- shift(newdataset$Open.y,-1)
newdataset$prevhigh <- shift(newdataset$High.y,-1)
newdataset$prevlow <- shift(newdataset$Low.y,-1)
newdataset$prevclose <- shift(newdataset$Close.y,-1)

#***********************#

newdataset$diffprevClose_newOpen <- newdataset$Open.y - newdataset$prevclose
newdataset$diffprevClose_newHigh <- newdataset$High.y - newdataset$prevclose
newdataset$diffprevClose_newLow <- newdataset$Low.y - newdataset$prevclose
newdataset$diffprevClose_newClose <- newdataset$Close.y - newdataset$prevclose

newdataset$diffnewOpen_newHigh <- newdataset$Open.y - newdataset$High.y
newdataset$diffnewOpen_newLow <- newdataset$Open.y - newdataset$Low.y

#***************************#

# stock performance
dow30perf <-newdataset[,c(1,20:34)]
 
p1 <- ggplot(merge1,aes(x=merge1$Date))+
  geom_line(aes(y= merge1$Close.y),color="darkblue")+
  ylab(label="StockPerformance") + xlab("Year")
p2 <- geom_line(data = merge2, aes(merge2$Date,merge2$Close.y),color="red") 
p3 <- geom_line(data = merge3, aes(merge3$Date,merge3$Close.y),color="gray")
p4 <- geom_line(data = merge4, aes(merge4$Date,merge4$Close.y),color="lightblue")
p5 <- geom_line(data = merge5, aes(merge5$Date,merge5$Close.y),color="yellow")
p6 <- geom_line(data = merge6, aes(merge6$Date,merge6$Close.y),color="orange")
p7 <- geom_line(data = merge7, aes(merge7$Date,merge7$Close.y),color="pink")
p8<- geom_line(data = merge8, aes(merge8$Date,merge8$Close.y),color="lightgreen")
p9 <- geom_line(data = merge9, aes(merge9$Date,merge9$Close.y),color="darkred")
p10 <- geom_line(data = merge10, aes(merge10$Date,merge10$Close.y),color="darkgreen")
p11 <- geom_line(data = merge11, aes(merge11$Date,merge11$Close.y),color="black")
p12 <- geom_line(data = merge12, aes(merge12$Date,merge12$Close.y),color="#33CC33")
p13<- geom_line(data = merge13, aes(merge13$Date,merge13$Close.y),color="#FFCC00")
p14 <- geom_line(data = merge14, aes(merge14$Date,merge14$Close.y),color="#FF3399")
p15<- geom_line(data = merge15, aes(merge15$Date,merge15$Close.y),color="#3300CC")
p16 <- geom_line(data = merge16, aes(merge16$Date,merge16$Close.y),color="#CCCC33")
p17 <- geom_line(data = merge17, aes(merge17$Date,merge17$Close.y),color="#CC99FF")
p18 <- geom_line(data = merge18, aes(merge18$Date,merge18$Close.y),color="#66FFCC")
p19 <- geom_line(data = merge19, aes(merge19$Date,merge19$Close.y),color="#006600")
p20 <- geom_line(data = merge20, aes(merge20$Date,merge20$Close.y),color="#FF0066")
p21 <- geom_line(data = merge21, aes(merge21$Date,merge21$Close.y),color="#FFCCFF")
p22 <- geom_line(data = merge22, aes(merge22$Date,merge22$Close.y),color="#00CCCC")
p23 <- geom_line(data = merge23, aes(merge23$Date,merge23$Close.y),color="#993300")
p24 <- geom_line(data = merge24, aes(merge24$Date,merge24$Close.y),color="#CCFF00")
p25 <- geom_line(data = merge25, aes(merge25$Date,merge25$Close.y),color="#999999")
p26 <- geom_line(data = merge26, aes(merge26$Date,merge26$Close.y),color="#0099CC")
p27 <- geom_line(data = merge27, aes(merge27$Date,merge27$Close.y),color="#00CC99")
p28 <- geom_line(data = merge28, aes(merge28$Date,merge28$Close.y),color="#000066")

p <- p1 + p2 +p3 +p4 +p5 +p6 +p7 +p8+p9 +p10+
     p11 + p12 +p13 +p14 +p15 +p16 +p17 +p18+p19+p20+
     p21 +p22 +p23 +p24 +p25 +p26 +p27+p28 
     

print(p)

#*************# 

# plot the market performance
p2 <- ggplot(DJI,aes(x=DJI$Date))+
  geom_line(aes(y= DJI$Close),color="black")+
  ylab(label="DowPerformance") + 
  xlab("Year")

#*************#  

#divide dataset into training and test

#svm
#n = nrow(mtcars)
#trainIndex = sample(1:n, size = round(0.7*n), replace=FALSE)
#train = mtcars[trainIndex ,]
#test = mtcars[-trainIndex ,]

#underperform = 0
#outperform = 1

#for model 2
dow30perf$LogStatus <- ifelse(dow30perf$status =='Underperform',0,1)

subdata <- dow30perf[,c(8:11,24,29)]

n = nrow(subdata)
#shuffle the dataset 
trainIndex <- sample(1:n, size = round(0.7*n), replace=FALSE)
subdata_train <- subdata[trainIndex ,]
subdata_test  <- subdata[-trainIndex ,]

dataset1 <- subdata_train[,c(1:4)]
dataset2 <- subdata_train$LogStatus

dataset3 <- subdata_test[,c(1:4)]
dataset4 <- subdata_test$LogStatus

#attach(subdata_train)

# for model 3

subdata2 <- dow30perf[c(2:225),c(11:14,6)]
#na.omit(subdata2)
n = nrow(subdata2)
#shuffle the dataset 
trainIndex <- sample(1:n, size = round(0.7*n), replace=FALSE)
subdata2_train <- subdata2[trainIndex ,]
subdata2_test  <- subdata2[-trainIndex ,]

dataset5 <- subdata2_train[,c(1:4)]
dataset6 <- subdata2_train$status

dataset7 <- subdata2_test[,c(1:4)]
dataset8 <- subdata2_test$status

# for model 4

subdata3 <- dow30perf[,c(15:16,6)]
#na.omit(subdata2)
n = nrow(subdata3)
#shuffle the dataset 
trainIndex <- sample(1:n, size = round(0.7*n), replace=FALSE)
subdata3_train <- subdata3[trainIndex ,]
subdata3_test  <- subdata3[-trainIndex ,]

dataset9 <- subdata3_train[,c(1:2)]
dataset10 <- subdata3_train$status

dataset11 <- subdata3_test[,c(1:2)]
dataset12 <- subdata3_test$status
#***************************#

#explore data
#correlation between variables
plot(subdata_train) #no use :P

corr1 <- ggpairs(subdata_train,aes(colour = status, alpha= 0.4))
print(corr1)

someextradataset <- dow30perf[,c(11:14,6)]
corr2 <- ggpairs(someextradataset,aes(colour = status, alpha= 0.4))
print(corr2)

someextradataset <- dow30perf[,c(15:16,6)]
corr3 <- ggpairs(someextradataset,aes(colour = status, alpha= 0.4))
print(corr3)

someextradataset <- dow30perf[,c(11:16,6)]
corr4 <- ggpairs(someextradataset,aes(colour = status, alpha= 0.4))
print(corr4)

#***************************#
# svm model-1
#linear kernel
#not recommended - hence commented
#svm_model1 <- svm(dataset1,
#                  dataset2,
#                  type = 'C-classification',
#                  kernel='linear')
#summary(svm_model1)
#
#pred1 <- predict(svm_model1,dataset1)
#system.time(pred1 <- predict(svm_model1,dataset1))
#table(pred1,dataset2)


#***************************#

#svm model-2
#radial kernel
svm_model2 <- svm(dataset1,
                  dataset2, 
                 data= subdata_train,
                 type = 'C-classification',
                 kernel ='radial')
summary(svm_model2)

pred2 <- predict(svm_model2,dataset1)
system.time(pred2 <- predict(svm_model2,dataset1))
table(pred2,dataset2)

#plot the svm
#print(svm_model2)
#plot(svm_model2,subdata_train,
#     subdata_train$High.y ~ subdata_train$Close.y,
#     slice = list(subdata_train$Open.y = 68, subdata_train$Low.y = 65))

#*****************************#

# test prediction accuracy of model against test data

test_pred1 <- predict(svm_model2,type='response',newdata = dataset3)
table(test_pred1,dataset4)

#*******************************#
#svm model-3

svm_model3 <- svm(dataset5,
                  dataset6, 
                  data= subdata2_train,
                  type = 'C-classification',
                  kernel ='radial')
summary(svm_model3)


pred3 <- predict(svm_model3,dataset5)
system.time(pred3 <- predict(svm_model3,dataset5))
table(pred3,dataset6)

#*****************************#

# test prediction accuracy of model3 against test data

test_pred3 <- predict(svm_model3,type='response',newdata = dataset7)
table(test_pred3,dataset8)

#****************************#

#svm model-4

svm_model4 <- svm(dataset9,
                  dataset10, 
                  data= subdata3_train,
                  type = 'C-classification',
                  kernel ='radial')
summary(svm_model4)


pred4 <- predict(svm_model4,dataset9)
system.time(pred4 <- predict(svm_model4,dataset9))
table(pred4,dataset10)

#*****************************#

# test prediction accuracy of model3 against test data

test_pred4 <- predict(svm_model4,type='response',newdata = dataset11)
table(test_pred4,dataset12)

#****************************#

#Check model prediction for recent data
#NOTE : USING MODEL-2

one <-read_csv("Documents/StockPredictor/TodaySummaryRpt/AAPL.csv", 
               col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
two <-read_csv("Documents/StockPredictor/TodaySummaryRpt/MMM.csv", 
               col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
three  <-read_csv("Documents/StockPredictor/TodaySummaryRpt/AXP.csv", 
                  col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
four <-read_csv("Documents/StockPredictor/TodaySummaryRpt/BA.csv", 
                col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
five <-read_csv("Documents/StockPredictor/TodaySummaryRpt/CAT.csv", 
                col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
six <-read_csv("Documents/StockPredictor/TodaySummaryRpt/CVX.csv", 
               col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
seven <-read_csv("Documents/StockPredictor/TodaySummaryRpt/CSCO.csv", 
                 col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
eight <- read_csv("Documents/StockPredictor/TodaySummaryRpt/KO.csv", 
                  col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
nine <-read_csv("Documents/StockPredictor/TodaySummaryRpt/XOM.csv", 
                col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
ten <-read_csv("Documents/StockPredictor/TodaySummaryRpt/GS.csv", 
               col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
eleven <-read_csv("Documents/StockPredictor/TodaySummaryRpt/HD.csv", 
                  col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twelve <-read_csv("Documents/StockPredictor/TodaySummaryRpt/IBM.csv", 
                  col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
thirteen <-read_csv("Documents/StockPredictor/TodaySummaryRpt/INTC.csv", 
                    col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
fourteen <-read_csv("Documents/StockPredictor/TodaySummaryRpt/JNJ.csv", 
                    col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
fifteen <-read_csv("Documents/StockPredictor/TodaySummaryRpt/JPM.csv", 
                   col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
sixteen <-read_csv("Documents/StockPredictor/TodaySummaryRpt/MCD.csv", 
                   col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
seventeen <-read_csv("Documents/StockPredictor/TodaySummaryRpt/MRK.csv", 
                     col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
eighteen <-read_csv("Documents/StockPredictor/TodaySummaryRpt/MSFT.csv", 
                    col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
nineteen <-read_csv("Documents/StockPredictor/TodaySummaryRpt/NKE.csv", 
                    col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twenty <-read_csv("Documents/StockPredictor/TodaySummaryRpt/PFE.csv", 
                  col_types = cols(Date = col_datetime(format = "%Y-%m-%d"))) 
twentyone <-read_csv("Documents/StockPredictor/TodaySummaryRpt/PG.csv", 
                     col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twentytwo <-read_csv("Documents/StockPredictor/TodaySummaryRpt/TRV.csv", 
                     col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twentythree <-read_csv("Documents/StockPredictor/TodaySummaryRpt/UNH.csv", 
                       col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twentyfour <-read_csv("Documents/StockPredictor/TodaySummaryRpt/UTX.csv", 
                      col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twentyfive <-read_csv("Documents/StockPredictor/TodaySummaryRpt/VZ.csv", 
                      col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twentysix <-read_csv("Documents/StockPredictor/TodaySummaryRpt/V.csv", 
                     col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twentyseven <-read_csv("Documents/StockPredictor/TodaySummaryRpt/WMT.csv", 
                       col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))
twentyeight <-read_csv("Documents/StockPredictor/TodaySummaryRpt/DIS.csv", 
                       col_types = cols(Date = col_datetime(format = "%Y-%m-%d")))

one<- one[1,]
two<- two[1,]
three<- three[1,]
four<- four[1,]
five<- five[1,]
six<- six[1,]
seven<- seven[1,]
eight<- eight[1,]
nine<- nine[1,]
ten<- ten[1,]
eleven<- eleven[1,]
twelve<- twelve[1,]
thirteen<- thirteen[1,]
fourteen<- fourteen[1,]
fifteen<- fifteen[1,]
sixteen<- sixteen[1,]
seventeen<- seventeen[1,]
eighteen<- eighteen[1,]
nineteen<- nineteen[1,]
twenty<- twenty[1,]
twentyone<- twentyone[1,]
twentytwo<- twentytwo[1,]
twentythree<- twentythree[1,]
twentyfour<- twentyfour[1,]
twentyfive<- twentyfive[1,]
twentysix<- twentysix[1,]
twentyseven<- twentyseven[1,]
twentyeight<- twentyeight[1,]

newdataset2 <- rbind(one,two,three,four,five,six,seven,eight,nine,
                     ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen,seventeen,
                     eighteen,nineteen,twenty,twentyone,
                     twentytwo,twentythree,twentyfour,twentyfive,
                     twentysix,twentyseven,twentyeight)

newdataset2 <- newdataset2[,c(2:5)]

test_model <- predict(svm_model2,type='response',newdata = newdataset2)
results <- rbind("AAPL","MMM","AXP","BA","CAT","CVX","CSCO","KO", "XOM","GS","HD",
          "IBM","INTC","JNJ","JPM","MCD","MRK","MSFT","NKE","PFE","PG","TRV","UNH",
          "UTX","VZ","V","WMT","DIS")
prediction <- as.factor(test_model)
results <-cbind(results,prediction)
