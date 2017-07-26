# def thrice
#     yield
#     yield
#     yield
# end

# x = 5

# puts "Value of X before: #{x} "
# thrice {x+=1}
# puts "Value of X after: #{x} "


# def thrice_with_local_x
#     x = 100
#     yield
#     yield
#     yield
#     puts "Value of x at end of thrice_with_local_x: #{x}"
# end

# x = 5
# thrice_with_local_x {x+=1}
# puts "Value of outer x after: #{x}"


# thrice do
#     y = 10
#     puts "Is y defined inside?"
#     puts "yes" if defined?y
# end
# puts "Is y defined outside?"
# puts "No" unless defined?y


# def six_times(&block)
#     thrice(&block)
#     thrice(&block)
# end

# x = 4
# six_times {x+=10}
# puts "Value of x after: #{x}"


# def save_for_later(&b)
#     @saved = b
# end
# save_for_later { puts "Hello!"}
# puts "Deffered execution of a block:"
# @saved.call
# @saved.call


# def f(closure)
#   puts
#   puts "About to call closure"
#   result = closure.call
#   puts "Closure returned: #{result}"
#   "Value from f"
# end

# puts "f returned: " + f(Proc.new { "Value from Proc.new" })
# puts "f returned: " + f(proc { "Value from proc" })
# puts "f returned: " + f(lambda { "Value from lambda" })
# def another_method
#   "Value from method"
# end
# puts "f returned: " + f(method(:another_method))

# fibonacci
# prev = 0
# curr = 1
# i = 0


# while (i!=20)
#     puts prev
#     nxt = prev + curr
#     prev = curr
#     curr = nxt
#     i+=1
# end

# factorial
# n * n-1 ... 1

# n = 5
# i = 1
# while (n > 0)
#     i = i * n
#     n -= 1
# end

# puts i

#palindrome

# p = 'HEEHH'
# len = p.length-1
# i = 0
# pal = true
# while i <= p.length-1
#   if p[i] != p[len]
#     pal = false
#     break
#   end
#   i += 1
#   len -= 1
# end
# puts pal

#print star
# forward = true
# i = 1
# while(i!=0)
#   puts('*' * i)
#   forward = false if i == 5
#   forward ? i+=1 : i-=1
# end

#reverse integer
# a = 0123456

# a = a.to_s.to_i

# while(a != 0)
#     print a%10
#     a /= 10
# end
# puts

#prime number
# n = 50
# i = 1
# while i <= n do
#   j = i - 1
#   prime = true
#   while j > 1
#     if i%j == 0
#       prime = false
#       break
#     end
#     j -= 1
#   end
#   puts i if prime
#   i+=1
# end

# def innerprime(i,j,prime)
#   return if j == 1
#   if prime
#     puts i
#     return
#   end
#   prime = true if i % j == 0
#   innerprime(i,j-1,prime)
# end

# innerprime(50,49, false)

#array = [1,2,3,4,5,6,7,8,9,10]

# array.each do |num|
#   puts num
# end

# puts array.select {|num| num%2==0}
# puts array

# puts array.collect {|num| num*2}
# puts array

# puts array.map {|num| num/2}
# puts array

# puts array.reject {|num| num%2==0}
# puts array

#puts array.inject {|sum,num| sum*num}

# i = 1
# a = Proc.new {|num| num + i}

# def hello_proc(&b)
#   b
# end
# hello_proc { puts 'hello'}.call


# #puts a.call(10)

# barray = [1,2,3,4,5,6,7,8,9,10]
# item = 1
# low_b = 0
# up_b = barray.length-1

# while low_b <= up_b do
#   index = low_b + up_b
#   puts index/2
#   if item == barray[index/2]
#     puts "#{index/2} index found"
#     break
#   elsif item > barray[index/2]
#      low_b = index/2 + 1
#   elsif item < barray[index/2]
#      up_b = index/2 - 1
#    end
# end



# module Stuff
#   def Stuff.hello
#     puts "hello from stuff"
#   end

#   def self.hi
#     puts "hi from module"
#   end

# end

# Stuff.hello

# class A
#   include Stuff
# end

# A.hi


array = [7,18,1,39,27,32,12]


# def mergesort(array)
#   return array if array.size <= 1
#   puts array.inspect
#   mid = array.size / 2
#   left = array[0, mid]
#   right = array[mid, array.size-mid]
#   merge(mergesort(left), mergesort(right))
# end


# def merge(left,right)
#   sorted = []
#   until left.empty? || right.empty?
#     if left.first <= right.first
#       sorted << left.shift
#     else
#       sorted << right.shift
#     end
#   end
#   sorted.concat(left).concat(right)
# end

# puts mergesort(array).inspect


# def quicksort(array, pivot)
#   puts array.inspect
#   return array if array.size <= 1
#   left = []
#   right = []
#   array.each do |num|
#     if num < pivot
#       left << num
#     elsif num > pivot
#       right << num
#     end
#   end
#   sorted = []
#   sorted.concat(quicksort(left,left[left.size/2])).concat([pivot]).concat(quicksort(right, right[right.size/2]))
# end

# puts quicksort(array, array[array.size/2]).inspect


# prev = 0
# curr = 1

# 20.times do |num|
#   puts prev
#   nex = prev + curr
#   prev = curr
#   curr = nex
# end


# puts "enter the number"
# a = gets.chomp
# puts "enter numberd is #{a} and type is #{a.class}"

#  puts array.inspect

# def kthnumber(array, k)
#   left = []
#   right = []
#   pivot = array.first
#   array.each do |num|
#     if num < pivot
#        left << num
#     elsif num > pivot
#         right << num
#     end
#   end
#   puts "pivot - #{pivot}"
#   puts "k - #{k}"
#   puts "left - #{left.inspect}"
#   puts "right - #{right.inspect}"
#   puts "------------------------"
#   if k <= left.length
#     return kthnumber(left, k)
#   elsif k > array.length - right.length
#     return kthnumber(right, k - (array.length - right.length))
#   else
#     return pivot
#   end
# end

#  puts kthnumber(array, array.length-1)

array = [[1,2,3], [4,5,6], [7,8,9]]

# array.each do |a|
#   a.each do |num|
#     print num
#     print "\t"
#   end
#   puts
# end

# count = 0
# i = 0
# j = 0

# while count < 3
#   while j>=0
#     print array[i][j]
#     print "\t"
#     j -= 1
#     i += 1
#   end
#   puts
#   count += 1
#   j=count
#   i=0
# end

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


# class String
#     def reverse!
#         i = 0
#         j = self.length-1
#         while i<=j do
#           self[i], self[j] = self[j], self[i]
#           i+=1
#           j-=1
#         end
#         return self
#     end

#     def hello
#         return self.upcase
#     end
# end
# a = 'helloworld'

# puts a

#puts a.reverse!.hello

# i = 0
# j = a.length-1
# while i<=j
#  a[i], a[j] = a[j], a[i]
#  i+=1
#  j-=1
# end

# puts a

# array = [1,2,3,4,5]

# puts array.inspect
#  i = 0
#  j = array.length-1

# while i<= j do
#   tmp = array[i]
#   array[i] = array[j]
#   array[j] = tmp
#   i += 1
#   j -= 1
# end


def reverse_array_no_loop(array, i, j)
  return array if i >= j
  tmp = array[i]
  array[i] = array[j]
  array[j] = tmp
  reverse_array_no_loop(array, i+=1, j-=1)
end

# reverse_array_no_loop(array, i, j)
#puts array.inspect

str = "hello world how are you"

# split_s = str.split(' ')

# split_s.each do |str|
#   print reverse_array_no_loop(str, 0, str.length-1)
#   print " "
#   #puts str.inspect
# end
# puts


def split_word(full_str, char, count_char, length, i)
   if count_char == length
      #puts full_str[i...count_char]
      return reverse_array_no_loop(full_str, i, count_char-2)
   end
   count_char += 1
   if char == ' '
     #puts full_str[i...count_char]
     reverse_array_no_loop(full_str, i, count_char-2)
     split_word(full_str, full_str[count_char], count_char, length, count_char)
   else
     split_word(full_str, full_str[count_char], count_char, length, i)
   end
end

# full_str = "hello world how are you"
# puts full_str

# puts split_word(full_str, full_str[0], 0, full_str.length, 0)
# puts full_str

# def bsearch(array, num, start, last)

#   return "value not found" if start >= last

#   index = (start + last) / 2

#   if num > array[index]
#     start = index + 1
#     last = array.length
#     bsearch( array ,num, start, last)
#   elsif num < array[index]
#     start = 0
#     last = index
#     bsearch( array,num,start,last)
#   else
#     return index
#   end
# end

# a = [1,2,3,4,5,6,7,8,9,10]
# puts bsearch(a, 10, 0, a.length-1)


a = [3,6,1,17,32,27,37,2,23]

# def select_sort(a,index)
#   #puts a.inspect
#   min = a[index]
#   find_index = swap_index = index
#   a[index, a.length].each do |num|
#     if num < min
#       min = num
#       swap_index = find_index
#     end
#     find_index += 1
#   end

#   a[index], a[swap_index] = a[swap_index], a[index]

#   if index != a.length-1
#     select_sort(a,index+1)
#   else
#     return a
#   end
# end

# puts select_sort(a,0).inspect


def insert_sort(a)
  1.upto(a.length-1) do |i|
    puts a.inspect
    value = a[i]
    j = i - 1
    while j >=0 && a[j] > value do
        a[j+1] = a[j]
        j-=1
    end
    a[j+1] = value
  end
  return a
end

puts insert_sort(a).inspect


class Numeric
   def add(i)
      return self + i
   end
end

puts 11.add(11) # => output ?
puts 011.add(011) # => output ?




