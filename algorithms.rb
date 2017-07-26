#create a Binary tree
class Node
    attr_accessor  :value, :left, :right
    def initialize(value, left, right)
        @left = left
        @right = right
        @value = value
    end
end

right = Node.new(3, nil, nil)
left = Node.new(1, nil, nil)
root = Node.new(2, left, right)
#puts root.inspect


#create balanced binary tree from given sorted array
array = [1,2,3,4,5,6,7,8,9]

def build_tree(arr, start, end_v)
    return nil if start > end_v
    length = arr.length
    mid = length/2
    root = Node.new(arr[mid], nil, nil)
    root.left = build_tree(arr[0..mid-1], 0, mid-1)
    root.right = build_tree(arr[mid+1..length-1], mid+1, length-1)
    root
end

binary_tree = build_tree(array, 0, array.length-1)
# puts binary_tree.left.value.inspect
# puts binary_tree.right.value.inspect


#inorder traversal
def inorder(root)
    inorder(root.left) if root.left
    puts root.value
    inorder(root.right) if root.right
end
puts "inorder"
inorder(binary_tree)

#preorder traversal
def preorder(root)
    puts root.value
    preorder(root.left) if root.left
    preorder(root.right) if root.right
end
puts "preorder"
preorder(binary_tree)

#postorder traversal
def postorder(root)
    postorder(root.left) if root.left
    postorder(root.right) if root.right
    puts root.value
end
puts "postorder"
postorder(binary_tree)

#height of tree
def height_of_tree(tree)
    return 0 unless tree
    l = height_of_tree(tree.left)
    r = height_of_tree(tree.right)
    return [l, r].max + 1
end

puts "max height of tree"
puts height_of_tree(binary_tree)

#create single linked list
class LNode
    attr_accessor :value, :nxt
    def initialize(value, nxt)
        @value = value
        @nxt = nxt
    end
end

def build_list(list, arr, index)
    return if index == arr.length - 1
    list.nxt = LNode.new(arr[index], nil)
    build_list(list.nxt, arr, index + 1)
end

list = LNode.new(array[0], nil)
build_list(list, array, 1)
puts list.inspect

#traverse list
# puts "traversing the list"
# until list.nxt.nil? do
#     puts list.value
#     list = list.nxt
# end

#traverse list with two pointers
puts "traverse list with two pointers"
slow = list
fast = list
current = list

# until fast.nxt.nxt.nil? do
#     fast =  fast.nxt.nxt
#     slow = slow.nxt
#     current = current.nxt
# end
#finds the middle element
puts list.inspect
puts slow.inspect
right = slow.nxt.nxt
puts right.inspect

#flight source-destination problem


#diamond * print problem
def print_diamond(n)
    i = 1
    mid = (n/2 + 1).floor

    while i <= n do
        space = i > mid ? i - mid : mid - i
        star = i > mid ? 2*(n - i) + 1 : (2 * i) - 1
        print ' ' * space
        print '*' * star
        puts
        i += 1
    end
end
print_diamond(5)


#kth largest/smallest
def kth_number(arr, k)
    length = arr.length
    mid = length/2
    pivot = arr[mid]
    left = []
    right = []
    arr.each do |item|
        if item < pivot
            left << item
        elsif item > pivot
            right << item
        end
    end
    if right.length >= k
        kth_number(right, k)
    elsif k > length - left.length
        kth_number(left, k - (length - left.length) )
    else
        return pivot
    end
end
k_arry = [7,1,10,5,19,75,2,8,23]
puts k_arry.sort.inspect
puts kth_number(k_arry,7).inspect

#island problem
class GroupOFIslands
    attr_accessor :graph, :row, :col, :visited, :neighbours, :count

    def initialize(graph)
        @graph = graph
        @row = graph.length - 1
        @col = graph[graph.length-1].length
        @count = 0
        @visited = {}
        @neighbours = [[0,-1], [0,1], [-1,0], [-1,-1], [-1, 1], [1,0], [1, -1], [1,1]]
    end

    def find_islands(stack)
        return 1 if stack.empty?
        item = stack.pop

        unless @visited.has_key?(item)
            @visited[item] = true #mark as visited
            k = item.split('-').first
            l = item.split('-').last


            @neighbours.each do |neighbour|
                r = neighbour.first + k.to_i
                c = neighbour.last + l.to_i

                if r >= 0 && r <= @row && c >= 0
                    if @graph[r][c] == 1
                        stack.push("#{r}-#{c}")
                    end
                end

            end
        end
        find_islands(stack)
    end

    def look_for_island(i, j)
        return @count if i > @row

        if @graph[i][j] == 1
            stack = ["#{i}-#{j}"]
            value = 0
            unless @visited.has_key?(stack.first)
                value = find_islands(stack)
            end

            @count += value
        end

        if @graph[i].length-1 == j
            i += 1
            j = 0
        else
            j += 1
        end

        look_for_island(i, j)
    end

end

islands = [
    [1, 1, 0, 0, 0],
    [0, 1, 0, 0, 1],
    [1, 0, 0, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 0, 1, 0, 1]
]
print "number of islands: - "
print GroupOFIslands.new(islands).look_for_island(0,0)
puts

#kth window problem
class WindowProblem
    attr_accessor :arr, :k, :dq, :i
    def initialize(arr, k)
        @arr = arr
        @k = k
        @dq = []
        @i = 0
    end

    def first_window
        while @i < 3 do
            #remove from back when last value is less than current one
            #interest in keeping only the large elements discarding small
            while !@dq.empty? && @arr[@dq.last] <= @arr[@i]  do
                @dq.pop
            end
            @dq.push(@i)
            @i += 1
        end
        rest_of_window
    end

    def rest_of_window
        while @i < @arr.length do
            #hint - can do by wrapping if @i >= 3
            #and avoid first_window
            puts @arr[@dq.first]
            #Remove from begining if out of window
            while !@dq.empty? && @dq.first <= @i - @k do
                @dq.shift
            end

            while !@dq.empty? && @arr[@dq.last] <= @arr[@i]  do
                @dq.pop
            end
            @dq.push(@i)
            @i += 1
        end
        puts @arr[@dq.first]
    end
end

warr = [1, 2, 3, 1, 4, 5, 2, 3, 6]
k = 3
WindowProblem.new(warr, 3).first_window

#Build graph
class GNode
    attr_accessor :name, :successors
    def initialize(name)
        @name = name
        @successors = []
    end

    def connect_node(successor)
        @successors << successor
    end
end

class Graph
    attr_accessor :nodes
    def initialize
        @nodes = {}
    end

    def add_node(node)
        @nodes[node.name] = node
    end

    def add_edge(predecessor_name, successor_name)
        @nodes[predecessor_name].connect_node(successor_name)
    end
end

graph = Graph.new
graph.add_node(GNode.new('a'))
graph.add_node(GNode.new('b'))
graph.add_node(GNode.new('c'))
graph.add_node(GNode.new('d'))
graph.add_node(GNode.new('e'))
graph.add_node(GNode.new('f'))
graph.add_node(GNode.new('g'))
graph.add_edge('a', 'b')
graph.add_edge('a', 'c')
graph.add_edge('b', 'c')
graph.add_edge('b', 'd')
graph.add_edge('b', 'f')
graph.add_edge('d', 'e')
graph.add_edge('c', 'g')
graph.add_edge('g', 'c')
puts graph.inspect

#depth first travel
class DFS
    attr_accessor :stack, :graph, :visited, :path
    def initialize(graph)
        @graph = graph
        @stack = []
        @visited = []
        @path = []
    end

    def start
        first = @graph.nodes.first
        @stack.push(first.first)
        traverse
        puts "DFS - #{@path.inspect}"
    end

    def traverse
        until @stack.empty? do
            top = @stack.last
            unless @visited.include?(top)
                node = @graph.nodes[top]
                @path.push(node.name)
                @visited.push(top)
                node.successors.each do |n|
                    @stack.push(n)
                    traverse
                end
            else
                @stack.pop
            end
        end
    end

end

DFS.new(graph).start

#Breadth First
class BFS
    attr_accessor :graph, :queue, :visited, :paths

    def initialize(graph)
        @graph = graph
        @visited = []
        @path = []
        @queue = []
    end

    def start
        first = @graph.nodes.first
        @queue.push(first.first)
        traverse
        puts "BFS - #{@path.inspect}"
    end

    def traverse
        until @queue.empty? do
            first = @queue.first
            unless @visited.include?(first)
                @path.push(first)
                @visited.push(first)
                @queue.shift
                @graph.nodes[first].successors.each do |n|
                    @queue.push(n)
                end
                traverse
            else
                @queue.shift
            end
        end
    end
end

BFS.new(graph).start

def findSubString(str, pat)
    len1 = str.length
    len2 = pat.length
    #check if string's length is less than pattern's
    #length. If yes then no such window can exist
    if (len1 < len2)
        return "No such window exists"

    end


    hash_pat = {}
    hash_str = {}

    #store occurrence ofs characters of pattern
    i=0
    while (i < len2) do
        hash_pat[pat[i]] = hash_pat[pat[i]] ? hash_pat[pat[i]] + 1 : 1
        i += 1
    end

    start = 0
    start_index = -1
    min_len = (2**(0.size * 8 -2) -1)


    count = 0  #count of characters
    j = 0

    #start traversing the string
    while( j < len1) do
        #count occurrence of characters of string
        hash_str[str[j]] = hash_str[str[j]] ?  hash_str[str[j]] + 1: 1

        #If string's char matches with pattern's char then increment count
        if (hash_pat[str[j]] && hash_str[str[j]] <= hash_pat[str[j]] )
            count += 1
        end

        #if all the characters are matched
        if (count == len2)

            puts str.inspect
            puts "j - #{j}"
            puts hash_str.inspect
            puts "start - #{start}"


            # Try to minimize the window i.e., check if
            # any character is occurring more no. of times
            # than its occurrence  in pattern, if yes
            # then remove it from starting and also remove
            # the useless characters.
            while( hash_str[str[start]] > ( hash_pat[str[start]] || 0) || !hash_pat[str[start]] ) do
                if (hash_str[str[start]] > ( hash_pat[str[start]] || 0 ))
                    hash_str[str[start]] -= 1
                end
                start += 1
            end

            #update window size
            len_window = j - start + 1;
            puts "#{len_window} - len_window"
            puts "#{min_len} - min_len"
            if (min_len > len_window)
                min_len = len_window
                start_index = start
            end
            puts "start again- #{start}"
        end
        puts
        j += 1
    end

    #If no window found
    if (start_index == -1)
       return "No such window exists"
    end

    #Return substring starting from start_index and length min_len
    return str[start_index...start_index + min_len]

end
str = "this is a test string"
pat = "tist"
# str = "aaaatbcaaaafdbcbbbaaacb"
# pat = "abc"
puts findSubString(str, pat)

#Find the maximum path sum between two leaves of a binary tree
def max_path_sum_util(root, res)
    return 0 if root.nil?
    return root.value if root.left.nil? && root.right.nil?

    ls = max_path_sum_util(root.left, res)
    rs = max_path_sum_util(root.right, res)
    puts "root - #{root.value}, ls- #{ls}, rs- #{rs}, #{res[0]}"


    #If both left and right children exist
    if (root.left && root.right)
        #Update result if needed
        res[0] = [res[0], ls + rs + root.value].max

        # Return maxium possible value for root being on one side
        return [ls, rs].max + root.value
    end

    # If any of the two children is empty, return root sum for root being on one side
    return root.left ? ls + root.value : rs + root.value
end

def max_path_sum(root)
    res = [ -(2**(0.size * 8 -2))]
    max_path_sum_util(root, res)
    puts res.first.inspect
end


root_p = Node.new(-15, nil, nil)
root_p.left = Node.new(5, nil, nil)
root_p.right = Node.new(6, nil, nil)
root_p.left.left = Node.new(-8, nil, nil)
root_p.left.left.left = Node.new(30, nil, nil)
root_p.left.right = Node.new(1, nil, nil)
root_p.right.left = Node.new(3, nil, nil)
root_p.right.right = Node.new(9, nil, nil)

puts root_p.inspect
max_path_sum(root_p)
