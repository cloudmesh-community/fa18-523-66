import pandas as pd
import os
import time
from datetime import datetime
from os import listdir
from os.path import isfile, join


path ="/Users/Sanjay/Documents/StockPredictor/TodayStats"
def key_stats(gather="Total Debt/Equity"):
    statspath=path+'/TodayStats'
    #k = [225,226,227,228,229,230,231,232,233,234,235]
    stock_list = [f for f in listdir(path) if isfile(join(path,f))]
    df=pd.DataFrame(columns= ['Date','Unix','Ticker','DE ratio','Price','DOW30'])
    dow30_today_df = pd.read_csv("/Users/Sanjay/Documents/StockPredictor/TodaySummaryRpt/summaryReport.csv")
    dow30_df = pd.read_csv("/Users/Sanjay/Documents/StockPredictor/DJI.csv", names = ['Date','Open','High','Low','Close','Adj Close','Volume'])
    #print(stock_list)

    for each_dir in stock_list[1:]:
        #i = k[0]
        each_file = each_dir
        ticker=each_dir.split("_")[1].split(".")[0]
        #print(each_file, " ",ticker, "\n")
        #time.sleep(15)
        if len(each_file) > 0:
            filename=each_dir.split("_")[0]
            date_stamp = datetime.strptime(filename,'%Y%m%d')
            unix_time=time.mktime(date_stamp.timetuple())
            #print(date_stamp, unix_time)
            #time.sleep(5)
            full_file_path=path+"/"+each_file
            #print(full_file_path)
            source=open(full_file_path,'r').read()
            #print(source)
            try:
                i = int(source.split(gather+'</span><!-- react-text: ')[1].split(' -->')[0])
                x = i+1
                y = i+2
                z = i+3
                
                #--below 3 lines only for testing errors--
                #print(i,x,y,z)
                #intermediarystring ='</span><!-- react-text: '+str(i)+' --> <!-- /react-text --><!-- react-text: '+str(x)+' -->(mrq)<!-- /react-text --><sup aria-label="KS_HELP_SUP_undefined" data-reactid="'+str(y)+'"></sup></td><td class="Fz(s) Fw(500) Ta(end)" data-reactid="'+str(z)+'">'
                #print(intermediarystring)
                #--resume code--
                
                devalue = float(source.split(gather+'</span><!-- react-text: '+str(i)+' --> <!-- /react-text --><!-- react-text: '+str(x)+' -->(mrq)<!-- /react-text --><sup aria-label="KS_HELP_SUP_undefined" data-reactid="'+str(y)+'"></sup></td><td class="Fz(s) Fw(500) Ta(end)" data-reactid="'+str(z)+'">')[1].split('</td>')[0])

                #find the stock price value for the day
                for index, row in dow30_today_df.iterrows():
                    #a = row['Company'].split(" ")[1]
                    if ticker in row['Company']:
                        #print(a)
                        stock_price = row['Price']
                        break;
                    
                #dow30_date = datetime.fromtimestamp(unix_time).strftime('%Y-%m-%d')
                #print("Date:",date_stamp,"Unix:",unix_time,"Ticker:",ticker,"DE ratio:",devalue,"Price:",stock_price,"dow30_date:",dow30_date)    
                #print("devalue:",devalue,"ticker:",ticker,"stock price:",stock_price)

                dow30_date=datetime.fromtimestamp(unix_time).strftime('%Y-%m-%d')
                #print("devalue:",devalue,"ticker:",ticker,"stock price:",stock_price,"dow30date:",dow30_date)
                
                row = dow30_df[(dow30_df['Date'] == dow30_date)]
            
                dow30_value = float(row["Adj Close"])
                print("Date:",date_stamp,"Unix:",unix_time,"Ticker:",ticker,"DE ratio:",devalue,"Price:",stock_price,"Dow30:",dow30_value) 
                #for index, row in dow30_df.iterrows():
                #        print("for loop", index, str(dow30_df["Date"]))
                #       
                #        if str(dow30_date) == str(dow30_df["Date"]):
                #            dow30_value = float(dow30_df["Adj Close"])
                #            print("dow30_value:",dow30_value)
                #            break;

              
                
                df=df.append({'Date':date_stamp,'Unix':unix_time,'Ticker':ticker,'DE ratio':devalue,'Price':stock_price,'DOW30':dow30_value},ignore_index=True)

            except Exception as e:
                #print("guess this ain't happenin' in "+ticker)
                devalue = 0
                for index, row in dow30_today_df.iterrows():
                    if ticker in row['Company']:
                        #print(a)
                        stock_price = row['Price']
                        break;
                dow30_date=datetime.fromtimestamp(unix_time).strftime('%Y-%m-%d')
                row = dow30_df[(dow30_df['Date'] == dow30_date)]
            
                dow30_value = float(row["Adj Close"])
                print("Date:",date_stamp,"Unix:",unix_time,"Ticker:",ticker,"DE ratio:",devalue,"Price:",stock_price,"Dow30:",dow30_value)
                df=df.append({'Date':date_stamp,'Unix':unix_time,'Ticker':ticker,'DE ratio':devalue,'Price':stock_price,'DOW30':dow30_value},ignore_index=True)

    print(df.values)
    save= gather.replace(' ','').replace(')','').replace('(','').replace('/','')+('.csv')
    print(save)
    df.to_csv(save)

       
    

key_stats()

