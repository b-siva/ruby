#fibonaci
#0,1,1,2,3,5,8
def fibonacci
    prev = 0
    curr = 1
    n = 5
    i = 1
    while i < n do
       nex = prev + curr
       prev = curr
       curr = nex
       i = i + 1
    end
    puts curr
end

#fibonacci recursive
def fib_rec(n)
  return n if n <= 1
  fib_rec(n-1) + fib_rec(n-2)
end
#puts fib_rec(10)

#factorial
def factorial(n)
  return 1 if n <= 1
  n * factorial(n-1)
end
#puts factorial(5)

#factorial recursive
def fact
    n = 5
    f = 1
    1.upto(n) do |v|
       f = f * v
    end
end
#puts fact

#print ***
def print_star
    n = 5
    i = 1
    m = 2 * n
    while i <= m do
       j = i > n ? m - i : i
       puts '*' * j
       i = i + 1
    end
end

#binary search
array = [1,2,3,4,5,6,7,8]

def bsearch(array, low, high, val)
    return "'#{val}' not found" if high < low
    index = (low + high) / 2
    pivot = array[index]
    if pivot == val
        return "Value #{val} found at index #{index}"
    elsif val > pivot
        bsearch(array, index + 1, high, val)
    else
        bsearch(array, low, index - 1, val)
    end
end
#puts bsearch(array, 0, array.length - 1, 10)


#merge sort
array = [2,19,7,6,20,1,17,15]

def split(array)
    return array if array.length <= 1
    mid = array.length / 2
    left = array[0...mid]
    right = array[mid...array.length]
    merge(split(left), split(right))
end

def merge(left, right)
    final = []
    until left.empty? || right.empty? do
        if left.first <= right.first
            final << left.shift
        else
            final << right.shift
        end
    end
    final.concat(left).concat(right)
end
#puts split(array).inspect

#reverse number
def reverse_number
  number = 12345
  tmp = 0
  while number != 0 do
    tmp = tmp * 10 + (number % 10)
    number = number / 10
  end
  puts tmp
end
#reverse_number


#quicksort
array = [2,19,7,6,20,1,17,2,15]

def quicksort(array)
    length = array.length
    return array if length <= 1
    pivot = array[length/2]
    left = []
    right = []

    for i in array
        if i < pivot
            left << i
        elsif i > pivot
            right << i
        end
    end
    quicksort(left).concat([pivot]).concat(quicksort(right))
end

#puts quicksort(array).inspect

#ruby reverse bang
class String
    def reversemyown!
        length = self.length
        i = 0
        j = length - 1
        while i <= j do
          self[i], self[j] = self[j], self[i]
          i = i + 1
          j = j - 1
        end
        return self
    end
end
#puts "hello world".reversemyown!

#reverse String
def reverse_str(str, low, high)
    return str if high <= low
    str[low], str[high] = str[high], str[low]
    reverse_str(str, low+1, high-1)
end
str = 'Hello World'
#puts reverse_str(str, 0, str.length - 1).inspect

#palindrome
def palindrome
   txt = 'ssiiss'
   length = txt.length
   i = 0
   j = length - 1
   flag = true
   while flag && i<=j do
      flag = txt[i] == txt[j] ? true : false
      i = i + 1
      j = j - 1
   end
   puts "palindrome is #{flag}"
end
#palindrome

#palindrom rec
def palindrome_rec(txt, flag, i, j)
    return 'not palindrome' if !flag
    return flag if j < i
    if txt[i] == txt[j]
        palindrome_rec(txt, flag, i+1, j-1)
    else
        palindrome_rec(txt, false, i+1, j-1)
    end
end
txt = 'ssiiss'
#puts palindrome_rec(txt, true, 0, txt.length-1)


#prime or not
def prime(number, div)
    return 'prime' if number <= 3 || div < 2
    if number % div == 0
       return 'not prime'
    else
        prime(number, div - 1)
    end
end
number = 13
#puts prime(number, number -1 )

#quick select or find kth value from n array
array = [2,19,7,6,20,1,17,2,15]
m = 2
k = array.length - m
def quickselect(array, k)
    length = array.length
    return 'not found' if length <= 1
    mid = array[length/2]
    left = []
    right = []
    array.each do |i|
        if i < mid
            left << i
        elsif i > mid
            right << i
        end
    end

    if k <= left.length
        quickselect(left, k)
    elsif k > (length - right.length)
        quickselect(right, k - (length - right.length))
    else
        return mid
    end

end

#puts quickselect(array, k)

#insertion sort
array = [2,19,7,6,20,1,17,2,15]
def insertion(array)
   for i in 1..array.length-1
      j = i
      while j > 0 && array[j-1] > array[j] do
        array[j-1], array[j] = array[j], array[j-1]
        j = j - 1
      end
   end
   return array
end
#puts insertion(array).inspect

#selection sort
array = [2,19,7,6,20,1,17,2,15]
def selection(array)
    for i in 0..array.length-1
        min = i
        for j in i+1..array.length-1
            min = j if array[j] < array[min]
        end
        array[i], array[min] = array[min], array[i] if min != i
    end
    return array
end
#puts selection(array).inspect

#bubble sort
array = [2,19,7,6,20,1,17,2,15]
def bubblesort(array)
    flag = true
    while flag do
        flag = false
        for i in 0..array.length-2
           if array[i] > array[i+1]
              flag = true
              array[i], array[i+1] = array[i+1], array[i]
           end
        end
    end
    return array
end
#puts bubblesort(array).inspect

#singly linked list
class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
  end

  def each
  end
end



root = Node.new(10)
list = [20,30,40,50]
prev = root
list.each do |l|
   current = Node.new(l)
   prev.next = current
   prev = current
end

current = root
prev = nil
value = 0
while current do

  if current.data == 70
     if prev
       prev.next = current.next
     else
       root = current.next
     end
     break
  end
  value += current.data
  prev = current
  nex = current.next
  current = nex

end
#puts root.inspect
#puts value


class Node
  attr_accessor :data, :left, :right
  def initialize(data, left=nil, right=nil)
     @data = data
  end
end
root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)

#puts root.inspect

def max_height(node)
  return 0 unless node
  ldepth = max_height(node.left)
  rdepth = max_height(node.right)
  puts "#{ldepth}-#{rdepth} => #{node.data}"
  return [ldepth, rdepth].max + 1

end
#puts "MAX Height of tree is #{max_height(root)}"

def min_height(node)
  return 0 unless node
  ldepth = min_height(node.left)
  rdepth = min_height(node.right)
  puts "#{ldepth}-#{rdepth} => #{node.data}"
  return [ldepth, rdepth].min + 1

end

#puts "MIN Height of tree is #{min_height(root)}"

def perfectnumber
  number = 28
  tmp = 0
  1.upto(number/2) do |num|
    if number % num == 0
      puts num
      tmp = tmp + num
    end
  end
  puts tmp
end

