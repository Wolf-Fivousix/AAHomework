require "byebug"
class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def inspect
        "#{value}: #{neighbors.length} children"
    end

    def neighbors=(nodes_array)
        @neighbors = nodes_array
    end
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = []
    until queue.empty?
        current_node = queue.shift
        return current_node if current_node.value == target_value
        visited << current_node
        unvisited_nodes = current_node.neighbors.reject { |node| visited.include?(node) }
        queue.concat(unvisited_nodes)
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

# p a
# p b
# p c
# p d
# p e
# p f
p bfs(a, "b")
puts "Good job! now..."
p bfs(a, "f")