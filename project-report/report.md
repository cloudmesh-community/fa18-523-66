# Do I buy or sell? - Using Big Data to predict Stock Performance

| Ritu Susan Sanjay   
| rssanjay@iu.edu
| Indiana University, Bloomington
| hid : fa18-523-66
| github: [:cloud:](https://github.com/cloudmesh-community/fa18-523-66/blob/master/project-report/report.md)
| code: [:cloud:](https://github.com/cloudmesh-community/fa18-523-66/tree/master/project-code)

---

Keywords

Stock performance prediction, SciPy, Numpy, Pandas, Python, R, Classification, Support Vector Machine, Quandl, Supervised Learning, Dow Jones

---


## Abstract

Big data is everywhere. Newspapers and magazines are teeming with details on how Company A implemented the perfect business plan or how XYZ pharmaceuticals developed the drug to reverse some previously uncurable disease. Better still is the internet with more resources to utilize big data. Numerous copies of books have been published on this topic and Forbes rates big data related jobs as the most desirable. Every single industry today has finally turned its attentions to better understanding how to use data to serve customers better and reap profits. In light of this, there are two industries which have the most to benefit from data science : a) the finance and investment industry and b) the medical industry. This paper focuses on how big data can be used to predict the performance of stocks against the market. 


## Introduction

The financial sector is deemed to be one of the largest producers of data - roughly 2.5 quantillion bytes everyday[@www-world-data]. However, many reports state how the investment sector could always make better use of their massive databank. Analytics
has been widely adopted in the financial services industry and has helped traders make better decisions and thus see more
favorable returns.

> "Algorithmic trading now uses a great deal of historical data in conjunction with big data and complex mathematical formulas > to help investors maximize the returns in their investment portfolios" [@www-bigdata-for-finance].

In years past, traders and banks made decisions based on market trends and calculated risks on each investment. Today, however, they are at an advantage : computers can do the same things, only it is done on a massive scale and is far more accurate. The algorithm developed makes use of the vast amout of resources it has at its disposal. The accuracy of the predictions made by a computer depend on the input data i.e. the closer the data is to the real-time the more accurate its analysis of the current market. In his book, Our Final Invention, author James Barrat mentions that, if humans are ready to tackle AI and develop it to the ultimate Artificial Super Intelligence, then the Wall Street might be the first place to look for such an advancement [@book-our-final-invention]. Coming back to the point made earlier : the banking and investment sector holds some very promising advancements for data science and artificial intelligence. 

> "It was not at all what the experts predicted. most of them did not forsee that an economic powerhouse could suffer so much > damage in such a short  period of time. They did not expect the fast-growing gross domestic product (GDP) to go so 
> spectacularly into reverse, the real estate bubble to burst as violently as it did, and industrial production and capacity 
> utilization to fall so steeply. Nor did they expect the stock market to plunge so dramatically from ita all-time high- 
> although it would recover some ground subsequently....But the real issue is not what has happened, but what happens next" [@book-accelerating-out-of-the-great-depression].

On this note, it is then necessary to state that the stock prediction can be a very tempting prospect for most data scientists. The financial market has a very short feedback cycle and hence quick validation of predictions is possible. However, it is extremely difficult to develop a model that can provide higher levels of accuracy in most of its predictions. It is very much possible that the model developed would make predictions for a maximum of one day after which you might have to revamp it all over again [@www-python-stock-pred]. Nonetheless, this paper will attempt to develop a model that predicts the trends for stock prices over time.

## Implementation


### Data

Knowledge Discovery of Databases is the sequential process of transforming raw data into actionable insights [@book-intro-data-mining]. The most important step in the KDD lifecycle is: preprocessing the data. A model applied to a dataset is only as good as the data it is applied to. In this regard, most times raw data is available in the most crude formats, with noise, duplicates, missing values or at times even necessiate parsing of large webpages and documents.

Data for this project was derived from Quandl and Yahoo Finance. The stocks considered are those listed on the Dow Jones Index: 3M (MMM), American Express (AXP), Apple (AAPL), Boeing (BA), Caterpillar (CAT), Chevron (CVX), Cisco (CSCO), Coca-Cola (KO), DowDuPont Inc (DWDP), Exxon Mobil (XOM), Goldman Sachs (GS), Home Depot (HD), IBM (IBM), Intel (INTC), Johnson & Johnson (JNJ), JPMorgan Chase (JPM), McDonald's (MCD), Merck (MRK), Microsoft (MSFT), Nike (NKE), Pfizer (PFE), Procter & Gamble (PG), Travelers Companies Inc (TRV), United Health (UNH), United Technologies (UTX), Verizon (VZ), Visa (V), Walmart (WMT), Walgreens Boots Alliance (WBA), Walt Disney (DIS) [@www-cnn-money]. 

The historical for the stocks are available to be downloaded via an API on Quandl. The Quandl platform makes it easy to download financial and alternative data for analysis [@www-quandl]. A python script can easily donload allthe historical data for the companies in the Dow index. However, some datasets are only available to premium users; data for both Walgreens Boots Alliance (WBA) and DowDuPont Inc (DWDP) are available for a small fee. The data descriptions for the 30 datasets is as follows [@www-quandl-desc]:

* Date - date in YYYY-MM-DD format
* Open - opening price of stock in dollars
* High - highest price for day in dollars
* Low - lowest price for day in dollars
* Close - closing price for day in dollars
* Volume - volume of traded stocks
* Dividend - unadjusted dividend on any ex-dividend date else 0.0
* Split - shows any split on a the given day else 1.0
* Adj_Open - adjusted (for splits and dividends) using the CRSP 
* Adj_High - adjusted (for splits and dividends) using the CRSP 
* Adj_Low - adjusted (for splits and dividends) using the CRSP 
* Adj_Close - adjusted (for splits and dividends) using the CRSP 
* Adj_Volume - adjusted (for splits and dividends) using the CRSP 

The historical data for the DJIA needs to be downloaded manually from yahoo finance. The dataset description for the same is as follows:

* Date - date in YYYY-MM-DD format
* Open - opening price of stock in dollars
* High - highest price for day in dollars
* Low - lowest price for day in dollars
* Close - closing price for day in dollars
* Volume - volume of traded stocks
* Adj_Close - adjusted to include any influential corporate actions and distributions

The final dataset required is the given day's data about the stock. This can be available in one of two ways: parsing the Yahoo Finance website for each stock or by parsing the CNN Business website for a complete summary table for all the stocks. Both methods are implemented via python scripts and the pandas toolkit. To parse the Yahoo Finance website for data, the first step involved is to download static files of the html pages. Then it is a simple case of parsing the HTML documents. The similar process can be followed to downloas the summary statistics from the CNN website.

Note that it is also possible to download historical data from the  U.S. Securities and Exchange Commission (SEC) website if quandl is not preferred [@www-sec].

### Design

The data is obtained and compiled with python scripts. R code is then used to mine this data. The goal of this project is to figure out whether a stock is underperforming or outperforming. This being a classification problem, the support vector machine algorithm was used.

#### Data Visualization

+@fig:DJIPerformance shows the trend changes on the DOW index over the past three decades.

![DJI Performance [@image-dji-hist-perf]](images/DowHistoricalPerformance.png){#fig:DJIPerformance}

+@fig:StockPerformance shows the trend changes in the twenty-eight stocks over thirty years.

![Stock Performance [@image-stock-hist-perf]](images/StockHistPerf.png){#fig:StockPerformance}



This project attempts to formulate a model that predicts whether a model underperforms or outperforms the market. Four main factors of a stock are taken into consideration: the Open, High, Low and Close values of any particular day. However, it is unclear whether, it would be beneficial to use the present day's values or the changes in the four factors from the previous day's close. Therefore, two models have been proposed: the first model uses the four factors as they were, while the second model determines the differece from the previous day.

But first it is always advantageous to determine the relationship between the data variables to check if there could be the possibility of another model with greater predicion accuracy.


+@fig:DataCorrelation1 shows the correlation between the open, low, high and close variables. As is obvious, there appears to be a very high correlation between all four variables as would be expected.

![Data Correlation 1 [@image-data-correlation-1]](images/dataExplore.png){#fig:DataCorrelation1}

+@fig:DataCorrelation2 shows the correlation between the previous day close with the day's open, low, high and close variables. As in the above case, we observe a high correlation between the features 

![Data Correlation 2 [@image-data-correlation-2]](images/dataExplore2.png){#fig:DataCorrelation2}


In order to make sure all possibilities for the said model have been considered, another relationship was considered. Over the net quite a number of traders rave about the OHL technique. Note that this strategy is only to be used for intraday trading and not for long term analysis. However, it would be interesting to determine whether this strategy would provide the desired results. the strategy has two basic rules and only three of the factors from the originally proposed model are used: Open, Low and High. The first step would be to find the difference between the Open and Low (diff1) , and the Open and High (diff2). If diff1 is greater than diff2 then it indicates a downward trend, while if diff2 is greter than diff1 then it indicates an upward trend. As such inorder to visualize the data, we check its correlation matrix [@www-OHL-strategy].  +@fig:DataCorrelation3 shows the correlation between the day's open and the low and high variables.

![Data Correlation 3 [@image-data-correlation-3]](images/dataExplore3.png){#fig:DataCorrelation3}

It is interesting to note that there is little to no correlation between the two variables. Statisticians regularily comment how it is always ideal to choose features which are independent of each other or in other words have no correlation between them. More details about this proposition may only be gauged by building an svm model.

#### Support Vector Machine

> "The SVM learning problem can be formulated as a convex optimization problem, in which efficient algorithms are available to > find the global minimum of the objective function. SVM performs capacity control by maximizing the margin of the decision 
> boundry. Nevertheless, the user must still provide other parameters such as the type of kernel function to use and the cost > function C for introducing each slack variable" [@book-intro-data-mining].

Support Vector Machines are most suitable when there are a large number of features and the numeber of rows in the training data is quite large. It is usually considered the best model in situations where there is high sparcity or problems where the number of zero values among the features is high. Furthermore, using the kernal trick ensures optimization of algorithms and problems [@www-svm-machine-learning].

##### Model Fitting

Choosing the right kernel can prove to be tedious, give the nature of the data. Radial kernal was chosen for all three models as it includes the most important feature : being a stationary kernel. The kernal is also smooth, and therefore a visual representation is arsthetic in nature.


###### Model-1: Using Open,Low, High and Close
+@fig:svmModel2Summary shows the summary after applying the svm model-2 to the training dataset.

![SVM Model2 Summary [@image-svm-model2-summary]](images/svmModel2_summary.png){#fig:svmModel2Summary}


+@fig:svmModel2ConfMat is the confusion matrix generated by the code for the svm model-2.

![SVM Model2 CM [@image-svm-model2-conf-matx]](images/svmModel2_CM.png){#fig:svmModel2ConfMat}


+@fig:svmModel2TestPred shows the confusion matrix from applying the model to the test data.

![SVM Model2 Test Pred [@image-svm-model2-test-pred]](images/svmModel2TestPred.png){#fig:svmModel2TestPred}


###### Model-2: Using difference between previous day Close and present day Open,Low, High and Close values

+@fig:svmModel3Summary shows the summary after applying the svm model-3 to the training dataset.

![SVM Model3 Summary [@image-svm-model3-summary]](images/svmModel3_summary.png){#fig:svmModel3Summary}


+@fig:svmModel3ConfMat is the confusion matrix generated by the code for the svm model-3.

![SVM Model3 CM [@image-svm-model3-conf-matx]](images/svmModel3_CM.png){#fig:svmModel3ConfMat}


+@fig:svmModel3TestPred shows the confusion matrix from applying the model to the test data.

![SVM Model3 Test Pred [@image-svm-model3-test-pred]](images/svmModel3TestPred.png){#fig:svmModel3TestPred}


###### Model-3: Using OHL strategy

+@fig:svmModel4Summary shows the summary after applying the svm model-4 to the training dataset.

![SVM Model4 Summary [@image-svm-model4-summary]](images/svmModel4_summary.png){#fig:svmModel4Summary}


+@fig:svmModel4ConfMat is the confusion matrix generated by the code for the svm model-4.

![SVM Model4 CM [@image-svm-model4-conf-matx]](images/svmModel4_CM.png){#fig:svmModel4ConfMat}


+@fig:svmModel4TestPred shows the confusion matrix from applying the model to the test data.

![SVM Model4 Test Pred [@image-svm-model4-test-pred]](images/svmModel4TestPred.png){#fig:svmModel4TestPred}


###### Model Comparision

+@fig:ModelPerformance shows the model performance rates for both models.

![SVM Model Performance [@image-svm-model-perf]](images/ModelPerformance.JPG){#fig:ModelPerformance}

In order to evalute the better model from among the three, the performance features (namely, accuracy rate, error rate, true positive rate, false positive rate, specificity, precision and prevalence) have been calculated. Interestingly, the difference in the rates of all three models is quite negligible. However, considering how the Open, Low , High and Close variables are frequently used for predictions, then Model-2 would be the best possible fit for the data.

## Results

+@fig:Results shows the results for the prediction on recent data.

![SVM Model Results [@image-svm-model-results]](images/results.png){#fig:Results}

Note that the the values '2' and '1' have been used to represent 'Underperform' and 'Outperform' respectively.
The results shown above indicate that out of all the twenty-eight stocks in the list, only model predicts that only United Health Group (UNH) is expected to outperform the market. Checking the news coverage and media for UNH performance yields that it has indeed been outperforming the market.

The reason for there being a difference in predictions between the real-world and the project model may be attribute dthe various features that have not been considered for the model. Features such as total debt-to-equity ratio, market cap, volume etc. would provide better prediction. Also, many internal financial factors have not been considered like the financial reports realeased by each company. Thus, this model proves that it can be quite challenging (but quite possible) to create a model which predicts the performance of the companies in accordance with the market changes. Nevertheless, this could prove to be a ost promising project for future work.

## Conclusion

The stock market is non-linear in nature, owing to which it is quite challenging to predict a trend with great accuracy [@article-predict-stock-price]. Nevertheless, it has attracted one too many investors and analysts in attempting to predict its performance.

This report presents the study in using data mining algorithms (Support Vector Machines) to predict whether a stock underperforms or outperforms the market. The imperfection in the results obtained via this project can be attributed to the change in political changes, current economical shifts and lastly the ever-changing investor prospects.

For future work, there are quite a number of improvements to be made. For example, kafka can be used to stream real-time data from websites. Also, it would be interesting to implement neural networks to improve the efficiency of the prediction. Text mining social media feeds could be implemented to bring aspects of changes in economy, politics and current trends to the model.

## Acknowledgements

The author would like to thank professor Dr. Geoffrey C. Fox, Dr. Gregor von Laszewski for providing the opportunity to embark on this project. This project would not be possible without the guidance and inputs from the entire piazza team.

