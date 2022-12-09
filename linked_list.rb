require 'pry-byebug'
require 'objspace'

# representation of complete list
class LinkedList
  attr_reader :size, :head, :tail

  def initialize(head, tail)
    @size = size
    @head = head
    @tail = tail
  end

  # add node to the end of list
  def append(value)    
    # create new node for new tail
    new_tail = Node.new(value)

    #assign object id of new tail to current tail
    @tail.next_node = new_tail.object_id

    #reassign new node as tail
    @tail = new_tail
    
    p "Node created. New tail: #{@tail.value}"
  end

  # add node to the beginning of the list
  def prepend(value)
    #get copy of old head
    old_head = @head.clone
    # create new value for head, using obj_id of last head value..
    @head = Node.new(value, @head.object_id)
    p "Node created. New head: #{@head.value}"
  end

  # return size of the list
  def size
    size = 0
    # curr node (head to start)
    curr_node = @head
    # intialize next node/next id
    next_node = nil
    next_id = nil
    #until tail is reached
    until next_node == @tail
      # update size
      size += 1
      # get obj id of next node from curr_node
      next_id = curr_node.next_node
      # convert object id to reference to actual object
      next_node = ObjectSpace._id2ref(next_id)
      # set next_node as curr_node
      curr_node = next_node
    end
    # return result (plus one because loop ended)
    size + 1
  end

  # find node by index
  def at(index)

  end

  # remove last node
  def pop
    # curr node (head to start)
    curr_node = @head
    # intialize next node/next id
    next_node = nil
    next_id = nil
    #until the next_id of the curr object is equivalent to the tail
    until curr_node.next_node == @tail.object_id
      # get obj id of next node from curr_node
      next_id = curr_node.next_node
      # convert object id to reference to actual object
      next_node = ObjectSpace._id2ref(next_id)
      # set next_node as curr_node
      curr_node = next_node
    end
    # store popped object
    p "Popped #{@tail.value}"
    # reassign current node as tail
    @tail = curr_node
    curr_node
  end

  # check if list contains node with value
  def contains?(value)
    # curr node (head to start)
    curr_node = @head
    # intialize next node/next id
    next_node = nil
    next_id = nil
    
    #until value is reached
    until curr_node.value == value
      # get obj id of next node from curr_node
      next_id = curr_node.next_node
      # convert object id to reference to actual object
      next_node = ObjectSpace._id2ref(next_id)
      # set next_node as curr_node
      curr_node = next_node
      if next_node == @tail && @tail.value != value
        return false
      end
    end
    true
  end

  # return index of node with value, or nil if doesnt exist.
  def find(value)
    # curr node (head to start)
    curr_node = @head
    # intialize next node/next id
    next_node = nil
    next_id = nil

    #count amount of times iterated
    count = 1

    #until value is reached
    until curr_node.value == value
      # get obj id of next node from curr_node
      next_id = curr_node.next_node
      # convert object id to reference to actual object
      next_node = ObjectSpace._id2ref(next_id)
      # set next_node as curr_node
      curr_node = next_node
      count +=1 
      if next_node == @tail && @tail.value != value
        puts 'Value not found'
        return
      end
    end
    puts "The index of the value youre looking for is ##{count}"
  end

  def to_s
    # curr node (head to start)
    curr_node = @head
    # intialize next node/next id
    next_node = nil
    next_id = nil
    #until tail is reached
    until next_node == @tail
      # put value of current node
      puts "[ NODE #{curr_node.value} ] ->"
      # get obj id of next node from curr_node
      next_id = curr_node.next_node
      # convert object id to reference to actual object
      next_node = ObjectSpace._id2ref(next_id)
      # set next_node as curr_node
      curr_node = next_node
    end

    puts "[ NODE #{curr_node.value} ] -> nil"
  end
end

# individual node
class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value=nil, next_node=nil)
    # value of the current node
    @value = value
    # pointer to the next node in queue
    @next_node = next_node
  end

end

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
list = LinkedList.new(joe, bob)

list.to_s
p list.size
p "current tail:"
p list.tail.value
list.pop
p "current tail:"
p list.tail.value

list.prepend('sarah')

list.to_s

list.append('james')

list.to_s

list.find('carly')
list.find('jones')

p list.contains?('carly')