class Node
  attr_accessor :left, :right, :obj

  def initialize(left, right, obj)
    @left = left
    @right = right
    @obj = obj
  end
end