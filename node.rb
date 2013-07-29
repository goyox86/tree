#
# = node.rb
#
# Copyright (c) 2013 Jose Narvaez
#
# Written and maintained by Jose Narvaez <goyox86@gmail.com>.
#
# This program is free software. You can re-distribute and/or
# modify this program under the same terms of ruby itself ---
# Ruby Distribution License or GNU General Public License.
#
class Node
  attr_accessor :left, :right, :obj

  def initialize(obj, left = nil, right = nil)
    @obj = obj
    @left = left
    @right = right
  end

  # Predicate to determine if +self+ is a leaf.
  #
  # @return [true] if +self+ is a leaf.
  # @return [false] if +self+ is not a leaf.
  def leaf?
    left.nil? && right.nil?
  end
end