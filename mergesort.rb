#!/usr/bin/env ruby
#
# mergesort.rb
#
# pure ruby merge sort implementation

def msort(arr)
  n = arr.length / 2
  if (n == 0)
    arr
  else
    merge msort(arr[0..n-1]), msort(arr[n..arr.length])
  end
end

def merge(first, rest)
  if first.empty?
    rest
  elsif rest.empty?
    first
  elsif first[0] < rest[0]
    merge(first.drop(1), rest).unshift first[0]
  else
    merge(first, rest.drop(1)).unshift rest[0]
  end
end

input = [1, 5, 8, 13, 4, 2, 7]
output = msort(input)

puts output.join(", ")
