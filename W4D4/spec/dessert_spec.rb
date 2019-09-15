require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:choco) { double() }
  subject { Dessert.new(choco, 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq(choco)
    end

    it "sets a quantity" do
      expect(subject.quantity).to be(100)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cho", "cho", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(subject.add_ingredient("crumbs")).to include("crumbs")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      subject.add_ingredient("crumbs")
      subject.add_ingredient("pieces")
      subject.add_ingredient("caramel")
      subject.mix!
      expect(subject.ingredients).to include("crumbs", "pieces", "caramel")
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      subject.eat(10)
      expect(subject.quantity).to eq(90)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { subject.eat(200) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("aa")
      allow(choco).to receive(:pluralize).and_return("ooo")
      expect(subject.serve).to eq("aa has made 100 ooo!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(subject)
      subject.make_more
    end
  end
end
