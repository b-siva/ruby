array = [1,2,3,4,5]
size = array.size
shuffled = []
shuffled_index = []
while size != shuffled.size
  random = rand(size)
  unless shuffled_index.include?(random)
    shuffled_index << random
    shuffled << array[random]
  end 
end
puts 'original array is : ' + array.to_s
puts 'shuffled array is : ' + shuffled.to_s
