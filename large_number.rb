array = [2,3,4,10,1,9,7,18]
puts array.max 

large = array.first
array.each do |num|
  large = num if num > large 
end
puts large
