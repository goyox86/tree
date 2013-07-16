class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  def empty?
    @root.nil?
  end

  def delete(obj)
    
  end

  def height(node = @root)
    return 0 unless node

    [height(node.left), height(node.right)].max + 1
  end

  def min
    return nil if empty?

    root = @root
    while root
      return root unless root.left
      root = root.left
    end

    root
  end

  def max
    return nil if empty?

    root = @root
    while root
      return root unless root.right
      root = root.right
    end

    root
  end

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

  def insert_recursive(obj)
    if empty?
      @root = Node.new(obj)
      return
    end

    insert_at(@root, obj)
  end

  def preorder(node = @root, &block)
    return unless node

    yield node
    preorder(node.left, &block)
    preorder(node.right, &block)
  end

  def inorder(node = @root, &block)
    return unless node

    inorder(node.left, &block)
    yield node
    inorder(node.right, &block)
  end

  def postorder(node = @root, &block)
    return unless node

    postorder(node.left, &block)
    postorder(node.right, &block)
    yield node
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