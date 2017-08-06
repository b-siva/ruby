def bsearch(arr, item)

    half_way = ((arr.length)/2).to_i
    return 'item not found' if arr.length == 0

    if item === arr[half_way]
        return "found"
    elsif item < arr[half_way]

         bsearch(arr.take(half_way), item)
    else
         bsearch(arr[half_way+1..arr.length-1],item)
    end
end

#puts bsearch([1,2,3,4,5,6,7,8,9,10], 10)

def bsearch1(item, arr, low, high)
  return 'not found' if high < low
  mid = ((low + high) / 2).to_i
  if arr[mid] < item
    bsearch1(item, arr, mid+1, high)
  elsif arr[mid] > item
    bsearch1(item, arr, low, mid-1)
  else
    return mid
  end
end

#puts bsearch1(5, [1,2,3,4,5,6,7,8,9,10], 0, 9)


def quicksort(array)
  return array if array.length <= 1
  pivot = array[(array.length/2)]
  #puts "#{array.inspect}, #{pivot}"
  left = []
  right = []
  track_same_value = []
  array.each do |a|
    if a < pivot
      left.push(a)
    elsif a > pivot
      right.push(a)
    elsif pivot == a
      track_same_value.push(a)
    end
  end
  quicksort(left).concat(track_same_value).concat(quicksort(right))
end

quick_array = [3,7,8,5,2,1,4,9,5,4,6,5,5]


#puts quicksort(quick_array).inspect

def mergesort_split(array)
  return array if array.length <= 1
  mid = (array.length/2).to_i
  left = array[0...mid]
  right = array[mid..array.length-1]
  merge(mergesort_split(left), mergesort_split(right))
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty? do
    if left.first <= right.first
       sorted.push(left.shift)
    else
       sorted.push(right.shift)
    end
  end
  sorted.concat(left).concat(right)
end

array = [38,27,43,3,9,82,5,5,10]
#puts mergesort_split(array).inspect

def bublesort(array, flag)
  return array if !flag
  flag = false
  for i in 0...array.length-1
    if array[i] > array[i+1]
       t = array[i]
       array[i] = array[i+1]
       array[i+1] = t
       flag = true
    end
  end
  bublesort(array, flag)
end

bubble_array = [3,7,8,5,2,1,4,9,5,4,6,5,5]

#puts bublesort(bubble_array, true).inspect

def selection(array)
  for i in 0...array.length-1
    min = i
    for j in i+1..array.length-1
      if array[j] < array[min]
        min = j
      end
    end
    array[i], array[min] = array[min], array[i] if min != i
  end
  return array
end
select_array = [38,27,43,3,9,82,5,5,10]
#puts selection(select_array).inspect

def insertion(array)
   for i in 1...array.length
      j = i
      while (j > 0 && array[j-1] > array[j]) do
          array[j-1], array[j] = array[j], array[j-1]
          j = j - 1
      end
   end
   return array
end

insert_array = [38,27,43,3,9,82,5,5,10]
#puts insertion(insert_array).inspect


number = 12345
tmp = 0
while number != 0  do
   tmp = tmp * 10 + (number % 10)
   number = number / 10
end
#puts tmp

n = 7

1.upto(n) do |num|
  num = n-num if num > n/2
  #puts '*' * num
end

def quickselect(array, k)
  #puts array.inspect
  index = (array.length/2).to_i
  pivot = array[index]
  left = []
  right = []

  array.each do |num|
    if num < pivot
      left.push(num)
    elsif num > pivot
      right.push(num)
    end
  end
  puts left.inspect
  if k == left.length
    return array[k]
  elsif k < left.length
    quickselect(left, k)
  else
    quickselect(right, k - left.length - 1)
  end
end

q_select = [5,10,23,1,7,8,3,21]

#puts quickselect(q_select, 1).inspect

def quickselect(array, pos)
  return "not found" if pos > array.length || pos < 1
  pivot = array[0]
  left = []
  right = []
  array.each do |ele|
    if pivot < ele
      left << ele
    elsif pivot > ele
      right << ele
    end
  end

  if pos <= left.length
    quickselect(left, pos)
  elsif pos > array.length - right.length
    quickselect(right, pos - (array.length - right.length))
  else
    return pivot
  end

end
#puts quickselect(q_select ,8)

def factorial(n)
  return n <= 1 ? n : (n * factorial(n-1))
end

#puts factorial(5)


def fibonacci(n)
  i = prev = 0
  curr = 1
  while(i <= n) do
    puts prev
    next_v = prev + curr
    prev = curr
    curr = next_v
    i = i + 1
  end
end

def fibonacci( n )
    return  n  if n <= 1
    fibonacci( n - 1 ) + fibonacci( n - 2 )
end

#puts fibonacci(10)

def palindrome(str)
  i = 0
  j = str.length-1
  flag = true
  while (flag && i<=j) do
    flag = str[i] == str[j] ? true : false
    i = i + 1
    j = j - 1
  end
  return flag
end



p_str = 'stts stts'
#puts palindrome(p_str)

array = [[1,2,3], [4,5,6], [7,8,9]]


# count = 0
# array.each do |a|
#   i = 0
#   j = count
#    while j >= 0
#      print a[i]
#      print "\t"
#      i += 1
#      j -= 1
#    end
#    count += 1
#   puts
# end

def subset_sum(numbers, target, partials)
   s = partials.inject(0) {|result, num| result += num}
   puts "sum(#{partials})=#{target}" if s == target
   return if s >= target
   (0..(numbers.length - 1)).each do |i|
     first = numbers[i]
     remaining = numbers[i+1,numbers.length-1]
     subset_sum(remaining, target, partials + [first])
   end
end

subset_sum([3,9,8,4,5,7,10],15,[])

def subset_sum(numbers, target, partial=[])
  s = partial.inject 0, :+
# check if the partial sum is equals to target

  puts "sum(#{partial})=#{target}" if s == target

  return if s >= target # if we reach the number why bother to continue

  (0..(numbers.length - 1)).each do |i|
    n = numbers[i]
    remaining = numbers.drop(i+1)
    subset_sum(remaining, target, partial + [n])
  end
end

#subset_sum([3,9,8,4,5,7,10],15)

def matrix_print
  array = [[1,2,3], [4,5,6], [7,8,9]]

  for i in 0..array.length-1
     j = 0
     while (j <= i) do
      print "#{array[i][j]} \t"
      j = j + 1
     end
     puts
  end
end


def prime_or_not(given)
   pal = true
   2.upto(given-1) do |i|
      pal = false if given%i == 0
      break if !pal
   end
   return pal
end

#puts prime_or_not(15)


def print_prime(given, divider, flag)
   return flag if given-1 <= divider
   return !flag if given % divider == 0
   print_prime(given, divider+1, flag)
end

puts print_prime(4,2, true)

bubble sort => O(n^2)
selection sort => O(n^2)
insertion sort => O(n^2)
quick sort => O(n^2)
merge sort => O(nlogn)
binary search => O(logn)
Hash => O(1)


Binary Tree:
pre order traversal:
1) process root node
2) process left node
3) process right node

inorder traversal
1) process left
2) process root
3) process right

post order
1) process left
2) process right
3) process root

Breadth First search => need Queue data structure
Depth First search => need stack data structure


