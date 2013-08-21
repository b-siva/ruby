string = "reverse me"
puts string.reverse 

str_len = string.length - 1
reversed = ''
str_len.downto(0) do |num|
  reversed <<  string[num]
end
puts reversed

count = 0
reversed = ''
while(str_len >= count) do 
  reversed << string[str_len - count]
  count += 1
end
puts reversed

#recursive method
def reverse_string(str,count,reversed)
  if count == 0   
    reversed << str[0]   
  else
    reversed << str[count]
    reverse_string(str,count-1,reversed)  
  end   
end
reversed = ''
reverse_string(string,string.length-1,reversed)
puts reversed
