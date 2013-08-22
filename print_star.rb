i = 1
n = 5
forward = true
while(i != 0) do 
  puts('*' * i)
  forward = false if i == n
  forward ? i += 1 : i -= 1  
end

puts 'recursive printing'
puts '------------------'
def print_star(i,n,forward)
  return if i == 0
  puts('*' * i)
  forward = false if i == n
  forward ? print_star(i+=1,n,forward) : print_star(i-=1,n,forward)
end

print_star(1,5,true)
