# swap = true
# array = [1,5,2,10,3,7,4,18,0]

# while(swap) do
#   swap = false
#   print array
#   puts
#   for i in 0...array.length-1
#     if array[i] > array[i+1]
#       swap = true
#       array[i],array[i+1] = array[i+1], array[i]
#     end
#   end
# end
# #puts array


def length_of_longest_substring(s)
  n = s.length
  i = 0
  startindex = 0
  endindex = -1
  count = 0
  hash = {}
  # while i < n do
  #   if hash.has_key?(s[i])
  #        startindex += 1
  #        hash[s[i]] = i
  #        #puts "startindex - #{startindex}"
  #        endindex = i
  #        #puts "endindex - #{endindex}"
  #        #puts "#{s[startindex..endindex]}"
  #   else
  #     hash[s[i]] = i
  #     endindex = i
  #   end
  #   i += 1
  # end
  # puts s[startindex..endindex]
  while i < n do
    puts hash.inspect
    puts "startindex - #{startindex} , hash[s[i]] - #{hash[s[i]]}"
    if hash.has_key?(s[i]) && startindex < hash[s[i]]

        startindex = hash[s[i]] + 1
    else
        puts "count - #{count}"
        count = [count, (i - startindex +  1)].max
    end
    hash[s[i]] = i
    i += 1
  end
  puts count
end


#length_of_longest_substring("abcabbcdabcbb")
def edit_distance(str1, str2)
  m = str1.length
  n = str2.length

  i = 0
  dp = Array.new(m+1).fill(0) {Array.new(n+1).fill(0)}

  while i <= m do
    j = 0

    while j <= n do
      if i == 0
        dp[i][j] = j
      elsif j == 0
        dp[i][j] = i
      elsif str1[i-1] == str2[j-1]
        dp[i][j] = dp[i-1][j-1]
      else
        dp[i][j] = [dp[i-1][j-1], dp[i-1][j], dp[i][j-1] ].min + 1
      end
      j += 1
    end
    puts "i is #{i} - #{dp.inspect}"
    i += 1
  end

  puts dp[m][n]
end
edit_distance('cart', 'march')

a = [
  [1,2,3],
  [4,5,6],
  [7,8,9],
  [10,11,12]
]
i = 0
while i < a.length do
  j = 0
  n = a[i].length - 1
  while j <= n do
    print a[i][i % 2 != 0 ? n - j : j]
    j += 1
  end
  puts
  i += 1
end

