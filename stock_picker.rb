def stock_picker(prices)
    # Min is not last day and max is not first day
    max = prices.drop(1).max()
    max_index = prices.index(max)

    min = prices[0..max_index].min()
    min_index = prices.index(min)

    return [min_index, max_index]
end

# p stock_picker([17,3,6,9,15,8,6,1,10])
