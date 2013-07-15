class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(obj)
    unless @root
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

  def insert_recursive(obj)
    unless @root
      @root = Node.new(obj)
      return
    end

    insert_at(@root, obj)
  end

  def insert_at(node, obj)
    if obj < node.obj
      root.left ? insert_at(root.left, obj) : root.left = Node.new(obj)
    else
      root.right ? insert_at(root.left, obj) : root.right = Node.new(obj)
    end
  end
end