i = 1
n = 30 

while(i <= n) do
  prime = true
  k = i-1
  while k > 1 do 
    prime = i % k == 0 ? false : true
    k -= 1
    break unless prime   
  end
  puts i if prime
  i += 1
end


