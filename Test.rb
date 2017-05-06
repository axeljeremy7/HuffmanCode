=begin

Author(s): Axel Solano
=end
require_relative '../HuffmanCode-Tree/Node.rb'
require_relative '../HuffmanCode-Tree/Tree.rb'
require_relative '../HuffmanCode-Tree/Heap.rb'
require_relative '../HuffmanCode-Tree/MyHuffman.rb'

puts "Testing manually the insertion and deletion of the Heap"
tree1 = Tree.new(8,"a")
tree2 = Tree.new(10,"x")
tree3 = Tree.new(5,"e")
tree4 = Tree.new(4,"l")
tree5 = Tree.new(7,"j")
tree6 = Tree.new(7,"r")
tree7 = Tree.new(21,"m")
tree8 = Tree.new
tree8.setTree(tree4,tree3)

mh = Heap.new
mh.heapInsert(tree1)
mh.heapInsert(tree2)
mh.heapInsert(tree3)
mh.heapInsert(tree4)
mh.heapInsert(tree5)
mh.heapInsert(tree6)
mh.heapInsert(tree7)
mh.heapInsert(tree8)
puts "Printing Heap:"
mh.printHeap

puts "\nTesting the deletion of the Heap\n\n"
for i in 1..5
  puts "removed: #{mh.removeMin.getKey}"
  mh.printHeap
  puts "\n"
end
puts "\n"

lf = Hash.new(0)
puts "String to test:"
str = "abraca&&& %%%%dabra"
puts str
str.each_char { |chr|  lf[chr]+=1}
puts "Showing frequencies with characters"
lf.each{ |key,val| puts "key: #{key} ,freq: #{val}"}

puts "\n\n HUFFMAN ENCODE\n"
huf = MyHuffman.new
huf.countFrequencies(str)
huf.huffman(huf.getHash)
puts huf.encode_string(huf.getTree,str)

#
