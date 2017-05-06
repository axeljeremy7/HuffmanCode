require 'spec_helper'
=begin

Author(s): Axel Solano
=end

describe MyHuffman do

  before :each do
    @mh1 = MyHuffman.new
    @mh2 = MyHuffman.new
    @str = "abraca&&& %%%%dabra"
    @mh1.countFrequencies(@str)
  end

  describe "#new" do
    it "returns a new MyEdge object" do
      expect(@mh1).to be_an_instance_of MyHuffman
      expect(@mh2).to be_an_instance_of MyHuffman

    end

    it "throws an Argument error when give more than 1 parameter" do
      expect(lambda{ MyHuffman.new("line","value","extra") }). to raise_exception ArgumentError
    end
  end

  describe "Hash of characters with their frequencies" do
    it "returns 0 as the size of the hash is empty" do
      expect(@mh2.getHash.length).to eql 0
    end

    it "returns more than 0 if the Hash constains the frequencies" do
      lhash = Hash.new(0)
      @str.each_char { |chr| lhash[chr]+=1}
      lhash.each {|key,val| expect(@mh1.getHash[key]).to eql lhash[key]}
    end
    it "throws an Argument error when give more than 1 parameter" do
      expect(lambda{ @mh2.countFrequencies(@str,1,2,3,"oli") }). to raise_exception ArgumentError
      expect(lambda{ @mh1.countFrequencies(@str,2,3,4,"oli") }). to raise_exception ArgumentError
    end
    it "throws an Argument error when give no parameter" do
      expect(lambda{ @mh2.countFrequencies }). to raise_exception ArgumentError
      expect(lambda{ @mh1.countFrequencies }). to raise_exception ArgumentError
    end
  end

  describe "Hash" do
    it "verifies instance of Hash" do
      expect(@mh1.getHash).to be_an_instance_of Hash
      expect(@mh2.getHash).to be_an_instance_of Hash
    end
    it "throws an Argument error when give more than 1 parameter" do
      expect(lambda{ @mh2.getHash(7,8,"oli") }). to raise_exception ArgumentError
      expect(lambda{ @mh1.getHash(7,8,"oli") }). to raise_exception ArgumentError
    end
  end

  describe "Huffman function" do
    it "verifies that it returns a Tree object" do
      expect(@mh1.huffman(@mh1.getHash)).to be_a Tree
      expect(@mh1.getTree).to be_a Tree
      expect(@mh2.getTree).to be_a Tree
    end

    it "throws an Argument error when give more than 1 parameter" do
      expect(lambda{ @mh1.huffman(@mh1.getHash,12,"oli") }). to raise_exception ArgumentError
    end

    it "throws an Argument error when give no  parameters" do
      expect(lambda{ @mh1.huffman }). to raise_exception ArgumentError
    end

    it "throws a Names error " do
      expect(lambda{ @mh1.huffman(nameserrorlist) }). to raise_exception NameError
    end
  end

  describe "Conversion to binary" do
    it "returns with no problem a string of binary numbers for each letter" do
      expect(@mh1.encode_string(@mh1.getTree, @str)).to be_a String
    end

    it "throws an Argument error when give more than 2 parameters" do
      expect(lambda{ @mh1.encode_string(@mh1.getTree, @str, 12, 32) }). to raise_exception ArgumentError
    end

    it "throws an Argument error when give no  parameters" do
      expect(lambda{ @mh1.encode_string }). to raise_exception ArgumentError
    end

    it "throws a Names error" do
      expect(lambda{ @mh1.encode_string(tree,str) }). to raise_exception NameError
    end
  end


end
