# save-webpage.py

#import urllib2

#url = 'https://finance.yahoo.com/quote/TWTR/key-statistics?p=TWTR'

#response = urllib2.urlopen(url)
#webContent = response.read()

#f = open('twitter.html', 'w')
#f.write(webContent)
#f.close

import requests
import datetime

#f=open("/Users/Sanjay/Documents/List_Stats_Dow.txt","r")

#f1 = f.readlines()

f1 = ["MMM","AXP","AAPL","BA",
      "CAT","CVX","CSCO","KO",
      "DWDP","XOM","GS","HD",
      "IBM","INTC","JNJ","JPM",
      "MCD","MRK","NKE","PFE",
      "PG","TRV","UNH","UTX",
      "VZ","V","WMT","WBA",
      "DIS","MSFT"]
today = datetime.datetime.now()
date = str(today.year)+str(today.month)+str(today.day)
for i in f1:
    url = 'https://finance.yahoo.com/quote/'+i+'/key-statistics?p='+i
    r = requests.get(url, allow_redirects=True)
    file = '/Users/Sanjay/Documents/StockPredictor/TodayStats/'+date+'_'+i+'.html'
    print(file)
    open(file, 'wb').write(r.content)


#f.close()



