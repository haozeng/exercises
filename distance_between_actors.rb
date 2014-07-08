def bfs(node)
  queue = []
  queue.push(node)

  while(queue.size != 0)
    n = queue.shift
    puts n.value
    n.children.each do |child|
      queue.push(child)
    end
  end
end

# Breadth First Seach to look for Actor A to Actor B
# 0) First iterate for each movie, treat each actor as node and we link the actors in the same movies
# And this will give us a undirected graph
# 1) We want to keep track of levels of from Actor A to Actor B, we create a hash to store the level
# For level one, there is just Hash[0] = [Actor A]
# 2) we start from Level 0, We iterate the nodes in current level and for each node, We add the its neighbours to level 1, Hash[1], while adding to Hash[1], we check to see it Actor B is in level 1 or not
# Return immediately
# 3) if we find Actor B, and the corresponding node is Actor B else We keep doing performing our BFS for next level until we find Actor B

# The running time is  O(m + n), m is number of edges and n is number of nodes
