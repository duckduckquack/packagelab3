#' Undirected weighted graph
#'
#' A graph containing nodes, edges and weights
#'
#' @format A data frame with 18 rows and 3 variables:
#'   \describe{
#'     \item{v1}{nodes, as integers. Each node is repeated as many times
#'     as the node has neighbors}
#'     \item{v2}{nodes, as integers. For each entry corresponding to a node
#'     in v1, the v2 entries represent the neighboring nodes}
#'     \item{w}{edges, as integers. For the corresponding entries in v1 and v2
#'     (nodes), the w entry represents the weight of the edge}
#'    }
#' @source \url{https://en.wikipedia.org/wiki/Dijkstra's_algorithm}
#'
"wiki_graph"
