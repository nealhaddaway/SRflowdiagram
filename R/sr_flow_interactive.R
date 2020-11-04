#' Plot interactive flow charts for systematic reviews
#' 
#' @description 
#' @param plot A plot object from sr_flow().
#' @param urls A dataframe consisting of two columns: nodes and urls. The first
#' column should contain 19 rows for the nodes from node1 to node19. The second 
#' column should contain a corresponding URL for each node.
#' @return An interactive flow diagram plot.
#' @examples 
#' urls <- data.frame(c('node1', 'node2', 'node3', 'node4', 'node5', 'node6', 
#'     'node7', 'node8', 'node9', 'node10', 'node11', 'node12', 'node13', 
#'     'node14', 'node15', 'node16', 'node17', 'node18', 'node19'), 
#'     c('page1.html', 'page2.html', 'page3.html', 'page4.html', 'page5.html', 
#'     'page6.html', 'page7.html', 'page8.html', 'page9.html', 'page10.html', 
#'     'page11.html', 'page12.html', 'page13.html', 'page14.html', 'page15.html', 
#'     'page16.html', 'page17.html', 'page18.html', 'page19.html'))
#' output <- sr_flow_interactive(plot, urls)
#' output;
#' @export
sr_flow_interactive <- function(plot, 
                                urls) {
  node <- urls[,1]
  url <- urls[,2]
  
    #the following function produces three lines of JavaScript per node to add a specified hyperlink for the node, pulled in from nodes.csv
    myfun <- function(node, 
                      url){
      t <- paste0('const ', node, ' = document.getElementById("', node, '");
  var link', node, ' = "<a href=', url, ' target=\'_blank\'>" + ', node, '.innerHTML + "</a>"
  ', node, '.innerHTML = link', node, ';
  ')
    }
    #the following code adds the location link for the new window
    javascript <- htmltools::HTML(paste(mapply(myfun, 
                                               node, 
                                               url), 
                                        collapse = '\n'))  
    htmlwidgets::prependContent(plot, 
                                htmlwidgets::onStaticRenderComplete(javascript))
   
}
