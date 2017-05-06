require 'spec_helper'
=begin
Author(s): Axel Solano
=end

describe Tree do

  before :each do
    @tree1 = Tree.new(nil,"a")
    @tree2 = Tree.new(10,"x")
    @tree3 = Tree.new(5,"e")
    @tree4 = Tree.new
    @tree4.setTree(@tree2,@tree3)
    @tree5 = Tree.new
    @tree6 = Tree.new(3)
  end

  describe "#new" do
    it "returns a Tree object" do
      expect(@tree1).to be_an_instance_of Tree
      expect(@tree2).to be_an_instance_of Tree
      expect(@tree3).to be_an_instance_of Tree
      expect(@tree4).to be_an_instance_of Tree
      expect(@tree5).to be_an_instance_of Tree
      expect(@tree6).to be_an_instance_of Tree
    end

    it "throws an Argument Error when give more than 2 parameters" do
      expect(lambda{ Tree.new("line","value","extra") }). to raise_exception ArgumentError
    end

    it "throws an Names Error" do
      expect(lambda{ @tree1.setTree(tree2,tree3)}). to raise_exception NameError
    end
  end

  describe "setTree function" do
    it "throws an Argument Error when give no parameter or one parameter" do
      expect(lambda{ @tree1.setTree}). to raise_exception ArgumentError
      expect(lambda{ @tree1.setTree(1)}). to raise_exception ArgumentError
    end
    it "throws an Argument Error when give more than 2 parameters" do
      expect(lambda{ @tree1.setTree(1,2,3,4,5)}). to raise_exception ArgumentError
    end
    it "throws an Names Error" do
      expect(lambda{ @tree1.setTree(tree2,tree3)}). to raise_exception NameError
    end

  end

  describe "getKey function" do
    it "returns an integer" do
      expect(@tree2.getKey).to be_a Integer
      expect(@tree3.getKey).to be_a Integer
      expect(@tree4.getKey).to be_a Integer
      expect(@tree6.getKey).to be_a Integer
    end
    it "returns an integer" do
      expect(@tree1.getKey).to be_nil
      expect(@tree5.getKey).to be_nil
    end
    it "throws an Names Error" do
      expect(lambda{ @tree1.getKey(tree2,tree3)}). to raise_exception NameError
      expect(lambda{ @tree2.getKey(tree2,tree3)}). to raise_exception NameError
      expect(lambda{ @tree3.getKey(tree2,tree3)}). to raise_exception NameError
    end
    it "throws an Argument Error when give more than 1 parameter" do
      expect(lambda{ @tree4.getKey(1,2,3,4,5)}). to raise_exception ArgumentError
      expect(lambda{ @tree5.getKey(1,2,3,4,5)}). to raise_exception ArgumentError
      expect(lambda{ @tree6.getKey(1,2,3,4,5)}). to raise_exception ArgumentError
    end
  end

  describe "convertBinary function" do
    it "throws an Argument Error when give more than 1 parameter" do
      expect(lambda{ @tree4.convertBinary(1,2,3,4,5)}). to raise_exception ArgumentError
      expect(lambda{ @tree5.convertBinary(1,2,3,4,5)}). to raise_exception ArgumentError
      expect(lambda{ @tree6.convertBinary(1,2,3,4,5)}). to raise_exception ArgumentError
    end
    it "throws an Names error" do
      expect(lambda{ @tree4.convertBinary(one,two)}). to raise_exception NameError
      expect(lambda{ @tree5.convertBinary(one,two)}). to raise_exception NameError
      expect(lambda{ @tree6.convertBinary(one,two)}). to raise_exception NameError
    end
    it "shows no element added if it is only one tree" do
      @tree2.convertBinary(@tree2.getNode)
      expect(@tree2.getHaslist.length).to eql 0
    end

    it "shows elements added to the tree" do
      @tree2.convertBinary(@tree4.getNode)
      #check with 2 becuase there exists only two characters
      expect(@tree2.getHaslist.length).to eql 2
    end

  end



end
