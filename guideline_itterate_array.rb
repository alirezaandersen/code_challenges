require "minitest/autorun"
# require 'pry'

#
# Implement the contains_all? method
#
# The contains_all? method accepts two array arguments, inputs and supply. It
# should return true if all elements in inputs are included in supply, otherwise
# it should return false.
#
def contains_all?(inputs, supply)
  inputs = [] if inputs.nil?
  supply = [] if supply.nil?
  
  return true if inputs.empty? || supply.empty?
  i = inputs.tally
  s = supply.tally

  i.all?  { |a,c| s.fetch(a, 0) >= c }

end

describe "contains_all?" do

  describe "with perfect input" do

    it "should return true for an empty set of inputs" do
      inputs = []
      supply = ['a', 'b', 'c']
      run_test(inputs, supply, true)
    end

    it "should return true if all inputs are in the supply" do
      inputs = ['a']
      supply = ['a']
      run_test(inputs, supply, true)
    end

    it "should return false if not all the inputs are in the supply" do
      inputs = ['a']
      supply = ['b']
      run_test(inputs, supply, false)
    end

    it "should return true if the inputs are in a different order but are all present in the supply" do
      inputs = ['a', 'b', 'c']
      supply = ['b', 'a', 'c']
      run_test(inputs, supply, true)
    end

    it "should return false if the supply does not have all values from the input" do
      inputs = ['a', 'b', 'c']
      supply = ['a', 'b']
      run_test(inputs, supply, false)
    end

    it "should return true if supply contains extra values" do
      inputs = ['a', 'b', 'c']
      supply = ['b', 'q', 'r', 'n', 'a', 'c']
      run_test(inputs, supply, true)
    end

    it "should return false if the supply is missing one element" do
      inputs = ['a', 'b', 'c']
      supply = ['q', 'r', 'n', 'a', 'c']
      run_test(inputs, supply, false)
    end

    it "should return false if not all individual inputs are represented in the supply" do
      inputs = ['a', 'a', 'b', 'c']
      supply = ['b', 'q', 'r', 'n', 'a', 'c']
      run_test(inputs, supply, false)
    end

    it "should return true if the supply contains more of the same element" do
      inputs = ['a', 'a', 'b', 'c']
      supply = ['b', 'a', 'a', 'a', 'c']
      run_test(inputs, supply, true)
    end

  end

   describe "with incorrect user input" do

    it "should return true for a null set" do
      inputs = nil
      supply = []
      run_test(inputs, supply, true)
    end

    it "should return true if the supply is null but the inputs are empty" do
      inputs = []
      supply = nil
      run_test(inputs, supply, true)
    end

    it "should return true if they're both null" do
      inputs = nil
      supply = nil
      run_test(inputs, supply, true)
    end

    it "should return true if one of inputs or supply are not an array" do
      inputs = 'a'
      supply = ['a']
      run_test(inputs, supply, true)

      inputs = ['a']
      supply = 'a'
      run_test(inputs, supply, true)
    end

    it "should handle values as if they were arrays" do
      inputs = 0
      supply = 0
      run_test(inputs, supply, true)

      inputs = 1
      run_test(inputs, supply, false)
    end

  end

  private

  def run_test(inputs, supply, expected_result)
    result = contains_all?(inputs, supply)
    assert_equal expected_result, result
  end

end
