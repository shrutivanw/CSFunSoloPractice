# TREES #
# Tree an acyclic, connected graph
# Tree with n nodes has n-1 edges
# Store info in a hierarchical way (file system)

# BINARY TREES #
# each node has at most two children
# root node is the top of the tree and has no parent
# all other nodes have 1 parent
# nodes with no children are called leaf nodes


# BINARY SEARCH TREES #
# each node contains a value
# left subtree of a node contains values that are less than *or equal to* the node's value
# right subtree of a node contains values that are greater than the node's value
# UNBALANCED BINARY SEARCH TREE #
# also called skewed
# if you ignore the null children it's pretty much a linked list
# The less balanced you lose the benefits of binary search tree
# Time complexity: O(log(n))

# the HEIGHT of a tree is defined to be the max level of any node

class Node
  attr_accessor :left_child, :right_child, :value
  def initialize(value, left_child=nil, right_child=nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def addNode(value)
    if @root == nil
      @root = Node.new(value, nil, nil)
    else
      current_node = @root
      until current_node == nil
        previous_node = current_node
        if value <= current_node.value
          current_node = current_node.left_child
        else
          current_node = current_node.right_child
        end
      end
      current_node =
    end
  end

  def SearchTheTree(value_to_find)
    new_parent = @root
    if new_parent == nil
      return false
    elsif new_parent == value_to_find
      return true
    elsif value_to_find > new_parent
      SearchTheTree(value_to_find, node.right_child)
    else
      SearchTheTree(value_to_find, node.left_child)
    end
  end

end
