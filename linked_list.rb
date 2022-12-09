require 'pry-byebug'
require 'objspace'

# representation of complete list
class LinkedList
  attr_reader :size, :head, :tail

  def initialize(head)
    @size = size
    @head = head
    @tail = nil
  end

  # add node to the end of list
  def append(value)
  end

  # add node to the beginning of the list
  def prepend(value)

  end

  # return size of the list
  def size
    size = 0
    # if no size has been specified for instance variable
    if @size == nil
      # iterate through list until last node
      until next_id == nil
        if size.zero?
          curr_node = @head
        end
        # value of curr node
        curr_node = node.value
        # next node is just the object id
        next_id = node.next_node
        # convert object id to reference to actual object
        next_node = ObjectSpace._id2ref(next_id)
        size += 1
        curr_node = next_node
      end
    end
    # return size
    size
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
  attr_reader :value
  attr_accessor :next_node

  def initialize(value=nil)
    # value of the current node
    @value = value
    # pointer to the next node in queue
    @next_node = nil
  end

end

list = LinkedList.new

# some random nodes to store in our list
joe = Node.new('joe')
carly = Node.new('carly')
jill = Node.new('jill')
sam = Node.new('sam')
bob = Node.new('bob')

#link the nodes by assigning the object id
joe.next_node= carly.object_id
carly.next_node= jill.object_id
jill.next_node= sam.object_id
sam.next_node = bob.object_id
# bob has no next node

list.to_s(joe)
list.size