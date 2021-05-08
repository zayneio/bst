require 'pry'

class BST
  attr_accessor :root

  def initialize(node)
    @root = node
  end

  def insert(node)
    current_node = root

    loop do
      break false if node.value == current_node.value

      if node.value > current_node.value
        break current_node.right = node if current_node.right.nil?        
        next current_node = current_node.right
      end

      if node.value < current_node.value
        break current_node.left = node if current_node.left.nil?
        next current_node = current_node.left
      end
    end
  end

  def search(target)
    current_node = root

    count = 0
    loop do
      count += 1
      puts "iterations: #{count}"
      break result = "No Match" if current_node.nil?
      break result = current_node if current_node.value == target
      
      next current_node = current_node.right if target > current_node.value
      next current_node = current_node.left if target < current_node.value
    end
  end
end

class Node
  attr_accessor :left, :right, :value
end

root = Node.new
root.value = rand(1..100)

bst = BST.new(root)

50.times do
  node = Node.new
  node.value = rand(1..100)
  bst.insert(node)
end

binding.pry

bst.root