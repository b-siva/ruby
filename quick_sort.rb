a = [3,7,8,5,2,1,4,9,5,4,6,5,5]


def select_pivot(array)
  return (array.length/2)
end

def concatenate(less, pivot_array, great)
  sorted = less + pivot_array + great
  return sorted
end

def quicksort(array, pivot)
  return array if array.length <= 1
  less_values = []
  great_values = []
  array.each do |num|
    if num < pivot
      less_values << num
    elsif num > pivot
      great_values << num
    end
  end
  less_pivot = less_values[select_pivot(less_values)]
  great_pivot = great_values[select_pivot(great_values)]
  concatenate(quicksort(less_values, less_pivot), [pivot] ,quicksort(great_values, great_pivot))
end

index = select_pivot(a)
puts quicksort(a, a[index]).inspect
