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
