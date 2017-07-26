#island problem
class GroupOFIslands
    attr_accessor :graph, :row, :col, :visited, :neighbours, :count

    def initialize(graph)
        @graph = graph
        @row = graph.length - 1
        @col = graph[graph.length-1].length
        @count = 0
        @visited = {}
        @neighbours = [[0,-1], [0,1], [-1,0], [-1,-1], [-1, 1], [1,0], [1, -1], [1,1]]
    end

    def find_islands(stack)
        return 1 if stack.empty?
        item = stack.pop

        unless @visited.has_key?(item)
            @visited[item] = true #mark as visited
            k = item.split('-').first
            l = item.split('-').last


            @neighbours.each do |neighbour|
                r = neighbour.first + k.to_i
                c = neighbour.last + l.to_i

                if r >= 0 && r <= @row && c >= 0
                    if @graph[r][c] == 1
                        stack.push("#{r}-#{c}")
                    end
                end

            end
        end
        find_islands(stack)
    end

    def look_for_island(i, j)
        return @count if i > @row

        if @graph[i][j] == 1
            stack = ["#{i}-#{j}"]
            value = 0
            unless @visited.has_key?(stack.first)
                value = find_islands(stack)
            end

            @count += value
        end

        if @graph[i].length-1 == j
            i += 1
            j = 0
        else
            j += 1
        end

        look_for_island(i, j)
    end

end

islands = [
    [1, 1, 0, 0, 0],
    [0, 1, 0, 0, 1],
    [1, 0, 0, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 0, 1, 0, 1]
]
puts "number of islands: - "
print GroupOFIslands.new(islands).look_for_island(0,0)


