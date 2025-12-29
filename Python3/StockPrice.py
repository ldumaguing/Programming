import json
import urllib.request
import ssl

# LibreOffice API imports
import uno
from com.sun.star.sheet import XSpreadsheetDocument

# Disable SSL verification (Yahoo Finance uses HTTPS)
ssl._create_default_https_context = ssl._create_unverified_context

def get_stock_price(ticker):
    """
    Fetch the latest stock price from Yahoo Finance.
    Returns None if the request fails.
    """
    try:
        url = f"https://query1.finance.yahoo.com/v7/finance/quote?symbols={ticker}"
        with urllib.request.urlopen(url, timeout=5) as response:
            data = json.loads(response.read().decode())
            result = data.get("quoteResponse", {}).get("result", [])
            if result and "regularMarketPrice" in result[0]:
                return result[0]["regularMarketPrice"]
    except Exception as e:
        print(f"Error fetching stock price: {e}")
    return None

def insert_stock_price(*args):
    """
    LibreOffice Calc macro entry point.
    Fetches stock price and inserts it into cell A1 of the active sheet.
    """
    try:
        # Get the current Calc document
        ctx = uno.getComponentContext()
        smgr = ctx.ServiceManager
        desktop = smgr.createInstanceWithContext("com.sun.star.frame.Desktop", ctx)
        model = desktop.getCurrentComponent()

        if not isinstance(model, XSpreadsheetDocument):
            print("This macro must be run from LibreOffice Calc.")
            return

        # Get active sheet
        sheet = model.CurrentController.ActiveSheet

        # Change ticker here or make it dynamic
        ticker = "AAPL"  # Example: Apple Inc.
        price = get_stock_price(ticker)

        if price is not None:
            sheet.getCellRangeByName("A1").String = f"{ticker} Price: {price}"
        else:
            sheet.getCellRangeByName("A1").String = "Error fetching price"

    except Exception as e:
        print(f"Macro error: {e}")

