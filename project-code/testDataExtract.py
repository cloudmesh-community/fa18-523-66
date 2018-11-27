import pandas as pd
import os
import time
from datetime import datetime
from os import listdir
from os.path import isfile, join



path = "/Users/Sanjay/Documents/StockPredictor/intraQuarter"

def Key_Stats(gather=["Total Debt/Equity",
                      'Trailing P/E',
                      'Price/Sales',
                      'Price/Book',
                      'Profit Margin',
                      'Operating Margin',
                      'Return on Assets',
                      'Return on Equity',
                      'Revenue Per Share',
                      'Market Cap',
                        'Enterprise Value',
                        'Forward P/E',
                        'PEG Ratio',
                        'Enterprise Value/Revenue',
                        'Enterprise Value/EBITDA',
                        'Revenue',
                        'Gross Profit',
                        'EBITDA',
                        'Net Income Avl to Common ',
                        'Diluted EPS',
                        'Earnings Growth',
                        'Revenue Growth',
                        'Total Cash',
                        'Total Cash Per Share',
                        'Total Debt',
                        'Current Ratio',
                        'Book Value Per Share',
                        'Cash Flow',
                        'Beta',
                        'Held by Insiders',
                        'Held by Institutions',
                        'Shares Short (as of',
                        'Short Ratio',
                        'Short % of Float',
                        'Shares Short (prior ']):
    
    statspath = path
    stock_list = [x[0] for x in os.walk(statspath)]
    df = pd.DataFrame(columns = ['Date',
                                 'Ticker',
                                 ##############
                                 'DE Ratio',
                                 'Trailing P/E',
                                 'Price/Sales',
                                 'Price/Book',
                                 'Profit Margin',
                                 'Operating Margin',
                                 'Return on Assets',
                                 'Return on Equity',
                                 'Revenue Per Share',
                                 'Market Cap',
                                 #'Enterprise Value',
                                 #'Forward P/E',
                                 'PEG Ratio',
                                 'Enterprise Value/Revenue',
                                 'Enterprise Value/EBITDA',
                                 'Revenue',
                                 'Gross Profit',
                                 'EBITDA',
                                 'Net Income Avl to Common ',
                                 'Diluted EPS',
                                 'Earnings Growth',
                                 'Revenue Growth',
                                 'Total Cash',
                                 'Total Cash Per Share',
                                 'Total Debt',
                                 'Current Ratio',
                                 'Book Value Per Share',
                                 #'Cash Flow',
                                 'Beta',
                                 'Held by Insiders',
                                 'Held by Institutions'])
                                 #'Shares Short (as of',
                                 #'Short Ratio',
                                 #'Short % of Float',
                                 #'Shares Short (prior ',                                
                                 ##############
                                 #'Status'])

    #sp500_df = pd.read_csv("/Users/Sanjay/Documents/SP500_StockPrediction/sp500.csv")

    ticker_list = []

    for each_dir in stock_list[1:2]:
        each_file = os.listdir(each_dir)
        ticker = each_dir.split("\\")[1]
        ticker_list.append(ticker)


        if len(each_file) > 0:
            filename=each_dir.split("_")[0]
            date_stamp = datetime.strptime(filename,'%Y%m%d')
            unix_time=time.mktime(date_stamp.timetuple())
            #print(date_stamp, unix_time)
            #time.sleep(5)
            full_file_path=path+"/"+each_file
            #print(full_file_path)
            source=open(full_file_path,'r').read()

            try:
                totaldebttoequity = float(source.split('Total Debt/Equity (mrq):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                trailingpbye = float(source.split('Trailing P/E (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                pricepersale = float(source.split('Price/Sales (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])                    
                priceperbook = float(source.split('Price/Book (mrq):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                profitmargin = float(source.split('Profit Margin (ttm):</td><td class="yfnc_tabledata1">')[1].split('%</td>')[0])
                operatingmargin = float(source.split('Operating Margin (ttm):</td><td class="yfnc_tabledata1">')[1].split('%</td>')[0])
                returnonassets = float(source.split('Return on Assets (ttm):</td><td class="yfnc_tabledata1">')[1].split('%</td>')[0])
                returnonequity = float(source.split('Return on Equity (ttm):</td><td class="yfnc_tabledata1">')[1].split('%</td>')[0])

                revenuepershare = float(source.split('Revenue Per Share (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])

                marketcap = float(source.split('Market Cap (intraday):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])

                #enterprisevalue = float(source.split('Price/Sales (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                #forwardpbye = float(source.split('Price/Sales (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])

                pegratio = float(source.split('PEG Ratio (5 yr expected)&sup1;:</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])

                enterprisevaluebyrevenue = float(source.split('Enterprise Value/Revenue (ttm)&sup3;:</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                enterprisevaluebyebitda = float(source.split('Enterprise Value/EBITDA (ttm)&sup3;:</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])

                revenue = float(source.split('Revenue (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                grossprofit = float(source.split('Gross Profit (ttm)&sup2;:</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                ebitda = float(source.split('EBITDA (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                               
                netincomeavltocommon = float(source.split('Net Income Avl to Common (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                dilutedeps = float(source.split('Diluted EPS (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                                  
                earningsgrowth = float(source.split('Earnings Growth (lfy)&sup3;:</td><td class="yfnc_tabledata1">')[1].split('%</td>')[0])
                revenuegrowth = float(source.split('Revenue Growth (lfy)&sup3;:</td><td class="yfnc_tabledata1">')[1].split('%</td>')[0])

                totalcash = float(source.split('Total Cash (mrq):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                totalcashpershare = float(source.split('Total Cash Per Share (mrq):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                totaldebt = float(source.split('Total Debt (mrq)&sup2;:</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])                 
                currentratio = float(source.split('Current Ratio (mrq):</td><td class="yfnc_tabledata1">2')[1].split('</td>')[0])
                bookvaluepershare = float(source.split('Book Value Per Share (mrq):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                #cashflow = float(source.split('Price/Sales (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                beta = float(source.split('Beta:</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                heldbyinsiders = float(source.split('Held by Insiders:</td><td class="yfnc_tabledata1">')[1].split('%</td>')[0])
                heldbyinstitutions = float(source.split('Held by Institutions:</td><td class="yfnc_tabledata1">')[1].split('%</td>')[0])
                #sharesshortasof = float(source.split('Price/Sales (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                #shortratio = float(source.split('Price/Sales (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                #shortpercentoffloat = float(source.split('Price/Sales (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])
                #sharesshortprior = float(source.split('Price/Sales (ttm):</td><td class="yfnc_tabledata1">')[1].split('</td>')[0])

                print(totaldebttoequity, pricepersale ,priceperbook ,profitmargin ,operatingmargin, returnonassets ,returnonequity ,revenuepershare, marketcap ,enterprisevalue ,forwardpbye ,pegratio ,enterprisevaluebyrevenue ,enterprisevaluebyebitda ,revenue ,grossprofit ,ebitda ,netincomeavltocommon ,dilutedeps ,earningsgrowth ,revenuegrowth ,totalcash ,totalcashpershare ,totaldebt ,currentratio ,bookvaluepershare ,cashflow ,beta, heldbyinsiders ,heldbyinstitutions) 

                df = df.append({'Date':date_stamp,
                                            'Ticker':ticker,
                                            'DE Ratio':totaldebttoequity,
                                            'Trailing P/E':trailingpbye,
                                            'Price/Sales':pricepersale,
                                            'Price/Book':priceperbook,
                                            'Profit Margin':profitmargin,
                                            'Operating Margin':operatingmargin,
                                            'Return on Assets':retirnonassets,
                                            'Return on Equity':returnonequity,
                                            'Revenue Per Share':revenuepershare,
                                            'Market Cap':marketcap,
                                             #'Enterprise Value':value_list[10],
                                             #'Forward P/E':value_list[11],
                                             'PEG Ratio':pegratio,
                                             'Enterprise Value/Revenue':enterprisevaluebyrevenue,
                                             'Enterprise Value/EBITDA':enterprisevaluebyebidta,
                                             'Revenue':revenue,
                                             'Gross Profit':grossprofit,
                                             'EBITDA':ebitda,
                                             'Net Income Avl to Common ':netincomeavltocommon,
                                             'Diluted EPS':dilutedeps,
                                             'Earnings Growth':earningsgrowth,
                                             'Revenue Growth':revenuegrowth,
                                             'Total Cash':totalcash,
                                             'Total Cash Per Share':totalcashpershare,
                                             'Total Debt':totaldebt,
                                             'Current Ratio':currentratio,
                                             'Book Value Per Share':bookvaluepershare,
                                             #'Cash Flow':value_list[27,
                                             'Beta':beta,
                                             'Held by Insiders':heldbyinsiders,
                                             'Held by Institutions':heldbyinstitutions},
                                             #'Shares Short (as of':value_list[31],
                                             #'Short Ratio':value_list[32],
                                             #'Short % of Float':value_list[33],
                                             #'Shares Short (prior ':value_list[34],
                                            #'Status':status},
                                           ignore_index=True)

            except Exception as e:
                print("guess this ain't happenin' in "+ticker)
                                       
    #print(df.values)


    df.to_csv("key_stats.csv")
    

Key_Stats()
    
