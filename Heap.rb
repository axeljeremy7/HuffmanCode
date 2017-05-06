=begin
Author(s): Axel Solano
=end
require_relative '../HuffmanCode-Tree/Tree.rb'

class Heap

  def initialize
    @list = []
    @n = 0
    @list[0] = 0

  end

  def swap(pos1, pos2)
    temp = @list[pos1]
    @list[pos1] = @list[pos2]
    @list[pos2] = temp
  end

  def heapInsert(tree)
    @n = @n + 1
    @list[@n] = tree
    i = @n
    while i > 1 && @list[i/2].getKey > @list[i].getKey do
      swap(i/2, i)
      i = i/2
    end

  end

  def printHeap
    for i in 1..@n
      puts "#{@list[i].getKey} index: #{i}"
    end
  end

  def getSize
    @n
  end

  def minValueIndex(index1,index2)
    if @list[index1].getKey < @list[index2].getKey
      return index1
    end

    return index2
  end

  def removeMin
    temp = @list[1]
    @list[1] = @list[@n]
    @n = @n - 1
    i = 1
    while i < @n do
      if (2*i + 1) <=@n
        #
        if @list[i].getKey <= @list[2*i].getKey && @list[i].getKey <= @list[2*i+1].getKey
          return temp
        else
          j = minValueIndex(2*i,2*i+1)
          swap(i,j)
          i = j
        end
        #
      else
        #
        if (2*i) <=@n
          if @list[i].getKey > @list[2*i].getKey
            swap(i,2*i)
          end
        end
        #
        return temp
        #
      end
      #
    end

    return temp
  end

end
