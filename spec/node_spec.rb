require 'bundler/setup'
require 'spec_helper'

describe Node do
  describe 'Inizialization' do
    it 'should initialize with the left to nil when called only with the +obj+ argument' do
      node = Node.new(1)
      node.left.should be_nil
    end

    it 'should initialize with the right to nil when called only with the +obj+ argument' do
      node = Node.new(1)
      node.right.should be_nil
    end

    it 'should set the left child with the second argument' do
      left_child = Node.new(1)
      node = Node.new(2, left_child)
      node.left.should == left_child
    end

    it 'should set the right child with the third argument' do
      right_child = Node.new(3)
      node = Node.new(2, nil, right_child)
      node.right.should == right_child
    end
  end

  describe 'Predicates' do
    describe '#leaf?' do
      it 'should return true when both childs are nil' do
        node = Node.new(1)
        node.should be_leaf
      end

      it 'should return false when left child is not nil' do
        left_child = Node.new(1)
        node = Node.new(2, left_child)
        node.should_not be_leaf
      end

      it 'should return false when right child is not nil' do
        right_child = Node.new(3)
        node = Node.new(2, nil, right_child)
        node.should_not be_leaf
      end
    end

    describe '#empty?' do
      it 'should return true when there are no nodes A.K.A root is nil' do
        tree = Tree.new
        tree.should be_empty
      end

      it 'should return false when there is at least a node A.K.A root is not nil' do
        tree = Tree.new
        tree.insert(1)
        tree.should_not be_empty
      end
    end
  end
end