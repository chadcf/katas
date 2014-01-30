class CoinCombinations
  def possible_solutions(amount, coins, method = :recursive)
    @coins = coins
    @amount = amount
    @memoizations = Array.new(@coins.length + 1).map {|a| Array.new(amount + 1)}

    case method
    when :dp
      find_solutions_dp
    when :memoize
      find_solutions_memoized(coins.count, amount)
    else
      find_solutions(coins.count, amount)
    end
  end

  # standard recursive implementation
  def find_solutions(index, amount)
    return 1 if amount == 0
    return 0 if amount < 0 || index == 0
    
    find_solutions(index-1, amount) + 
      find_solutions(index, amount - @coins[index-1])
  end

  # slightly more efficient with caching
  def find_solutions_memoized(index, amount)
    return 1 if amount == 0
    return 0 if amount < 0 || index == 0
    
    tail = amount - @coins[index-1]
    @memoizations[index-1][amount] ||= find_solutions(index-1, amount)
    @memoizations[index][tail] ||= find_solutions(index, amount - @coins[index-1])
    @memoizations[index-1][amount] + @memoizations[index][tail]
  end

  # bottom up dp solution
  def find_solutions_dp
    solutions = Array.new(@amount+1).map {|i| 0 }
    solutions[0] = 1

    @coins.each do |coin|
      for i in coin..@amount
        solutions[i] = solutions[i] + solutions[i-coin]
      end
    end

    solutions[@amount]
  end
end