i = 1
n = 5

while(n >= i) do
  puts('*' * n)
  n-=1
end

puts 'recursive printing'
puts '------------------'
def print_star(i,n)
  return if i > n 
  puts('*' * n)
  print_star(i,n-=1)
end

print_star(1,5)
