#### For this project, run the files in the order below:

### Important : Please note that all filepaths mentioned in the code <ins>NEEDS</ins> to be changed!!!

#### Note : The python programs only serves to extract data and create the csv files. The data mining models are witten in r. 

* The Dow Jones Index cannot be downloaded via script, but manually from Yahoo Finance (https://finance.yahoo.com/quote/%5EDJI/history?p=%5EDJI). I have included the DJI.csv file in the project-code folder.

* testDataExtract.py

  *testDataExtract.py need not be run. The code parses through old yahoo finance web pages for quarterly results. Ideally features from the quarterly results was to be included to populate the historical (daily) data file, but will no longer be used, for lack of time to test the same. Please note if it is preferred to include these features, then I suggest that the data be downloaded from the sec website. These files are more clearer and easier to parse.*
  
  *The datasets for testDataExtract.py may be downloaded from : https://pythonprogramming.net/static/downloads/machine-learning-data/intraQuarter.zip* *Once again this is completely optional and not needed.*

* getTodayStats.py 
  
  *The getTodayStats.py script captures the yahoo finance web pages and store them locally as html files which can then be parsed later.*
  
* getHistoricData.py

  *getHistoricData.py code downloads historic data for all stocks using the Quandl API. Please note that data for both WallGreens Boots Alliance and DowDuPoint Inc. can only be downloaded if you have a premium account on Quandl.*
  
* getSummaryReport.py

  *getSummaryReport.py parses the CNN Business webpage to download the latest stock details in a summarized table.*

#### Note : You do not need both getTodayStats.py and getSummaryReports.py, any one will suffice. Prrferably use getSummaryReports.py

* dow30Performance.r
  
  *Run dow30Perfoemance.r once all the datasets have been downloaded and stored in a seperate folder.*
  *This file still has code to be appended; not complete!!!*
