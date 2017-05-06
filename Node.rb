=begin

Author(s): Axel Solano
=end
class Node

  def initialize(freq=nil , char=nil)
    @freq = freq
    @char = char
    @left = nil
    @right = nil
    @bincode = ""
  end

  def getFreq
     @freq
  end

  def setFreq(nf)
    @freq = nf
  end

  def getChar
    @char
  end

  def binCode(code=@bincode)
    @bincode = code
  end

  def getLeft
    @left
  end

  def setLeft(lef)
    @left = lef
  end

  def getRight
    @right
  end

  def setRight(rig)
    @right = rig
  end


end
