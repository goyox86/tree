class Node
  attr_accessor :left, :right, :obj

  def initialize(obj, left = nil, right = nil)
    @obj = obj
    @left = left
    @right = right
  end
end