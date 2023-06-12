# R-Project

## Creating a Diversified Stock Portfolio Using Clustering Analysis

Project description 
Problem Statement
The aim of the project is to create a diversified portfolio of stocks using clustering analysis and back test its performance against the historical data of a stock index. For this we look at the S&P500 index, that is deemed to be the most accurate quantifier of the US economy. S&P500 is the comparable standard for many funds in the marketplace.

Our attempt is to use K-Means clustering based on Euclidian distances to understand the effect of different parameters that affect the stock performance. The comprehension of stock performance will be aided by dividing stocks into clusters that have stocks with similar performance. These clusters provide valuable information to create stock portfolios. 

Project Details
To perform clustering. Feature vectors were created using financial ratios calculated upon historical price movements. This enables us to create portfolios that will use properties that differentiate these clusters, and we will then analyze if the portfolio constructed using clustering analysis exceeds this expectation by back testing the portfolio on the time series validation data. The following features were calculated from the 10 year daily historical data for all the stocks in the S&P 500 index
•	Correlation with SP500 index value  
•	Beta with SP500 index value                                                       
•	Annualized Return on equity (daily returns)           
•	Annualized Volatility on equity (daily returns)           
•	Sharpe Ratio                                               
•	Daily Change in price                                      
•	Daily Variation in price    

Among these features we study how clusters are distributed in terms of annualized returns and annualized volatility. One of the critical elements for this activity is the Sharpe ratio. It is the risk-adjusted return of a stock. In other words, if the Sharpe ratio is high, it means that the company performance is much better with a lower risk. Beta is yet another measure that is used in the CAPM (Capital Assent Pricing Model) to design portfolios and help investors decide if certain stock moves in a certain direction with the rest of the market.
To validate the results, clustering is performed on the first 70% of the time series historical data. The rest is used to validate the diversified portfolio constructed by picking the top five performing stocks in terms of Sharpe ratio from each cluster. We then plot the cumulative returns of the S&P 500 index against the portfolio constructed using K-Means clustering. We study how the portfolio performs during economic crisis such as COVID-19 which shook the capital markets and study if the portfolio survives such as impact and compare its performance with the index.

The S&P 500 Stock Index
A stock market index tracks the performance of a group of stocks or assets. This performance is an effective way to see the stock market's health and helps to measure the performance of our investments. The three major indexes in the US market are the S&P 500, Dow Jones Industrial Average (DJIA), and NASDAQ.

Indexes are usually market-weighted or price-weighted. The S&P 500 Index is a market-weighted index. Therefore, every stock in the index is represented in proportion to its total market capitalization. In other words, if the total market value of all 500 companies in the S&P 500 drops by 10%, the value of the index also drops by 10%. A comparison of the three major stock indexes shows why the S&P 500 is the best indicator of the whole stock market and is chosen for the creation of our portfolio.
S&P 500 
(Standard & Poor's 500)	NASDAQ	DOW JONES
Includes 500 of the top companies in the U.S.	Most technology stocks are traded on this index.	The oldest, most well-known, and most frequently used index globally.
Stocks are chosen primarily on market capitalization. The constituent committee also considers other factors such as liquidity, financial viability, trading history, etc. 	It includes almost all major tech stocks and also some companies that are not based in the US. 	Includes the stocks of the 30 largest and most influential companies in the US.
The S&P 500 Index represents approximately 80% of the total value of the U.S. stock market.
It gives a gives a good indication of movement in the U.S. market.	Its movement generally indicates the performance of the technology industry as well as investors' attitudes toward more speculative stocks.	Represents around 1/4th of the value of the entire U.S. Stock market. A percent change in the Dow cannot be interpreted as a definite indication that the entire market has dropped by the same percent.

Tree Map Depicting Various sectors and industries with sectors scaled on their weight in the S&P500 INDEX.
<img width="394" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/1fbd750d-fe5d-41c4-aa0a-20393bc9f238">


Data Description:
We used the following 3 date sets from Kaggle: S&P500 Index, S&P500 Companies, and S&P500 Stocks
S&P500 Companies: This table holds the basic information of all the companies that are listed on the S&P500 index. It holds 498 observations of 16 variables.
Variable	Type	Description	Example Observation
Exchange	Chr	Exchange where its stocks are negotiated	NMS
Symbol	Chr	Stock symbol	AAPL
Shortname	Chr	Company short name	Apple Inc.
Longname	Chr	Company long name	Apple Inc.
Sector	Chr	Sector where the company operates	Technology
Industry	Chr	Industry, within a sector	Consumer Electronics
Current Price	Num	Current stock price	171.83
Market Cap	Num	Current market cap	2819111780352
Ebitda	Num	Earnings before interest, taxes, depreciation, and amortization	120233000960
Revenue Growth	Num	% Of Revenue growth	0.288
City	Chr	Matrix City	Cupertino
State	Chr	Matrix State	CA
Country	Chr	Matrix Country	United States
Full-Time Employee	Int	Number of full-time employees	154000
Long business summary	Chr	Summary of the company	Apple Inc. designs, manufactures, and markets smartphones, …...
Weight
 	Num	Percentage of participation in the S&P index (market cap %).	0.68210858

S&P500 Stocks: This table holds the OHCL values for the past 10 years on a daily basis for the 500 Stocks involved in the S&P500 index. It consists of 1561965 observations of 8 variables.
Variable	Type	Description	Example Observation
Date	Chr	Dates for the last 10 years	2013-02-18
Symbol	Chr	Company Symbol/Ticker	AAPL
Adj.Close	Num	Like the price at market closure, yet also considers company actions such as dividends and splits.	17.105011
Close	Num	Price at market closure.	19.89179
High	Num	Maximum value of period	20.49571
Low	Num	Minimum value of period	19.73500
Open	Num	Price at market opening.	20.34107
Volume	Num	Volume traded.	694870400

S&P500 Index: This table tracks the index value of each working day for the last 10 years. It holds 2517 observation of 2 variables.
Variable	Type	Description	Example Observation
Date	Chr	Dates for the last 10 years	2013-04-15
S.P500	Num	Value of the S&P 500 index	1382

Challenges:
•	There is no single goal or analysis for a clustering problem and requires creativity 
•	Reorganizing data sets into data frames for all 500 stocks and performing tasks such as merging, slicing data frames and writing vectorized code
•	Creating and choosing features vectors for K-Means clustering and forming insights was an iterative process
•	Dealing with missing values in the data set resulted in errors and miscalculations
•	Some companies did not exist in the S&P 500 index and were introduced in the previous decade. These edge conditions had to be handed either by removing or recalculating financial ratios individually 
•	Programming in R with no prior coding experience.
•	Finding appropriate packages and reading documentation for various tasks such as plotting, data wrangling and data cleaning. 

Analysis and Conclusions
K-Means Clustering
The following results depict the optimal value for choosing K value using a spree plot and the clusters convex formed after choosing K =4. The stock symbols are used to represent its relative position in the cluster.

<img width="218" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/05bfe3d4-1d5b-43d1-bf2e-27e157b56443">
<img width="274" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/fa517aa0-4e72-4e31-93f1-975851016fc5">

K-Means Clustering Summary Statistics
Post K- Means clustering, Cluster wise distribution of Annualized returns, Annualized Volatility, Sharpe ratio and Beta were plotted. It can be observed that there is a significant difference in at least two or more clusters both in terms of mean value and standard deviation.

<img width="219" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/d2911c78-4a06-42ca-a556-21ffd7d8c028">
<img width="215" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/9ae8ff6f-9ea9-48b0-8f60-46d1566b0ab7">
<img width="209" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/cc9f13d8-ca0e-455a-8f68-5f6ccbc99d4a">
<img width="208" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/9bd3cd5a-e1f7-49ca-93da-ee17387dc7c0">


<img width="407" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/a63aeb96-5754-4622-850f-1c719e30383a">

From the above plots, we observe vital information regarding the four clusters:
1.    Cluster 3 has the best performance in the market but has variable performance because of certain outliers and can be regarded as stocks with high returns and low volatility
2.    Cluster 2 has lower volatility but also has lower returns. This cluster is a bit more stable and has comparable returns and risks when compared with cluster 3. However, they collectively offer lesser returns for same or lower volatility in comparison with cluster 2. The stocks in this cluster have low return & low volatility 
3.   Cluster 4 indicates high risk with low returns that discourages investors looking to be a little aggressive to make some money in the market. However, the average beta value of this cluster is lower than other clusters and can be used to construct a diversified portfolio
4.   Cluster 1 has the highest average annualized returns & volatility. The stocks under this cluster are high risk, high return stocks.

Back testing results 
For validating the process of using clustering for creating a diversified portfolio we back tested it performance on the test/validation data. The clustering was performed on the first 7 years of data and then the remaining 3 years of data were used to validate the results of our portfolio. For this, two portfolios containing 20 stocks were created
1.	Portfolio created using top five stocks (as per Sharpe ratio) from each cluster - [RED] 
2.	Portfolio created using top 20 stocks out of all 500 as per Sharpe ratio from the 7-year historical performance - [ORANGE]
The K-Means Portfolio has the following stocks: ABMD, AMZN, ALGN, AVGO, NFLX, BRK-B, DG, O, GOOGL, PFE, DPZ, TDG, CTAS, HD, JKHY, CMG, COP, CF, KIM, VTR
The K-Means Portfolio has stock from the following Sectors: Basic Materials, Communication Services, Consumer Cyclical, Consumer Defensive, Energy, Financial Services, Healthcare, Industrials, Real Estate, Technology.
•	We see that the orange portfolio, which is a collection of stocks with the highest Sharpe ratio, outperformed the S&P500 index. The portfolio formed using k-means clustering (red line) has a better performance. 
•	This indicates that the K-Means clustering successfully created a diversified portfolio in terms of all the features mentioned during clustering and not only outperformed the S&P 500 index but also a collection of stocks with best historical performance. 
•	The back-testing results indicate that the k-means portfolio was correlated with the index during COVID-19 and recovered slower than the orange index. However, as the portfolio was highly diversified the k-means portfolio had a far better long-term performance in comparison with the orange portfolio 
<img width="544" alt="image" src="https://github.com/aditichand/R-Project/assets/61296787/d4e7e0e3-6540-459f-acc8-499d6a93385c">
