i = 1
n = 5
while(i <= n) do 
  puts('*' * i)
  i+=1
end

puts 'recursive printing'
puts '------------------'

def print_star(i,n)
  return if i > n
  puts('*' * i)
  print_star(i+=1,n)
end

print_star(1,5)
