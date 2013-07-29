#
# = tree.rb
#
# Copyright (c) 2013 Jose Narvaez
#
# Written and maintained by Jose Narvaez <goyox86@gmail.com>.
#
# This program is free software. You can re-distribute and/or
# modify this program under the same terms of ruby itself ---
# Ruby Distribution License or GNU General Public License.
#
# Basic BST implementation.
class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Determines if the +self+ is empty (no subtrees).
  #
  # @return [true] if +self+ has no subtrees.
  # @return [false] if +self+ has at least one subtree.
  def empty?
    @root.nil?
  end

  # Deletes the Node holding +obj+ from +self+.
  #
  # @param obj
  # @return [Node, nil] the Node which contains +obj+ if found nil otherwise.
  def delete(obj) ; end

  # Calculates the height of the Tree.
  #
  # @return [Integer] the height of +self+.
  def height(node = @root)
    return 0 unless node

    [height(node.left), height(node.right)].max + 1
  end

  # Finds the Node holding the object with the smaller value.
  #
  # @return [Node] holding the object with the smaller value.
  # (see #max)
  def min
    return nil if empty?

    root = @root
    while root
      return root unless root.left
      root = root.left
    end

    root
  end

  # Finds the Node holding the object with the largest value.
  #
  # @return [Node] holding the object with the largest value.
  # (see #min)
  def max
    return nil if empty?

    root = @root
    while root
      return root unless root.right
      root = root.right
    end

    root
  end

  # Finds the Node holding the object hoding a given value.
  #
  # @param obj the value to be searched.
  # @return [Node] holding the object with the given value.
  # @note This uses an iterative implementation.
  def find(obj)
    return nil if empty?

    root = @root
    while root
      return root if obj == root.obj

      if obj < root.obj
        root = root.left
      else
        root = root.right
      end
    end
  end

  # Inserts the object into +self+ at the corresponding position.
  #
  # @param obj the value to be inserted.
  # @return [nil].
  # @note This uses an iterative implementation.
  # (see #insert_recursive)
  def insert(obj)
    if empty?
      @root = Node.new(obj)
      return
    end

    root = @root
    while root
      return if obj == root.obj

      if obj < root.obj
        root.left ? root = root.left : root.left = Node.new(obj)
      else
        root.right ? root = root.right : root.right = Node.new(obj)
      end
    end
  end

  # Inserts the object into +self+ at the corresponding position.
  #
  # @param obj the value to be inserted.
  # @return [nil]
  # @note This uses a recurive implementation.
  # (see #insert)
  def insert_recursive(obj)
    if empty?
      @root = Node.new(obj)
      return
    end

    insert_at(@root, obj)
  end

  # Performs preorder traversal (Root, Left, Right).
  #
  # @param [Node] node the node to start from.
  # @param [Block] the block to be executed in each stop.
  # @return [nil]
  # @note this implementation uses recursion.
  def preorder(node = @root, &block)
    return unless node

    yield node
    preorder(node.left, &block)
    preorder(node.right, &block)
  end

  # Performs inorder traversal (Left, Root, Right).
  #
  # @param [Node] node the node to start from.
  # @param [Block] the block to be executed in each stop.
  # @return [nil]
  # @note this implementation uses recursion.
  def inorder(node = @root, &block)
    return unless node

    inorder(node.left, &block)
    yield node
    inorder(node.right, &block)
  end

  # Performs postorder traversal (Left, Right, Root).
  #
  # @param [Node] node the node to start from.
  # @param [Block] the block to be executed in each stop.
  # @return [nil]
  # @note this implementation uses recursion.
  def postorder(node = @root, &block)
    return unless node

    postorder(node.left, &block)
    postorder(node.right, &block)
    yield node
  end

  # Performs preorder traversal (Root, Left, Right).
  #
  # @param [Node] node the node to start from.
  # @param [Block] the block to be executed in each stop.
  # @return [nil]
  # @note this implementation uses iteration.
  def preorder_iterative(&block)
    stack = []

    stack.push(@root)
    until stack.empty?
      node = stack.pop
      yield node

      stack.push(node.right) if node.right
      stack.push(node.left) if node.left
    end
  end

  private

  def insert_at(node, obj)
    if obj < node.obj
      root.left ? insert_at(root.left, obj) : root.left = Node.new(obj)
    else
      root.right ? insert_at(root.left, obj) : root.right = Node.new(obj)
    end
  end
end