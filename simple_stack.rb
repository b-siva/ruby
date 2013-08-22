array = [1,2,3,4,5]
puts "Array's push and pop method"
puts '---------------------------'
puts array.push(6)
puts array.pop
puts 'final array'
puts '------------------'
puts array

puts '-------------'
puts "Dirty way"
puts '-------------'
puts array[array.length] = 6
#puts array.delete(array.last)
array = array[0..array.length-2]
puts array
