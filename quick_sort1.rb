a = [1,15,5,21,34,17,7]

def concatenate(less, pivot_array, great)
  sorted = less + pivot_array + great
  return sorted
end

def quick_split(a, pivot, what)
    #puts "#{what} is #{a.inspect} and pivot is #{pivot}"
    return a if a.length <= 1
    left = []
    right = []
    a.each do |i|
      if i < pivot
        left << i
      elsif i > pivot
        right << i
      end
    end
    left_pivot = (left.length/2)
    right_pivot = (right.length/2)
    concatenate(quick_split(left, left[left_pivot], 'left'), [pivot] ,quick_split(right, right[right_pivot], 'right'))
end

index = (a.length/2)-1
puts quick_split(a, a[index], 'main').inspect
