require 'pry-byebug'
require 'objspace'

# representation of complete list
class LinkedList
  # add node to the end of list
  def append(value)

  end

  # add node to the beginning of the list
  def prepend(value)

  end

  # return size of the list
  def size

  end

  # return first node in the list
  def head

  end

  # return last node in list
  def tail

  end

  # find node by index
  def at(index)

  end

  # remove last node
  def pop
    
  end

  # check if list contains node with value
  def contains?(value)

  end

  # return index of node with value, or nil if doesnt exist.
  def find(value)

  end

  def to_s(node)
    #value of curr node
    curr_node = node.value
    #next node is just the object id
    next_id = node.next_node
    if next_id == nil
      puts "[ NODE #{curr_node} ] -> nil"
      return
    else
      # convert object id to reference to actual object
      next_node = ObjectSpace._id2ref(next_id)
      puts "[ NODE #{curr_node} ] ->"
      to_s(next_node)
    end
  end
end

# individual node
class Node
  attr_accessor :value, :next_node

  def initalize
    # value of the current node
    @value = nil
    # pointer to the next node in queue
    @next_node = nil
  end

end