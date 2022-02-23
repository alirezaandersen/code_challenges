require "rspec/autorun"
require 'pry'

# Code Challenge and Ruby Basics:
# https://gist.github.com/ludaxkris/5ea09260ece6018ac3636213f53b3c58
# In Ruby sometimes Object == Object doesn't return what we were expecting.
# A tiny example of this is we don't care if a Hash key is a symbol or a string.
# Eg: we would want {foo: 'bar'} == {"foo": 'bar'} to be true.
# This is why we are programming our own function to determine Object == Object.

class DebugUtil
  def self._is_object_pair_equal?(l_obj, r_obj)
    if  l_obj.is_a?(Array) && r_obj.is_a?(Array)
      arr_compare(l_obj, r_obj)
    elsif
      l_obj.is_a?(Hash) && r_obj.is_a?(Hash)
      self.hash_compare(l_obj, r_obj)
    else
    compare_primitive(l_obj, r_obj)
    end
    # your code here
  end

  def self.compare_primitive(l_obj, r_obj)
    n1 = l_obj.to_s
    n2 = r_obj.to_s
    n1 ==(n2)
  end

    def self.arr_compare(arr_1, arr_2)
    # based on size
     return false unless arr_1.size === arr_2.size
     return false unless arr_1.map(&:to_s).sort == arr_2.map(&:to_s).sort
       true
    end

    def self.hash_compare(hash_1, hash_2)
      binding.pry
      # return false unless hash_1 === hash_2
      arr = []
      arr << (hash_1.keys | hash_2.keys).map { |key| self.compare_primitive(hash_1[key], hash_2[key]) }
      arr << (hash_1.values | hash_2.values).map { |val| self.compare_primitive(hash_1[val], hash_2[val]) }
      arr.flatten!
      arr.include?(true)
    end
end

describe "DebugUtil" do
  context "base cases" do
    # it "3 == 3" do
    #   expect(DebugUtil._is_object_pair_equal?(3,3)).to eq true
    # end
    #
    # it ":foo == 'foo'" do
    #   expect(DebugUtil._is_object_pair_equal?(:foo, "foo")).to eq true
    # end
    #
    # it "'foo' == 'foo'" do
    #   expect(DebugUtil._is_object_pair_equal?("foo","foo")).to eq true
    # end
    #
    # it "3 == '3'" do
    #   expect(DebugUtil._is_object_pair_equal?(3,"3")).to eq true
    # end
    #
    # it "[1] == [1]" do
    #   expect(DebugUtil._is_object_pair_equal?([1],[1])).to eq true
    # end
    #
    # it "[1,2] == ['1','2']" do
    #   expect(DebugUtil._is_object_pair_equal?([1,2],["1","2"])).to eq true
    # end
    #
    # it "[1,2,3] != [1,2]" do
    #   expect(DebugUtil._is_object_pair_equal?([1,2,3],[1,2])).to eq false
    # end
    #
    # it "[1,2] != [1,2,3,4]" do
    #   expect(DebugUtil._is_object_pair_equal?([1,2],[1,2,3,4])).to eq false
    # end
    #
    # it "hash simple equals another hash" do
    #   expect(DebugUtil._is_object_pair_equal?({foo: "bar"}, {foo: "bar"})).to eq true
    # end

    it "hash doesn't equal hash of different" do
      expect(DebugUtil._is_object_pair_equal?({}, {a: nil})).to eq false
      expect(DebugUtil._is_object_pair_equal?({a: nil},{})).to eq false
    end
  end

  context 'simple use cases' do
    it "hashes not equal another hash if simple strings are different" do
      expect(DebugUtil._is_object_pair_equal?({foo: "bar1"}, {foo: "bar2"})).to eq false
    end

    it "hashes equal if key either a string or symbol" do
      expect(DebugUtil._is_object_pair_equal?({foo: "bar"}, {"foo" => "bar"})).to eq true
    end

    it "hashes equal if symbol is either a string or symbol" do
      expect(DebugUtil._is_object_pair_equal?({foo: "bar"}, {foo: :bar})).to eq true
    end

    it "hashes equal if value is the same but one is an integer and the other is a string" do
      expect(DebugUtil._is_object_pair_equal?({foo: 1}, {foo: "1"})).to eq true
    end

    it "hashes not equal if value is a simple Array" do
      expect(DebugUtil._is_object_pair_equal?({a: [1,2,3]}, {a: [1,2,3]})).to eq true
    end

    it "hashes not equal if value is a simple Array" do
      expect(DebugUtil._is_object_pair_equal?({a: [1,2,3]}, {a: [1,2,4]})).to eq false
    end

    it "Array of array doesn't equal array of hash" do
      expect(DebugUtil._is_object_pair_equal?([[]], [{}])).to eq false
      expect(DebugUtil._is_object_pair_equal?([{}], [[]])).to eq false
    end
  end

  context "advanced use cases" do
    it "should be same even if hash keys are in different order" do
      expect(DebugUtil._is_object_pair_equal?({key2: "bar", key1: "foo"}, {key1: "foo", key2: "bar"})).to eq true
    end

    it "hashes equal if values are arrays of symbols and strings" do
      expect(DebugUtil._is_object_pair_equal?({a: [1, 2, 3]}, {a: ["1", "2", "3"]})).to eq true
    end

    it "hash should not equal hash if value is an array with array contents not in order" do
      expect(DebugUtil._is_object_pair_equal?({foo: [1,2]}, {foo: [2,1]})).to eq false
    end

    it "similar hash but different should not equal" do
      expect(DebugUtil._is_object_pair_equal?({key1: "foo", key2: "bar"}, {key1: "foo", key3: "asdf", key2: "bar"})).to eq false
    end

    it "similar hash but different should not equal" do
      expect(DebugUtil._is_object_pair_equal?({key1: "foo", key2: "bar", key3: "asdf"}, {key1: "foo", key2: "bar"})).to eq false
    end

    it "arrays with nested hashes that are equal should be equal" do
      expect(DebugUtil._is_object_pair_equal?([:foo, {foo: "bar"}], [:foo, {foo: :bar}])).to eq true
    end

    it "nested Arrays that are equivalent" do
      expect(
        DebugUtil._is_object_pair_equal?(
          [1, 2, [1, [:some, :symbols]]],
          [1, 2, ["1", ["some", "symbols"]]]
        )
      ).to eq true
    end

    it "nested Arrays that are not equivalent" do
      expect(
        DebugUtil._is_object_pair_equal?(
          [1, 2, [1, [:some, :symbols]]],
          [1, 2, ["1", ["some", 3]]]
        )
      ).to eq false
    end

    it "nested hashes that are equivalent" do
      expect(
        DebugUtil._is_object_pair_equal?(
          {
            key1: {
              key2: {
                key3: "bar"
              },
              key4: ["foo"],
            },
            key5: 5
          },
          {
            key1: {
              key2: {
                key3: "bar"
              },
              key4: [:foo],
            },
            key5: 5
          },
        )
      ).to eq true
    end

    it "nested hashes that are not equivalent" do
      expect(
        DebugUtil._is_object_pair_equal?(
          {
            key1: {
              key2: {
                key3: "bar"
              },
              key4: "foo",
            },
            key5: 5
          },
          {
            key1: {
              key2: {
                key3: "bar"
              },
              key4: [:foo],
            },
            key5: 5
          },
        )
      ).to eq false
    end
  end
end
