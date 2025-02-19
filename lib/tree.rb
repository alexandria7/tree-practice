class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Time Complexity: O(n) where n is the height of the tree
  #                   or O(log n) if the tree is balanced
  # Space Complexity: O(1)
  def add(key, value)
    new_tree_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_tree_node
    else
      current = @root
      while current
        if new_tree_node.key <= current.key
          if !current.left
            current.left = new_tree_node
            return
          else
            current = current.left
          end
        else
          if !current.right
            current.right = new_tree_node
            return
          else
            current = current.right
          end
        end
      end
    end
  end

  # Time Complexity: O(log n) if tree is balanced, n is size of tree
  #                   O(n) in worst case where n is also size of tree
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?

    current = @root
    while current
      if key > current.key
        current = current.right
      elsif key < current.key
        current = current.left
      else
        return current.value
      end
    end

    return nil
  end

  # Time Complexity: O(n) where n is the height of the tree
  # Space Complexity: O(n) where n is the height of the tree
  #                   potentially O(n^2) with the arrays?
  def inorder
    array = []
    return [] if @root.nil?
    current = @root

    return inorder_recursive(current, array)
  end

  def inorder_recursive(current, array)
    if !current
      return array
    else
      inorder_recursive(current.left, array)
      array << {:key => current.key, :value => current.value}
      inorder_recursive(current.right, array)
    end
  end

  # Time Complexity: O(n) where n is the height of the tree
  # Space Complexity: O(n) where n is the height of the tree
  def preorder
    array = []
    return [] if @root.nil?
    current = @root

    return preorder_recursive(current, array)
  end

  def preorder_recursive(current, array)
    if !current
      return array
    else
      array << {:key => current.key, :value => current.value}
      preorder_recursive(current.left, array)
      preorder_recursive(current.right, array)
    end
  end

  # Time Complexity: O(n) where n is the height of the tree
  # Space Complexity: O(n) where n is the height of the tree
  def postorder
    array = []
    return [] if @root.nil?
    current = @root

    return postorder_recursive(current, array)
  end

  def postorder_recursive(current, array)
    if !current
      return array
    else
      postorder_recursive(current.left, array)
      postorder_recursive(current.right, array)
      array << {:key => current.key, :value => current.value}
    end
  end

  # Time Complexity: O(n) where n is the size of the tree
  # Space Complexity: O(n)
  def height
    return 0 if @root.nil?
    current = @root
    height_recursive(current)
  end

  def height_recursive(current)
    return 0 if current.nil?

    left_side = height_recursive(current.left)
    right_side = height_recursive(current.right)

    if left_side < right_side
      return (right_side + 1)
    else
      return (left_side + 1)
    end
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    return [] if @root.nil?
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
