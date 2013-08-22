#using hash 
puts 'using hash function'
puts '-------------------'
array = [1,2,3,4,3,2,1]
hash = {}
array.each do |num|
  count = hash.has_key?(num.to_s) ? hash[num.to_s] + 1 : 1
  hash.merge!({num.to_s => count})
end
puts hash.keys

#using temp array
puts 'using temp array'
puts '----------------'
tmp_array = []
array.each do |num|
  tmp_array.push(num) unless tmp_array.include?(num)
end
puts tmp_array

#using temp array without include function
puts 'using temp array without include function'
puts '-----------------------------------------'
tmp_array = []
array.each do |num| 
  presence_of = false
  tmp_array.each do |val|
    break if presence_of
    presence_of = true if val == num   
  end
  tmp_array.push(num) unless presence_of
end
puts tmp_array


