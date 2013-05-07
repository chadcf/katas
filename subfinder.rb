#!/usr/bin/env ruby
#
# subfinder.rb
#
# Task: write a function that takes a list b and
# returns true if the list contains a sub-list a,
# or false otherwise

def match(arr, sub)
  match_helper(arr, sub, sub)
end

def match_helper(arr, sub, stack)
  if stack.length == 0
    true
  elsif arr.length == 0
    false
  elsif arr.first == stack.first
    match_helper(arr[1..-1], sub, stack[1..-1])
  else
    match(arr[1..-1], sub)
  end
end

a = [1, 4, 8, 3, 5]
b = [8, 3, 2, 9, 3, 7, 1, 4, 5, 8, 3, 5, 9, 4, 7]

if match(b, a)
  puts 'yes!'
else
  puts 'no :('
end
