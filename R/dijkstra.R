#' Dijkstra algorithm.
#' \code{dijkstra} returns the shortest path between \code{init_node}
#' and all the other nodes in \code{graph}.
#'
#' @param graph A data frame representing an undirected weighted graph.
#'  The first column fo the data frame v1 lists all the nodes repeated
#'  as many times as they have neighbors. The second column of the data
#'  frame v2 lists per each entry in v1 its neighbor. And the last column
#'  w lists the edge between corresponding entries in v1 and v2. See
#'  \code{wiki_graph} in example.
#' @param init_node An integer representing a node in \code{graph}.
#'
#' @return Returns a vector of shortest path distances between
#'  \code{init_node} and all the other nodes in \code{graph}.Each
#'  entry represents the distance between \code{init_node} and the
#'  node that the entry represents.
#' @export
#' @references https://en.wikipedia.org/wiki/Dijkstra's_algorithm
#' @examples
#' wiki_graph <-data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#' v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#' w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
#' dijkstra(wiki_graph, 1)
#' dijkstra(wiki_graph, 3)
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


