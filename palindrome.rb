word = 'tattarrattat'
#word = '123 321' #separate word
#word = 'step on no pets' #multiple words
#word = 'Red rum, sir, is murder' #sentence 
#word = 'Eva, can I see bees in a cave?' #sentence
#word = word.scan(/[a-zA-Z]/).join.downcase #needed only for sentence 
reverse = word.reverse
puts word == reverse ?  "#{word} is palindrome" : "#{word} is not palindrome"

word_len = word.length - 1
count_incr = 0
count_dcr = word_len
palindrome = true
while(count_incr < word_len) do 
  if word[count_incr] == word[count_dcr]
     palindrome = true
     count_incr += 1
     count_dcr -=1
  else
     palindrome = false 
     break
  end
end
puts palindrome ?  "#{word} is palindrome" : "#{word} is not palindrome"

#recursive
def palindrome(word,inc,dec,pal) 
  return pal unless pal
  return pal if inc > dec
  word[inc] == word[dec] ? palindrome(word,inc+1,dec-1,pal) : palindrome(word,inc,dec,false)
end

inc = 0
dec = word_len
pal = true
puts palindrome(word,inc,dec,pal) ? "#{word} is palindrome" : "#{word} is not palindrome"

