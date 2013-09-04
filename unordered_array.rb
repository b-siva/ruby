array = [8,9,1,7,3,18,2,21]
temp_array = []
kth_value = 3


#Easier way to find small kth number
sorted_array = array.sort
puts sorted_array[kth_value-1]

#Easiter way to find large kth number
reverse_array = sorted_array.reverse
puts reverse_array[kth_value-1]


array.each do |num|
  index = 0
  temp_array.each do |t_num|
    if num > t_num
      index = index + 1     
    end  
  end
  if index == 0
    if temp_array.size < kth_value
      temp_array.unshift(num)
    end 
  else
    if temp_array.size < kth_value
      temp_array[index] = num
    else
      t_ar1 = temp_array[0...index]
      t_ar2 = temp_array[index...temp_array.length]
      t_ar1.shift
      temp_array = t_ar1 + t_ar2.unshift(num)
    end    
  end
  puts temp_array.inspect
end

#puts temp_array
