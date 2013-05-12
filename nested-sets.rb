#!/usr/bin/env ruby
#
# nested-sets.rb
#
# Given a positive integer n, find all pairs of positive
# integers i and j, with 1 <= j < i < n such that i + j is prime.
#
# Implemented imperatively and functionally, for fun.

def is_prime?(n)
    (2..n-1).to_a.all? {|num| n % num != 0}
end

def imperative_search(n)
  pairs = Array.new
  (1..n).each do |i|
    (1..n).each do |j|
      if j < i && i < n && is_prime?(i+j)
        pairs << [i,j]
      end
    end
  end
  pairs
end

def functional_search(n)
  pairs = (1...n).flat_map {|i| (1...i).map {|j| [i,j]}}
  pairs.select{|i,j| is_prime?(i+j)}
end

puts imperative_search(7).inspect
puts functional_search(7).inspect

