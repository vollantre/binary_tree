class Node
  attr_accessor :value, :parent, :left, :right
  def initialize(value = nil, parent = nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end
end

class BinaryTree
  def initialize(root = nil)
    @root = root
  end
  
  def build_tree(ary)
    @root = Node.new(ary.shift)
    ary.each {|value| generate_node(value, @root)}
  end

  def generate_node(value, tmp)
    node = Node.new(value)
    until node.parent
      if value < tmp.value
        if tmp.left.nil?
          node.parent = tmp
          tmp.left = node
        else
          tmp = tmp.left
        end
      else
        if tmp.right.nil?
          node.parent = tmp
          tmp.right = node
        else
          tmp = tmp.right
        end
      end
    end
  end

  def breadth_first_search(target_value)
    queue = [@root]
    until queue.empty?
      leaving = queue.shift
      return leaving if target_value == leaving.value
      queue << leaving.left unless leaving.left.nil?
      queue << leaving.right unless leaving.right.nil?
    end
    nil
  end

  def depth_first_search(target_value)
    stack = [@root]
    until stack.empty?
      leaving = stack.pop
      return leaving if target_value == leaving.value
      stack << leaving.left unless leaving.left.nil?
      stack << leaving.right unless leaving.right.nil?
    end
    nil
  end

  def dfs_rec(target_value, node = @root)
    return node if node.nil? || node.value == target_value
    target_node = dfs_rec(target_value, node.left)
    target_node = dfs_rec(target_value, node.right) unless target_node
    target_node
  end
end