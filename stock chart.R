#stock chart

install.packages('quantmod') 
library(quantmod) 

getSymbols(c("SPY"),src="yahoo")
chartSeries(SPY,subset="2019-08::2022-04",theme=chartTheme("white"),TA="addVo();addBBands();addATR();addCMF()")

# more function
getSymbols("SPY")
chartSeries(SPY)
candleChart(SPY,multi.col=TRUE,theme='white')
barChart(SPY,theme='white.mono',bar.type='hlc')
candleChart(SPY,theme='white', type='candles')
reChart(major.ticks='months',subset='first 16 weeks')

#===============================================================
# use your original data
df <- read.csv(file='sp500_index.csv', stringsAsFactors = FALSE)
head(df, 5)   # display the first five observations

df$Date <- as.Date(df$Date)
ggplot(df,aes(x=Date,y=S.P500,color="red"))+geom_line()






