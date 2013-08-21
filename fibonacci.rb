prev = 0
curr = 1
upto = 10

while( prev <= upto) do 
  puts prev
  next_val = prev + curr  
  prev = curr
  curr = next_val
end


puts 'recursive printing'
puts '-------------------'
prev = 0
curr = 1

def fibonacci(prev,curr,upto)
 return if prev > upto 
 puts prev
 next_val = prev + curr
 fibonacci(curr,next_val,upto)
end

fibonacci(prev,curr,upto)
