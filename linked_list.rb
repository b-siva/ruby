class LinkedList
  attr_accessor :value, :next_node
  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

node1 = LinkedList.new('hello', nil)

prev_node = node1
1.upto(5) do |num|
  prev_node.next_node = LinkedList.new("value#{num}", nil)
  prev_node = prev_node.next_node
end

#puts node1.inspect

current_node = node1
while(current_node.next_node != nil) do
  puts current_node.value
  current_node = current_node.next_node
end

