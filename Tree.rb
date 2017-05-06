=begin

Author(s): Axel Solano
=end
require_relative '../HuffmanCode-Tree/Node.rb'

class Tree

  def initialize(freq=nil, char=nil)
    @node = Node.new(freq,char)
    @code = ""
    @hashlist = Hash.new("")
  end

  def getNode
    @node
  end

  def setTree(tree1, tree2)
    @node = Node.new
    @node.setFreq(tree1.getNode.getFreq + tree2.getNode.getFreq)
    @node.setLeft(tree1.getNode)
    @node.setRight(tree2.getNode)
  end

  def getKey
    @node.getFreq
  end

  def getHaslist
    @hashlist
  end

  def convertBinary(node)
    return if node.getLeft.nil?
    node.getLeft.binCode("#{node.binCode}0")
    if !node.getLeft.getChar.nil?
      @hashlist[node.getLeft.getChar] = node.getLeft.binCode
      #puts "#{node.getLeft.getChar} ==> #{@hashlist[node.getLeft.getChar]} "
    end
    convertBinary(node.getLeft)
    node.getRight.binCode("#{node.binCode}1")
    if !node.getRight.getChar.nil?
      @hashlist[node.getRight.getChar] = node.getRight.binCode
      #puts "#{node.getRight.getChar} ==> #{@hashlist[node.getRight.getChar]} "
    end
    convertBinary(node.getRight)
  end

end
