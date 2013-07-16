require 'bundler/setup'
require 'spec_helper'

describe Tree do
  before do
    @tree = Tree.new
  end

  describe 'Insertion' do
    describe '#insert' do
      describe 'Empty Tree' do
        it 'should correctly insert the given object' do
          @tree.insert(1)
          @tree.root.obj.should == 1
        end
      end

      describe 'Non-Empty Tree' do
        it 'should correctly insert the given object' do
          @tree.insert(2)
          @tree.insert(1)
          @tree.insert(3)
          @tree.root.obj.should == 2
          @tree.root.left.obj.should == 1
          @tree.root.right.obj.should == 3
        end
      end
    end

    describe '#insert_recursive' do
      describe 'Empty Tree' do
        it 'should correctly insert the given object' do
          @tree.insert_recursive(1)
          @tree.root.obj.should == 1
        end
      end

      describe 'Non-Empty Tree' do
        it 'should correctly insert the given object' do
          @tree.insert_recursive(2)
          @tree.insert_recursive(1)
          @tree.insert_recursive(3)
          @tree.root.obj.should == 2
          @tree.root.left.obj.should == 1
          @tree.root.right.obj.should == 3
        end
      end
    end
  end

  describe 'Traversal' do
    before do
      @tree = Tree.new
      @node_itself_object = 2
      @left_object = 1
      @right_object = 3
      @tree.insert(@node_itself_object)
      @tree.insert(@left_object)
      @tree.insert(@right_object)
    end

    describe '#preorder' do
      it 'should visit the node itself first, followed by the left node and lastly the right node' do
        @tree.preorder { |node| node.to_s }
      end
    end

    describe '#inorder' do
      it 'should visit the left node first, followed by node itself and lastly the right node' do
        @tree.inorder { |node| node }
      end
    end

    describe '#postorder' do
      it 'should visit the left node first, followed by the right node and lastly the node itself' do
        @tree.postorder { |node| node }
      end
    end
  end

  describe 'Deletion' do
    pending 'Implement me please!'
    describe 'On a leaf node' do
      it 'should remove the node if this is a leaf' do
      end
    end
  end

  describe 'Finding' do
    describe '#find' do
      it 'should return the node holding the given key' do
        @tree.insert(2)
        @tree.insert(1)
        @tree.insert(3)
        @tree.find(1).obj.should == 1
      end

      it 'should return the nil when a node holding the given key does not exist in the tree' do
        @tree.insert(2)
        @tree.insert(1)
        @tree.insert(3)
        @tree.find(4).should be_nil
      end
    end
  end

  describe '#min' do
    it 'should return the node holding the smallest object/key' do
      @tree.insert(2)
      @tree.insert(1)
      @tree.insert(3)
      @tree.insert(-1)
      @tree.insert(-2)
      @tree.insert(-3)
      @tree.min.obj.should == -3
    end

    it 'should return nil when empty' do
      @tree.min.should be_nil
    end
  end

  describe '#max' do
    it 'should return the node holding the smallest object/key' do
      @tree.insert(2)
      @tree.insert(1)
      @tree.insert(3)
      @tree.insert(-1)
      @tree.insert(-2)
      @tree.insert(-3)
      @tree.max.obj.should == 3
    end

    it 'should return nil when empty' do
      @tree.max.should be_nil
    end
  end
end