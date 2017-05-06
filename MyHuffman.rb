=begin
Author(s): Axel Solano
=end
require_relative '../HuffmanCode-Tree/Tree.rb'
require_relative '../HuffmanCode-Tree/Heap.rb'

class MyHuffman
  def initialize
    #lf hash of frequencies
    @lf = Hash.new(0)
    @tree = Tree.new
  end

  def countFrequencies(str)
    str.each_char { |chr|  @lf[chr]+=1}
  end

  def getHash
    @lf
  end

  def huffman(lf)
    q = Heap.new
    lf.each {|key,val|
      tree = Tree.new(val, key)
      q.heapInsert(tree)
    }

    while q.getSize > 1 do
      tree1 = q.removeMin
      #puts "#{tree1.getNode.getChar} ==> #{tree1.getKey}"
      tree2 = q.removeMin
      #puts "#{tree2.getNode.getChar} ==> #{tree2.getKey}"
      tree3 = Tree.new
      tree3.setTree(tree1,tree2)
      q.heapInsert(tree3)
    end

    @tree = q.removeMin
    return @tree
  end

  def getTree
    @tree
  end

  def encode_string(tree, str)
    tree.convertBinary(tree.getNode)
    temphash = Hash.new("")
    binstr = ""
    str.each_char{ |chr|
      binstr = binstr + tree.getHaslist[chr] + " "
      #the code below can be ommited, if only used for demonstration in Test.rb
      #puts "#{chr} ==> #{tree.getHaslist[chr]}"
    }
    return binstr

  end




end
