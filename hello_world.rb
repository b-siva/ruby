class HelloWorld

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Welcome #{@name} to simple ruby program..."
  end

end

hello_world = HelloWorld.new('Mr John')
hello_world.greeting


prev = 0
curr = 1

while(prev < 30) do
    puts prev
    nex = prev + curr
    prev = curr
    curr = nex
end

a = [1,2,3,4,5,6,7,8]
num = 5

def bsearch(arr, num)
    middle = arr[arr.length/2]
    if num == middle
        print "number found"
    elsif arr.length == 1
        print 'number not found'
    elsif num < middle
        bsearch(arr[0...arr.length/2.floor],num)
    elsif num > middle
        bsearch(arr[arr.length/2.ceil...arr.length],num)
    end
end
#bsearch(a,num)

def bsearchwithindex(arr, num, sindex, eindex)
    puts "#{sindex} - #{eindex}"
    middle = (sindex + eindex)/2
    if num == arr[middle]
        print "number found in index #{middle}"
    elsif sindex >= eindex
        print "number not found"
    elsif num < arr[middle]
        bsearchwithindex(arr, num, sindex, middle)
    elsif num > arr[middle]
        bsearchwithindex(arr, num, middle, eindex)
    end
end
#bsearchwithindex(a, num, 0, a.length)
puts

#puts a.inject(0) {|sum, v| sum += v}

class String
    def reverseme!
        s = 0
        e = self.length-1
        while s<=e do
            t = self[s]
            self[s] = self[e]
            self[e] = t
            s += 1
            e -= 1
        end
        self
    end

    def reversemerec!
       r(0, self.length-1)
    end

    def r(s,e)
     return self if s>=e
     self[s], self[e] = self[e], self[s]
     r(s+1, e-1)
    end
end

# puts "helloworld".reverseme!
# puts "helloworld".reversemerec!

a = 123450

while a!=0 do
    print a%10
    a = a/10
end

def thrice
  yield
  yield
  yield
end
puts

def thrice
  yield
  yield
  yield
end

# thrice do # note that {...} and do...end are completely equivalent
#   y = 10
#   puts "Is y defined inside the block where it is first set?"
#   puts "Yes." if defined? y
# end
# puts "Is y defined in the outer context after being set in the block?"
# puts "No!" unless defined? y


q = [5,1,17,6,3,19,7,4,2,9,2]

def quicksort(a)
    return a if a.length <= 1
    index = (a.length-1)/2
    pivot = a[index]
    left = []
    right = []
    same = []
    a.each do |item|
        if item < pivot
            left << item
        elsif item > pivot
            right << item
         elsif pivot == item
            same << item
        end
    end
    quicksort(left).concat(same).concat(quicksort(right))
end

#puts quicksort(q).inspect


def rec_fib(n, prev, curr, count)
    return 0 if n == 0
    return prev if n == count
    nex = prev + curr
    prev = curr
    curr = nex
    rec_fib(n, prev, curr, count += 1)
end

puts rec_fib(10,0,1,0)




