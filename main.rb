# frozen_string_literal: true

# quickstart
#
# to run
# ruby main.rb
# Between dates 2005-05-01 and 2018-08-01
# Initial Value: 2000.0
# Final Value: 10000.0
# Profit: 400.0%
# Annualized Profit: 12.9%

require_relative 'stock'
require_relative 'portfolio'

stocks = []

File.open('in.txt') do |reader|
  until reader.eof?
    line = reader.gets
    stock = line.split
    stocks << Stock.new(symbol: stock[0], date: stock[1], price: stock[2].to_f)
  end
end

portfolio = Portfolio.new(stocks)
start_date = '2005-05-01'
end_date = '2018-08-01'

# to have control of the final amount
# comment to generate random values
portfolio.final_value = 10_000.0
profit = portfolio.profit(start_date, end_date)
annualized_profit = portfolio.annualized_profit(start_date, end_date)

puts "Between dates #{start_date} and #{end_date}"
puts "Initial Value: #{portfolio.initial_value}"
puts "Final Value: #{portfolio.final_value}"
puts "Profit: #{profit}%"
puts "Annualized Profit: #{annualized_profit}%"
