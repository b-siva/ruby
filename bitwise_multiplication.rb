a = 10
b = 3 # a>b
result = 0
while(b!=0) do #itetate till b==0
  if(b&01) #bitwise & of the value of b with 01
    result = result + a  #add a to result if b is odd
  end
  a <<= 1  # left shifting the value contained in 'a' by 1, multiplies a by 2 for each loop
  b >>= 1  #right shifting the value contained in b by 1
end
#puts result

class List
  attr_accessor :data, :nxt
  def initialize(data, nxt = nil)
    @data = data
    @nxt = nxt
  end

  def traverse
    current = self
    until current.nil? do
      puts current.data
      current = current.nxt
    end
  end

  def delete_kth_node
    count = 2
    prev = self
    current = prev.nxt
    until current.nil? do
      if count % 2 == 0
        prev.nxt = current.nxt
      else
        prev = current
      end
       current = current.nxt
       count += 1
    end
    self
  end

  def delete_node(x)
    prev = self
    current = prev.nxt
    return prev = current if prev.data == x

    until current.nil? do
      if current.data == x
        prev.nxt = current.nxt
        break
      end
      prev = current
      current = current.nxt
    end
    self
  end

  def reverse
    current = self
    prev = nil
    until current.nil? do
      nxt = current.nxt
      current.nxt = prev
      prev = current
      current = nxt
    end
    prev
  end


end




node = List.new(1)
node.nxt = List.new(2)
node.nxt.nxt = List.new(3)
node.nxt.nxt.nxt = List.new(4)
node.nxt.nxt.nxt.nxt = List.new(5)
# puts node.inspect
# puts '---'
# reverse = node.reverse
# puts reverse.inspect
#node.traverse
#puts node.delete_node(2).inspect
puts node.delete_kth_node.inspect

def print_path(n, parent)
  stack = []
  while !n.nil? do
    stack.push(n.data)
    n = parent[n]
  end

  sum = stack.inject(0) { |mem, var|  mem += var}
  while !stack.empty? do
    print stack.pop
  end

  return sum

end

def root_to_leaf(node, s)
  return if node.nil?
  parent = {}
  parent[node] = nil
  q = [node]

  while !q.empty? do
    n = q.shift
    if n.left.nil? && n.right.nil?
        return true if print_path(n, parent) == s
    end

    if n.left
        parent[n.left] = n
        q.push(n.left)
    end

    if n.right
        parent[n.right] = n
        q.push(n.right)
    end
  end

end

    #     1
    #    / \
    #   2   3
    #  / \
    # 4   5
    #    / \
    #   6   7
    #      /

# def left_view(root, level, maxlevel)
#     return if root.nil?
#     if maxlevel.first < level
#         puts root.data
#         maxlevel[0] = level
#     end
#     left_view(root.left, level + 1, maxlevel)
#     left_view(root.right, level + 1, maxlevel)
# end
# left_view(root, 1, [0])


# def max_path_sum(root, res)
#   return 0 if root.nil?

#   ls = max_path_sum(root.left, res)
#   rs = max_path_sum(root.right, res)

#   max_single = [[ls, rs].max + root.data, root.data]
#   max_top = [max_single, ls+rs+root.data].max
#   res[0] = [res[0], max_top].max
#   return max_single

# end

# def max_path_sum_leaf_nodes(root, res)
#   return 0 if root.nil?
#   return root.data if root.left.nil? && root.left.nil?

#   ls = max_path_sum_leaf_nodes(root.left, res)
#   rs = max_path_sum_leaf_nodes(root.right, res)

#   if root.left && root.right

#     res[0] = [res[0], ls + rs + root.data].max
#     return [ls, rs].max + root.data
#   end

#   return root.left ? ls + root.data : rs + root.data


# end

# def print_s_d_util(s, d, path, index, graph)

# end

# def print_all_s_d_path
#     path = []
#     index = 0
#     visited = []
#     print_s_d_util(s, d, path, index, visited)
# end

# Input : Dict - {"go","bat","me","eat","goal", "boy", "run"}
#         arr[] = {'e','o','b', 'a','m','g', 'l'}
# Output : go, me, goal.

dict = ["go","bat","me","eat","goal", "boy", "run"]
arr = {'e' => true,'o' => true,'b' => true, 'a' => true,'m' => true,'g' => true, 'l' => true}

dict.each do |item,index|
    flag = true
    item.each_char do |c|
        flag = false unless arr[c]
    end
    puts item if flag
end

def print_distinct_element
  arr = [1,2,3,3,3,4,5,5,5,6,7,7]
  i = 1
  prev = arr[0]
  puts prev
  while i < arr.length - 1 do
    puts arr[i] if arr[i] > prev
    prev = arr[i]
    i += 1
  end
end
#print_distinct_element

def print_unique_element
  arr = [1,2,3,3,3,4,5,5,5,6,7,7]
  i = 0
  prev = -1
  while i < arr.length - 2 do
    puts "#{i} - #{arr[i]}" if arr[i] > prev && arr[i] < arr[i+1]
    prev = arr[i]
    i += 1
  end
end
puts "unique element from sorted array"
#print_unique_element

def max_sum_array
  # -1, -2, 4, 1, -2, -1, 1, -2, 5, -3, 6, 7
  # -2, -3, 4, -1, -2, 1, 5, -3
  arr = [-2,-1,-3]
  i = 0
  start = 0
  e_nd = 0
  sum = 0
  max = -100

  max_so_for = -100
  max_end_here = 0

  while i < arr.length do
    max_end_here += arr[i]

    if max_so_for < max_end_here
        max_so_for = max_end_here
    end
    if max_end_here < 0
        max_end_here = 0
    end
    i+=1
  end



  # while i < arr.length do
  #   sum += arr[i]

  #   if max < sum || max < 0
  #       max = sum
  #       while start < i && (sum - arr[start]) > max  do
  #           puts "#{i} - #{start}"
  #           sum = sum - arr[start]
  #           start += 1
  #       end
  #       e_nd = i
  #   end

  #   i += 1
  # end
  # puts "#{start} - #{e_nd} => #{sum}, #{max}, answ: #{sum > max ? sum : max} "
  puts max_so_for
end

# max_sum_array
# puts ""

# 6, 3, -1, -3, 4, -2, 2, 4, 6, -12, -7
# sum = 0 + 6 => 6, map = {6 => [0]}
# sum = 3 + 6 => 9, map = {6 => [0], 9 => [1]}
# sum = -1 + 9 => 8, map = {6 => [0], 9 => [1] 8 => [2]}
# sum = -3 + 8 => 5, map = {6 => [0], 9 => [1] 8 => [2] 5 => [3]}
# sum = 4 + 5 => 9, map = {6 => [0], 9 => [1,4] 8 => [2] 5 => [3]}, index => 2,4
# sum = -2 + 9 => 7, map = {6 => [0], 9 => [1,4] 8 => [2] 5 => [3], 7 => [5]}
# sum = 2 + 7 => 9, map = {6 => [0], 9 => [1,4,6] 8 => [2] 5 => [3], 7 => [5]}index => 2,4; 5,6


# "hello world" => 'hewrd'

def compact
  a = [nil,nil,1,2,nil,3,4,nil,nil,nil,5,6,7,nil]
  i = 0
  while i < a.length do
    if !a[i].nil?
        j = i - 1
        s = i
        while j >= 0  do
            a[s], a[j] = a[j], a[s] if a[j].nil?
            j -= 1
            s -= 1
        end
    end
    i += 1
  end

  k = a.length - 1
  while k >= 0 do
    a.pop if a[k].nil?
    k -= 1
  end
  puts a.inspect

end
compact

# 1,2,3,4,1,5,6,2,1,10
# 1,2,3,4,nil,5,6,nil,nil,10

def conse_second_arr_in_first
  first = [4,6,7,1,6,2,8,9,5,3,2,9,8,4,6]
  second = [6,1,2,9,8]
  pat_hash = {}
  second.each do |item|
    pat_hash[item] = pat_hash[item] ? pat_hash[item] + 1 : 1
  end

  start = -1
  count = 0
  final_count = second.length
  start_index = -1
  final_index = -1
  i = 0
  while i < first.length do
    item = first[i]
    if pat_hash[item]
      count += 1
      start = i if start == -1
    else
      count = 0
      start = -1
    end

    if count == final_count
        start_index = start
        final_index = i
    end
    i += 1
  end

  if start_index != -1
    puts "start is #{start_index} - end is #{final_index}"
  else
    puts "no such window"
  end

end
conse_second_arr_in_first

def sort_0_1
    array =  [1,1,0,0,1,1,1,0,1,0]
    i = 0
    j = array.length - 1

    while i < j do

        while array[i] == 0 && i < j do
          i += 1
        end

        while array[j] == 1 && j > i do
            j -= 1
        end

        if ( i < j )
          array[i], array[j] = array[j], array[i]
        end
        puts array.inspect
    end
    puts array.inspect
end

#sort_0_1


def inplace_decrypt
    a = ["a", 3, "b", 4, "c", 3, nil, nil, nil, nil]
    # a = ['a',1,'b',1,'c',1]
    #0 1 2 3 4 5 6 7 8 9
    i = 0
    last = a.length - 1
    start = 0

    while i < a.length do
        if a[i].nil?
            start = i - 1
            break
        end
        i += 1
    end

    start = a.length - 1 if start == 0

    while start > 0 do
      num = a[start]
      char = a[start - 1]
      start -= 2

      j = 0
      while j < num do
        a[last] = char
        last -= 1
        j += 1
      end
    end
    puts "a is #{a.inspect}"
end
inplace_decrypt

# 1 2 3 4
# 5 6 7 8
# 9 10 11 12
# 13 14 15 16

# 1 2 3 4 8 12 16 15 14 13 9 5 6 7 11 10

# 0 1 2 3 7 11 15 14 13 12 10 9 8 4 5 6
#  1 2 3 4 7 => 28 - 17 = 11

# 1  4  3   4   5
# 0  4 -3   -4  -5

# 123  0,0  0,1 0,2
# 456  1,0  1,1 1,2
# 789

# 147  0,0 1,0 2,0
# 258  0,1 1,1 2,1
# 369


# Input
#  1  2  3
#  4  5  6
#  7  8  9

# Output:
#  3  6  9
#  2  5  8
#  1  4  7

# for j = 2; j > 0; j --
#     for i = 0; i < m; i ++
#         [i][j]
#         [0][2], [1][2], [2][2]
#         [0][1], [1][1], [2][1]
#         [0][0], [1][0], [2][0]

# 12345678910
# 92745638110

#     int lo = 0;
#     int hi = arr_size - 1;
#     int mid = 0;

#     while (mid <= hi)
#     {
#         switch (a[mid])
#         {
#         case 0:
#             swap(&a[lo++], &a[mid++]);
#             break;
#         case 1:
#             mid++;
#             break;
#         case 2:
#             swap(&a[mid;ethj,m  v     v ], &a[hi--]);
#             break;
#         }
#     }


# 11 00 22
# 1) low = 0; mid = 1; hi = 6 => 11 00 22 1
# 2) low = 0; mid = 2; hi = 6 => 11 00 22 1
# 3) low = 1; mid = 3; hi = 6 => 01 10 22 1
# 4) low = 2; mid = 4; hi = 6 => 00 11 22 1
# 5) low = 2; mid = 4; hi = 6 => 00 11 22 1
# 5) low = 2; mid = 4; hi = 5 => 00 11 12 2
# 5) low = 2; mid = 4; hi = 4 => 00 11 12 2
# 5) low = 2; mid = 4; hi = 3 => 00 11 12 2


# def find_word_index
#     content = 'geeks for geeks'
#     word = 'geeks'

#     i = 0
#     n = content.length
#     m = word.length
#     index_arry = []
#     while i < n do
#         start = i
#         j = 0
#         while j < m  &&  content[i] == word[j] do
#           i += 1
#           j += 1
#         end
#         index_arry.push(start) if start != i
#         i += 1
#     end
#     puts index_arry.inspect
# end
# find_word_index

def closest_sum_0
  array = [-1, 3, 2, -5, 4]
  start = 0
  e_nd = 0
  min_diff = 1000
  prefix_array = { 0 => array[0]  }
  i = 1
  while i < array.length do
    prefix_array[i] = prefix_array[i-1] + array[i]
    i += 1
  end
  puts prefix_array.inspect
  prefix_array = prefix_array.sort_by {|key, value| value}
  puts prefix_array.inspect

  j = 1
  while j < prefix_array.length do
    diff = prefix_array[j][1] - prefix_array[j-1][1]

    if min_diff > diff
        min_diff = diff
        start = prefix_array[j-1][0]
        e_nd = prefix_array[j][0]
    end
    j += 1
  end
  puts "#{start + 1} - #{e_nd}"

end
closest_sum_0

def max_product_subarray
    max = [];
    min = []
    nums = [6, -3, -10, 0, 2]

    max[0] = min[0] = nums[0];
    result = nums[0];
    i = 1
    while (i < nums.length - 1) do
        if nums[i] > 0
           max[i] = [nums[i], max[i - 1] * nums[i]].max
           min[i] = [nums[i], min[i - 1] * nums[i]].min
        else
           max[i] = [nums[i], min[i - 1] * nums[i]].max
           min[i] = [nums[i], max[i - 1] * nums[i]].min
        end
        result = [result, max[i]].max
        i += 1
    end
    puts max.inspect
    puts min.inspect

    puts result
end

max_product_subarray

def max_sum_subarray
    a = [-2,1,-3,4,-1,2,1,-5,4]
    newsum = a[0]
    max = a[0]
    i = 1
    while i < a.length do
        newsum = [a[i], newsum + a[i]].max
        max = [newsum, max].max
        i += 1
    end
    puts max
end
max_sum_subarray

def dutch_national_flag
    a = [0, 1, 1, 0, 2, 2, 0, 1]
    low = 0
    mid = 0
    high = a.length - 1
    while mid <= high do
        case a[mid]
        when 0
            a[low], a[mid] = a[mid], a[low]
            low += 1
            mid += 1
        when 1
            mid += 1
        when 2
            a[mid], a[high] = a[high], a[mid]
            high -= 1
        end
    end
    puts a.inspect
end
dutch_national_flag

# 1 => [0, 1, 1, 0, 2, 2, 0, 1] , low = 1, mid = 1, high = 7
# 2 => [0, 1, 1, 0, 2, 2, 0, 1] , low = 1, mid = 2, high = 7
# 3 => [0, 1, 1, 0, 2, 2, 0, 1] , low = 1, mid = 3, high = 7
# 4 => [0, 0, 1, 1, 2, 2, 0, 1] , low = 2, mid = 4, high = 7
# 5 => [0, 0, 1, 1, 1, 2, 0, 2] , low = 2, mid = 4, high = 6
# 6 => [0, 0, 1, 1, 1, 2, 0, 2] , low = 2, mid = 5, high = 6
# 7 => [0, 0, 1, 1, 1, 0, 2, 2] , low = 2, mid = 5, high = 5
# 8 => [0, 0, 0, 1, 1, 1, 2, 2] , low = 3, mid = 6, high = 5

# 1010100011 => o: 4, e: 1 => e - o => 4 - 1 => 3
# 1010100100 => o: 4, e: 1

def min_distance_ascending_order
    m = [
        [1, 1, 0, 5],
        [0, 1, 1, 4]
    ]
    asc_ar = []
    i = 0
    while i < m.length do
      j = 0
      while j < m[i].length do
        asc_ar.push(m[i][j]) if m[i][j] > 1
        j += 1
      end

      i += 1
    end
    asc_ar.sort!
    puts asc_ar.inspect

    def dfs(m, asc_ar, visited, stack, neigh, count ,final_count)
        puts "stack - #{stack.inspect}"
        return final_count if stack.empty?
        top = stack.pop.split('-')
        r = top[0].to_i
        c = top[1].to_i
        neigh.each do |ele|
            row = r + ele[0]
            col = c + ele[1]
            if row >=0 && col >=0 && row < m.length && col < m[0].length
                loc = "#{row}-#{col}"
                if m[row][col] == 1 && !visited.include?(loc)
                    visited.push(loc)
                    stack.push(loc)
                    dfs(m, asc_ar, visited, stack, neigh, count + 1, final_count)
                elsif m[row][col] > 1

                    if m[row][col] == asc_ar.first
                        final_count[0] = final_count[0] + count
                        asc_ar.shift
                        count = 1
                        if asc_ar.length > 0
                           stack = [loc]
                        else
                            stack = []
                        end

                        dfs(m, asc_ar, visited, stack, neigh, count, final_count)
                    else
                        return
                    end
                end
            end
        end
    end

    def find_path(m, asc_ar)
        loc = "#{0}-#{0}"
        stack = [loc]
        visited = []
        neigh = [[0, -1], [0, 1], [-1, 0], [1, 0]]
        final_count = [0]

        if m[0][0] == 1
            stack = [loc]
            visited = [loc]
            dfs(m, asc_ar, visited, stack, neigh, 1, final_count)
            puts final_count[0]
        else
            puts "no path "
        end

    end
    find_path(m, asc_ar)

end

min_distance_ascending_order


def find_words

    def find_words_path(m, dic, str, visited, i, j, neigh)
        visited.push("#{i}-#{j}")
        str = str + m[i][j]


        puts str if dic.include?(str)

        neigh.each do |ele|
            row = i + ele[0]
            col = j + ele[1]
            loc = "#{row}-#{col}"
            if row >=0 && col >=0 && row < m.length && col < m[0].length && !visited.include?(loc)

                find_words_path(m, dic, str, visited, row, col, neigh)
            end
        end

        str.chop
        visited.delete("#{i}-#{j}")
    end

    m = [
          ['G','I'],
          ['U','O']
        ]
    dic = ["FOR", "QUIZ", "GO"]
    neigh = [[0,-1], [0,1], [-1,0], [-1,-1], [-1, 1], [1,0], [1, -1], [1,1]]

    visited = []
    str = ""
    for i in 0...m.length
        for j in 0...m[i].length
            find_words_path(m, dic, str, visited, i, j, neigh)
        end
    end
end

find_words
# a = 2
# if ( (i != a) && (knows(a, i) || !knows(i, a)) )
# a=2, i =0 => 0 != 2 && 2,0 || !0,2 => false
# a=2, i =1 => 1 != 2 && 2,1 || !1,2 => false
# a=2, i =2 => 2 != 2 && 2,2 || !0,2 => false
# a=2, i =3 => 0 != 2 && 2,3 || !3,2 => false

# mango
# m - 1
# a - 1
# n - 1
# g - 1
# o - 1
# vow - 2
# con - 3

# ao
# gmn

# gamon
# aabbcdce
# ab ab cd
# d => 1
# e => 1
# c => 2
# a => 2
# b => 2

# ab ab ce cd

class Trie < Hash
    def initialize
        super
    end

    def build(str)
        str.chars.inject(self) {|h, c| h[c] ||= {}}
    end

    def find(str)
        flag = true
        h = self
        str.chars.each do |c|
            puts h.inspect
            if h[c]
                h = h[c]
            else
                flag = false
                break
            end
        end
        return flag
    end
end

t = Trie.new
t.build('hello')
t.build('hi')
t.build('attorney')
t.build('at')
#puts t
#puts t.find('atthe')

