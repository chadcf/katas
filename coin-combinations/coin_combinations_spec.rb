#!/usr/bin/env ruby

require "minitest/spec"
require "minitest/autorun"
require_relative "coin_combinations"

describe CoinCombinations do
  let(:subject) { CoinCombinations.new }
  before do
    @inputs = [
      [4, [1,2,3], 4],
      [5, [1,2,3], 5],
      [10, [2,5,3,6], 5]
    ]

    @dp_inputs = @inputs + [[250, [2,5,3,6,10,7,8,12,17,19,20], 227491942]]
  end

  it "calculates correct values recursively" do
    @inputs.each do |input|
      subject.possible_solutions(input[0], input[1]).must_equal input[2]
    end
  end

  it "calculates correct values with recursive memoization" do
    @inputs.each do |input|
      subject.possible_solutions(input[0], input[1], :memoize).must_equal input[2]
    end
  end

  it "calculates correct values with efficient dynamic programming" do
    @dp_inputs.each do |input|
      subject.possible_solutions(input[0], input[1], :dp).must_equal input[2]
    end
  end
end