require 'bundler/setup'
require 'spec_helper'

describe Tree do
  before do
    @tree = Tree.new
  end

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