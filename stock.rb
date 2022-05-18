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
