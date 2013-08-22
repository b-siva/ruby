i = 1
n = 30 

while(i <= n) do
  prime = true
  k = i-1
  while k > 1 do 
     if i % k == 0
       prime = false
       k -= 1
       break
     else
       prime = true 
       k -= 1      
     end     
  end
  puts i if prime
  i += 1
end


