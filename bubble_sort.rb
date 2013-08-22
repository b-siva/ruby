swap = true
array = [1,5,2,10,3,7,4,18,0]

while(swap) do
  swap = false
  print array
  puts
  for i in 0...array.length-1 
    if array[i] > array[i+1]
      swap = true
      array[i],array[i+1] = array[i+1], array[i]
    end
  end
end
#puts array
