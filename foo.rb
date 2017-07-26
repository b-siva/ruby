# class Foo
#   def <<(p)
#    puts 'hi'
#    puts __method__
#    puts p
#   end

#   def hello(param)
#     puts 'hello'
#   end
# end
# foo = Foo.new
# foo <<('hello')
# #puts foo.methods.inspect

# puts '---------'
# #foo1 = Foo.new
# #foo1.hello(1)

# foobar = Array.new

# def foobar.size
#   "Hello World!"
# end

# puts foobar.size  # => "Hello World!"
# puts foobar.class # => Array

# puts bizbat = Array.new
# puts bizbat.size  # => 0
# puts foobar.singleton_methods
# puts '---------'
# puts bizbat.singleton_methods
# puts '---------'
# Marshal.dump(bizbat)
# Marshal.dump(foobar)


# def subset_sum(numbers, target, partial=[])
#   s = partial.inject 0, :+
# # check if the partial sum is equals to target

#   puts "sum(#{partial})=#{target}" if s == target
#   puts partial.inspect

#   return if s >= target # if we reach the number why bother to continue

#   (0..(numbers.length - 1)).each do |i|
#     n = numbers[i]
#     remaining = numbers.drop(i+1)
#     subset_sum(remaining, target, partial + [n])
#   end
# end

# subset_sum([3,9,8,4,5,7,10],15)

list = ['a string', ['a','b','c'], 'spam', ['eggs'], ["hello", "World", ['how', 'are', 'you']]]

def dumpList(s,list)
    i = 0
    while(i<list.length) do
        if (list[i].kind_of?(Array) )
            dumpList("#{s}.#{i}" ,list[i])
        else
          puts "#{s}.#{i} is #{list[i]}"
        end
        i = i + 1
    end
end
#dumpList('Foo',list)

class A
    def hi
        puts 'hi'
    end
end

# a = A.new
# a.hi

class A
    def hello
        puts 'hello'
    end
end

# b = A.new
# b.hi
# b.hello
# a.hello

def print_matrix
  n = 0
  for i in 0..2
    j = i
    while j <= i do
        for k in 0..2
           print n+=1
           print "\t"
        end
        j+=1
    end
    print "\n"
  end
end

#print_matrix

def split(arr)

  if arr.length <= 1
    puts arr.inspect
    return arr
  end
  mid = arr.length/2
  left = arr[0...mid]
  #puts left.inspect
  right = arr[mid...arr.length]
  #puts right.inspect
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

# arr = [3,5,1,19,4,7,6,22,54,11,43]
# puts split(arr).inspect
# puts arr.sort.inspect


def primeornot(number, divisor, flag)
   return "not prime" if !flag
   return "prime" if divisor < 2 || number <= 2
   if (number % divisor)  == 0
      primeornot(number, divisor-1, false)
   else
     primeornot(number, divisor-1, true)
   end
end

number = 22
#puts primeornot(number, number-1, true)

number = 4
twicenumber = 2 * number
i = 1
while i < twicenumber do
  pritable = i
  pritable = twicenumber - i if i > number
  #puts '*' * pritable
  i +=1
end

str = "hello world"
#puts str.include?('llo')

def substring(str, sub)
  i = 0
  sublength = sub.length
  flag = false
  while i < str.length do
    if str[i,sublength] == sub
      flag = true
      break
    end
    i = i + 1
  end
  return flag
end

#puts substring(str, 'llo')

def quicksort(arr)
  return arr if arr.length <= 1
  mid = arr.length/2
  pivot = arr[mid]

  left = []
  right = []
  common = []
  arr.each do |a|
    if a < pivot
      left.push(a)
    elsif a > pivot
      right.push(a)
    else
      common.push(a)
    end
  end
  quicksort(left).concat(common).concat(quicksort(right))
end

arr = [3,5,1,7,19,4,7,6,22,54,11,11,43]

#puts quicksort(arr).inspect


number = 123456
reversed = 0

while number != 0 do
  reversed = reversed * 10 + number % 10
  number = number / 10
end
#puts reversed


def bubble_sort(arr)
  flag = true
  while flag do
    i = 0
    flag = false
    while  i < arr.length-1 do
      if arr[i] > arr[i+1]
        flag = true
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
      i += 1
    end
  end
  puts arr.inspect
end

#bubble_sort(arr)

def binarysearch(arr, item, low, high)
   return "not found" if high < low
   mid = (low+high)/2
   miditem = arr[mid]
   if miditem == item
      return "#{item} found in index #{mid}"
   elsif item < miditem
      binarysearch(arr, item, low, mid-1)
   elsif item > miditem
      binarysearch(arr, item, mid+1, high)
   else
      return "not found"
   end
end


#puts binarysearch(quicksort(arr), 1, 0, arr.length-1)

def selectionsort(arr)
  i = 0
  while i <= arr.length-1 do
    min = i
    j = i + 1
    while j < arr.length-1 do
      if arr[j] < arr[min]
        min = j
      end
      j += 1
    end

    if i != min
      arr[i], arr[min] = arr[min], arr[i]
    end

    i += 1
  end
  return arr
end

#puts selectionsort(arr).inspect

def insertsort(arr)
  for i in 1...arr.length
    j = i
    while j > 0 do
      if arr[j-1] > arr[j]
        arr[j-1], arr[j] = arr[j], arr[j-1]
      end
      j -= 1
    end
  end
  return arr
end

#puts insertsort(arr).inspect


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

#puts insertion(arr).inspect

def qselect(arr, k)
  #return arr if arr.length <= 1

  puts arr.inspect
  mid = arr.length/2
  pivot = arr[mid]
  left = []
  right = []

  i = 0
  while i <  arr.length do
    if arr[i] < pivot
      left << arr[i]
    elsif arr[i] > pivot
      right << arr[i]
    end
    i += 1
  end

  if k <= left.length
    qselect(left, k)
  elsif k > (arr.length - right.length)
    qselect(right, k - (arr.length - right.length))
  else
    return pivot
  end

end

#puts qselect(arr, 13).inspect


def subset_sum(numbers, target, partials)
  sum = partials.inject(0) { |sum, v| sum += v}
  puts "sum => #{partials}=#{target}" if sum == target
  return if sum >= target

  for i in 0..numbers.length-1
    first = numbers[i]
    remaining = numbers.drop(i+1)
    subset_sum(remaining, target, partials + [first])
  end

end

#subset_sum([3,9,8,4,5,7,10],15,[])

def sub_string(s, sub, st)

  return false if s.length-1 < st


  if s[st, sub.length] == sub
    return true
  else
    sub_string(s, sub, st + 1)
  end
end

str = 'hello world'
#puts sub_string(str, 'll', 0)

def prime(given, divisor)
  return true if given == divisor
  if given % divisor == 0
    return false
  else
    prime(given, divisor + 1)
  end

end

puts prime(29, 2)
