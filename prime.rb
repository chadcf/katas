#!/usr/bin/env ruby
#
# prime.rb - very concise functional prime number check

def is_prime?(n)
  (2..n-1).to_a.all? {|num| n % num != 0}
end

def print_prime(n)
  if is_prime?(n)
    puts "#{n} is prime"
  else
    puts "#{n} is not prime"
  end
end

print_prime(5)
print_prime(17)
print_prime(146)
print_prime(12843)
