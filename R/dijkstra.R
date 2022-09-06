dijkstra <- function(graph, init_node) {
  
  #vector of nodes
  nodes <- unique(graph$v1)
  #vector of distances from init_node
  d <- ifelse(nodes == init_node, 0, Inf)
  df <- data.frame(nodes = nodes, d = d)
  #vector of unvisited nodes
  u <- nodes
  
  current <- init_node
  while(TRUE) {
    #get vertex with smallest known distance from 
    #init_node
    #neighbors of current node
    neigh <- graph[graph$v1 == current, 2]
    #unvisited neighbors of current node
    u_neigh <- neigh[neigh %in% u]
    for(x in u_neigh) {
      #distance from x and init_node
      #this is going to exist as x is a neighbor of current
      d_x <- graph[(graph$v1 == current & graph$v2 == x), 3] + df[current, 2]
      if (d_x < df$d[x]) {
        df$d[x] <- d_x
      }
    }
    u <- u[!(u == current)]
    if(length(u) == 0){
      break
    }
    m <- min(df$d[u]) 
    current <- df[u, ][df[u, ]$d == m, 1][1]
  }
  df$d
}


