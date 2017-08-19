class Cell
  attr_accessor :value, :current_state, :future_state

  def initialize(value)
    @value = value
    set_states
  end

  def alive?
    @value == 1
  end

  def dead?
    @value == 0
  end

  def set_states
    @current_state = @value
    @future_state = @value
  end

end

class Graph
  attr_accessor :graph, :row, :col, :visited, :neighbours, :count

    def initialize(graph)
        @graph = graph
        @neighbours = [[0,-1], [0,1], [-1,0], [-1,-1], [-1, 1], [1,0], [1, -1], [1,1]]
    end

    def set_initial_state
      @graph.each_with_index do |row, i|
        row.each_with_index do |col, j|
          @graph[i][j] = Cell.new(@graph[i][j])
        end
      end
    end

    def new_state
      @graph.each_with_index do |row, i|
        row.each_with_index do |col, j|
          @graph[i][j].current_state = @graph[i][j].future_state
        end
      end
    end

    def final_state
       @graph.each_with_index do |row, i|
        row.each_with_index do |col, j|
          @graph[i][j] = @graph[i][j].current_state
        end
      end
    end

    # iterate each location
    def iterate
      @graph.each_with_index do |row, i|
        row.each_with_index do |col, j|
          live_neighbors = evaluate_neighbours(i,j)
          if @graph[i][j].current_state == 0 && live_neighbors == 3
            @graph[i][j].future_state = 1
          else
            @graph[i][j].future_state = 0 if live_neighbors < 2 || live_neighbors > 3
          end
        end
      end
    end

    def is_safe?(i,j)
      i >= 0 && i < @graph.length && j >= 0 && j < @graph[i].length
    end

    #look neighbors
    def evaluate_neighbours(i, j)
      count = 0
      @neighbours.each do |location|
        r = location.first + i
        c = location.last + j
        count += 1 if is_safe?(r,c) && @graph[r][c].value == 1
      end
      count
    end



    def print_state
      @graph.each do |item|
        puts item.inspect
      end
      set_initial_state
      iterate
      new_state
      final_state
      puts "----------------------"
      @graph.each do |item|
        puts item.inspect
      end
    end

end

graph = [
  [1,0,1,0,1],
  [0,1,1,0,1],
  [1,1,1,0,1]
]

Graph.new(graph).print_state
