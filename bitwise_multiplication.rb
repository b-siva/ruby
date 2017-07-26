a = 10
b = 3 # a>b
result = 0 
while(b!=0) do #itetate till b==0 
  if(b&01) #bitwise & of the value of b with 01 
    result = result + a  #add a to result if b is odd
  end
  a <<= 1  # left shifting the value contained in 'a' by 1, multiplies a by 2 for each loop
  b >>= 1  #right shifting the value contained in b by 1
end
puts result 
