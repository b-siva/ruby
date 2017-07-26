# module Maze

#   # Mazes are hydrated into a two dimensional array, with "#"s as walls
#   # and spaces as pathways.  Entrance and exit points are simply spaces
#   # on the left and right walls (they cannot be on the top or bottom,
#   # but the code could be changed to accommodate that).#
#   # Store mazes in simple text files.
#   #
#   # Example:
#   #
#   #     ###########
#   #     #         #
#   #     # ##### # #
#   #         #   # #
#   #     ### # ### #
#   #     #     #   #
#   #     # # ### ###
#   #     # #   #
#   #     # ### # # #
#   #     #     #   #
#   #     ###########
#   #
#   # Example:
#   #
#   # require './maze_solver'
#   # maze = Maze.load('./mymaze.txt')
#   # maze_solver = Maze::Solver.new(maze)
#   # maze_solver.solve
#   #
#   # ruby maze_runner.rb mymaze.txt
#   #
#   # Passing true in as a second argument will produce output
#   # step by step, so you can visually trace the progression.
#   #
#   # require './maze_solver'
#   # maze = Maze.load('./mymaze.txt')
#   # maze_solver = Maze::Solver.new(maze,true)
#   # maze_solver.solve
#   #

#   def self.load(file)
#     maze = {}
#     matrix = []
#     File.open(file) do |file|
#       file.each_line do |line|
#         matrix << line.chomp!.split(//)
#       end
#     end
#     maze[:matrix] = matrix
#     set_entry_exit(maze)
#     maze
#   end

#   def self.set_entry_exit(maze)
#     matrix = maze[:matrix]
#     maze[:entrance_x] = 0
#     maze[:exit_x]     = matrix[0].size-1
#     matrix.each_index do |idx|
#       maze[:entrance_y] = idx if matrix[idx][0]==' '
#       maze[:exit_y]     = idx if matrix[idx][matrix[0].size-1]==' '
#     end
#     err = <<-ERROR
#       Exists must be on the left and right side of the maze
#     ERROR
#     raise err unless maze.size == 5
#   end

#   # Square to hold an x,y square during maze traversal, with
#   # a link back to it's parent.  Links are used after the exit
#   # is found to trace exit back to entrance.
#   class Sqr < Struct.new(:x, :y, :parent)
#   end

#   class Solver

#     def initialize(maze,show_progress=false)
#       @maze = maze
#       @show_progress = show_progress
#     end

#     def print
#       @maze[:matrix].each do |line|
#         puts line.join
#       end
#       puts
#     end

#     # Main BFS algorithm.
#     def solve
#       matrix = @maze[:matrix]
#       exit_found = false

#       sqr = Sqr.new(@maze[:entrance_x], @maze[:entrance_y], nil)

#       queue = []  # Queue.new
#       queue << sqr

#       while !queue.empty? && !exit_found
#         sqr = queue.shift  # queue.pop
#         x = sqr.x
#         y = sqr.y
#         if (x == @maze[:exit_x] && y == @maze[:exit_y])
#           exit_found = true
#         else
#           matrix[y][x] = '-'  # Mark path as visited
#           print if @show_progress
#           queue << Sqr.new(x+1,y,sqr) if open_square(x+1,y,matrix)
#           queue << Sqr.new(x-1,y,sqr) if open_square(x-1,y,matrix)
#           queue << Sqr.new(x,y+1,sqr) if open_square(x,y+1,matrix)
#           queue << Sqr.new(x,y-1,sqr) if open_square(x,y-1,matrix)
#         end
#       end

#       # Clear all pathway markers
#       clear_matrix

#       if exit_found
#         # Repaint solution pathway with markers
#         matrix[sqr.y][sqr.x] = '>'
#         while sqr.parent
#           sqr = sqr.parent
#           matrix[sqr.y][sqr.x] = '-'
#         end
#         puts "Maze solved:\n\n"
#         print
#         else
#           puts 'No exit found'
#       end
#     end

#     private

#     def open_square(x,y,matrix)
#       return false if (x<0 || x>matrix[0].size-1 || y<0 || y>matrix.size-1)
#       return matrix[y][x] == ' '
#     end

#     def clear_matrix
#       @maze[:matrix].each_index do |idx|
#         @maze[:matrix][idx] = @maze[:matrix][idx].join.gsub(/[^#|\s]/i,' ').split(//)
#       end
#     end
#   end

# end

# maze = Maze.load('./mymaze.txt')
# maze_solver = Maze::Solver.new(maze, true)
# maze_solver.solve


# #factorial

# n = 5
# def factorial(n)
#   return 1 if n <=1
#   n * factorial(n-1)
# end
# puts factorial(n)

# n = 5
# i = 1
# while n >= 1 do
#    i = i * n
#    n -= 1
# end
# puts i


#fibonacci

# prev = 0
# curr = 1
# n = 20
# while prev <= n do
#   puts prev
#   nex = prev + curr
#   prev = curr
#   curr = nex
# end

# def fibonaaci(prev, curr, n)
#   return if n <= prev
#   puts prev
#   fibonaaci(curr, prev+curr, n)
# end

# fibonaaci(0,1,20)


# def fibonaaci(n)
#   return 1 if n <= 1
#   return fibonaaci(n-1) + fibonaaci(n-2)
# end

# puts fibonaaci(4)

#prime numbers

# n = 20
# i = 1

# while i <= n do
#   j = i - 1
#   prime = true
#   while j > 1 do
#     if i % j == 0
#       prime = false
#       break
#     end
#     j -= 1
#   end
#   puts i if prime
#   i += 1
# end

# #quickselect
# array = [35,1,8,27,15,32,5,23,18]

#        #[1,5,8,15,18,23,27,32,35]

# def quickselect(array, pos)
#   return "not found" if pos > array.length || pos < 1
#   pivot = array[0]
#   left = []
#   right = []
#   array.each do |ele|
#     if pivot < ele
#       left << ele
#     elsif pivot > ele
#       right << ele
#     end
#   end

#   if pos <= left.length
#     quickselect(left, pos)
#   elsif pos > array.length - right.length
#     quickselect(right, pos - (array.length - right.length))
#   else
#     return pivot
#   end

# end
# puts quickselect(array,1)


# #merge sort

#  array = [35,1,8,27,15,32,5,23,18]

#         #[1,5,8,15,18,23,27,32,35]


# def mergesort(array)
#   return array if array.length <=1
#   mid = array.length / 2
#   left = array[0, mid]
#   right = array[mid, array.length-mid]
#   merge(mergesort(left), mergesort(right))
# end

# def merge(left, right)
#   sorted = []
#   until left.empty? || right.empty? do
#     if left.first <= right.first
#        sorted << left.shift
#     else
#        sorted << right.shift
#     end
#   end
#   sorted.concat(left).concat(right)
# end

# puts mergesort(array).inspect


##quick

##count character in sentence
# string = "hello world"

# count = {}
# string.each_char do |s|
#   count[s] = 1 + ( count[s] || 0 )
# end

# puts count.inspect
# puts count.sort_by {|key, value| value}.to_h.inspect


# Quick Sort

a = [10,32,7,24,1,38,16,2]


def quicksort(a)
  return a if a.length <= 1
  mid = a.length/2
  pivot = a[mid]
  left = []
  right = []

  a.each do |num|
    if num < pivot
      left << num
    elsif num > pivot
      right << num
    end
  end

  quicksort(left).concat([pivot]).concat(quicksort(right))

end

puts quicksort(a).inspect







