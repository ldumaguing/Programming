import yfinance as yf

ticker_symbol = 'AAPL'
stock = yf.Ticker(ticker_symbol)

# Get current price
# The 'regularMarketPrice' or 'last_price' attribute provides the most recent price
current_price = stock.info.get('regularMarketPrice') 

if current_price:
    print(f"The current price for {ticker_symbol} is: ${current_price}")
else:
    print(f"Could not retrieve current price for {ticker_symbol}")

# Get the previous day's closing price
previous_close = stock.info.get('previousClose')
if previous_close:
    print(f"The previous closing price was: ${previous_close}")

