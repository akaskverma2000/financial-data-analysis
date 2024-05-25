# Financial Data Analysis and Trading Signals

This project focuses on analyzing financial data of various stocks and generating trading signals based on moving averages. It includes functionalities for importing stock data from CSV files into MySQL database, calculating moving averages, generating trading signals, and storing the results back into the database. 

## Features

- **Data Import**: Import stock data from CSV files into MySQL database.
- **Moving Averages**: Calculate 20-day and 50-day moving averages for stock prices.
- **Trading Signals**: Generate trading signals (Buy/Sell/Hold) based on moving averages.
- **Database Operations**: Perform various database operations like creating tables, inserting data, and updating signals.

## Technologies Used

- **Python**: Used for data processing, analysis, and signal generation.
- **Pandas**: Data manipulation and analysis.
- **SQLAlchemy**: ORM for interacting with MySQL database.
- **MySQL**: Database for storing stock data and trading signals.
- **Jupyter Notebook**: Used for development and testing.

## Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/akashverma2000/financial-data-analysis.git
   ```

2. Install the required dependencies:

   ```bash
   pip install -r requirements.txt
   ```

3. Set up your MySQL database and update the `.env` file with your database credentials.

4. Run the Jupyter Notebook files to execute the code.

## Usage

1. **Import Data**: Place your CSV files in the project directory and run the respective Jupyter Notebook cells to import the data into the database.

2. **Calculate Moving Averages**: Run the cells to calculate 20-day and 50-day moving averages for the stock prices.

3. **Generate Trading Signals**: Run the cells to generate trading signals based on the moving averages.

4. **View Results**: Use the provided SQL queries or functions to view the trading signals for specific dates.

## Project Explanation

This project aims to provide a comprehensive analysis of stock data and generate actionable trading signals based on moving averages. The key components of the project include:

1. **Data Import**: The project allows users to import historical stock data from CSV files into a MySQL database. This step ensures that the data is easily accessible for analysis and signal generation.

2. **Moving Averages**: Moving averages are widely used in technical analysis to identify trends and potential trading opportunities. The project calculates both the 20-day and 50-day moving averages for each stock, providing valuable insights into the stock's price movements over time.

3. **Trading Signals**: Based on the calculated moving averages, the project generates trading signals for each stock. A "Buy" signal is generated when the 20-day moving average crosses above the 50-day moving average, indicating a potential uptrend. Conversely, a "Sell" signal is generated when the 20-day moving average crosses below the 50-day moving average, indicating a potential downtrend. A "Hold" signal is generated when there is no significant crossover, suggesting a neutral stance.

4. **Database Operations**: The project includes functionalities for creating tables, inserting data, and updating signals in the MySQL database. This ensures that the trading signals are stored persistently and can be easily accessed for further analysis.

5. **Usage Example**: The project provides a practical example of how to use the generated trading signals to make informed trading decisions. By querying the database for the trading signal on a specific date, users can determine whether to buy, sell, or hold a particular stock based on the calculated moving averages.

Overall, this project demonstrates the use of data analysis and technical indicators to generate trading signals, providing valuable insights for both novice and experienced traders.

## Example

To get the trading signal for a specific date, you can use the `Trade_signal_from_bajaj` function in MySQL:

```sql
SELECT Trade_signal_from_bajaj('2024-05-01') AS trade_signal;
```

This will return the trading signal (Buy/Sell/Hold) for the given date.