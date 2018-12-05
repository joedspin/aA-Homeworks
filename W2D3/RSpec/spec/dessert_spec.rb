require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  let(:chef) { double("chef") }
  let(:cookie) { Dessert.new("chocolate chip", 12, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("chocolate chip")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect(cookie.quantity).to be_a(Integer)
    end

  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("flour")
      expect(cookie.ingredients).to eq(["flour"])
    end

  end

  describe "#mix!" do

    it "shuffles the ingredient array" do
      cookie.add_ingredient("sugar")
      cookie.mix!
      expect(cookie.ingredients).to eq(["sugar"])
    end

  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      cookie.eat(2)
      expect(cookie.quantity).to eq(10)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect(cookie.eat(20)).to raise_error("not enough left!")
    end

  end


  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      expect(cookie.serve).to include("Chef")
    end

  end

  describe "#make_more" do

    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end

  end

end
