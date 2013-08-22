i = 1
n = 5
forward = true
while(i != 0) do 
  puts('*' * i)
  forward = false if i == n
  forward ? i += 1 : i -= 1  
end
