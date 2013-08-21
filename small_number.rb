array = [2,3,4,10,1,9,7,18]
puts array.min 

small = array.first
array.each do |num|
  small = num if num < small 
end
puts small
