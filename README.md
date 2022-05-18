# Fintual Portfolio

Construct a simple `Portfolio` class that has a collection of Stocks and a `Profit` method that receives 2 dates and returns the profit of the `Portfolio` between those dates. Assume each `Stock` has a `Price` method that receives a date and returns its price.

**Bonus Track:** make the Profit method return the "annualized return" of the portfolio between the given dates.

## Quickstart

`> ruby main.rb`

```shell
Between dates 2005-05-01 and 2018-08-01
Initial Value: 2000.0
Final Value: 10000.0
Profit: 400.0%
Annualized Profit: 12.9%
```

### Stock class

```ruby
# frozen_string_literal: true

# class for stock record
class Stock
  attr_reader :symbol, :date

  def initialize(symbol:, date:, price: 0)
    @symbol = symbol
    @date = date
    @price = price
  end

  def price(date)
    date ||= DateTime.now
    return @price if DateTime.parse(@date) >= DateTime.parse(date.to_s)

    rand(@price..@price * 10)
  end
end

```

### Portfolio class

```ruby
# frozen_string_literal: true

require 'date'

require_relative 'stock'

# class for portfolio record
class Portfolio
  attr_writer :final_value

  def initialize(stocks)
    @stocks = stocks
  end

  def profit(start_date, end_date)
    @start_date = start_date
    @end_date = end_date

    (((final_value - initial_value) / initial_value) * 100).round(2)
  end

  def annualized_profit(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
    days = DateTime.parse(end_date).mjd - DateTime.parse(start_date).mjd

    ((((final_value / initial_value)**(DAYS_YEAR / days)) - 1) * 100).round(2)
  end

  def initial_value
    @initial_value ||= stocks.reduce(0) do |sum, stock|
      sum + stock.price(start_date)
    end
  end

  def final_value
    @final_value ||= stocks.reduce(0) do |sum, stock|
      sum + stock.price(end_date)
    end
  end

  private

  attr_reader :start_date, :end_date, :stocks

  DAYS_YEAR = 365.0
end

```

### `in.txt`

```
AAPL 2005-05-01 1000.0
NFLX 2005-05-01 200.0
AMZN 2005-05-01 800.0
```
