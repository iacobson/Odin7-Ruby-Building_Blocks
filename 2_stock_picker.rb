


def stock_picker (prices_array)
  # storing final results (buy index and sell index in an array)
  results = []
  sell_at_index = prices_array.length - 1
  buy_at_index = sell_at_index - 1

  current_profit = 0
  # will loop through the entire array and aways substract all numbers from the last one
  loop do
    loop do
      result = prices_array[sell_at_index] - prices_array[buy_at_index]
      # comparing results and always storing the highest together with the corrensponding result array
      if result > current_profit
        current_profit = result
        results = [buy_at_index , sell_at_index]
      end
      buy_at_index -= 1
      break if buy_at_index < 0
    end

    sell_at_index -= 1
    buy_at_index = sell_at_index - 1
    break if sell_at_index == 0
  end

  sell_price = prices_array[results[1]].to_s
  buy_price = prices_array[results[0]].to_s

  puts "stock prices: " + prices_array.to_s
  puts results.to_s + " for a profit of $" + sell_price + " - $" + buy_price + " = $" + current_profit.to_s
end

stock_picker ([17,3,6,9,15,8,6,1,10])
