upto = 5
val = count = 1
while(count <= upto) do
  val = val * count
  count += 1
end
puts val


#recursive
def factorial(upto)
  upto == 0 ? 1 : upto * factorial(upto - 1)
end
puts factorial(upto)



