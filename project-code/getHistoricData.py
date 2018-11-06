import requests

f1 = ["MMM","AXP","AAPL","BA",
      "CAT","CVX","CSCO","KO",
      "XOM","GS","HD",
      "IBM","INTC","JNJ","JPM",
      "MCD","MRK","NKE","PFE",
      "PG","TRV","UNH","UTX",
      "VZ","V","WMT",
      "DIS","MSFT"]

for i in f1:
    url = 'https://www.quandl.com/api/v3/datasets/EOD/'+i+'.csv?api_key=7PJB1MfzPuaMP_uaxyst'
    r = requests.get(url, allow_redirects=True)
    file = '/Users/Sanjay/Documents/StockPredictor/HistoricData/'+i+'.csv'
    print(file)
    open(file, 'wb').write(r.content)


