#' Plot interactive flow charts for systematic reviews
#' 
#' @description Produces a PRISMA2020 style flow chart for systematic reviews, 
#' with the option to add interactivity through tooltips (mouseover popups) and 
#' hyperlink URLs to each box. 
#' @param plot A plot object from sr_flow().
#' @param urls A vector urls to act as hyperlinks for each box. A total of 16 
#' URLs should be provided for each box. See the 'PRISMA_flow_schema.png' for 
#' details of box numbers, sequentially from top left to bottom across columns, 
#' from left to right.
#' @param previous_studies
#' @param previous_reports
#' @param register_results
#' @param database_results
#' @param other_results
#' @param duplicates
#' @param excluded_automatic
#' @param excluded_other
#' @param records_screened
#' @param records_excluded
#' @param dbr_sought_reports
#' @param dbr_notretrieved_reports
#' @param other_sought_reports
#' @param other_notretrieved_reports
#' @param dbr_assessed
#' @param dbr_excluded
#' @param other_assessed
#' @param other_excluded
#' @param new_studies
#' @param new_reports
#' @param total_studies
#' @param total_reports
#' @param tooltips Mouseover popups for each box containing explanatory text. 
#' Should be provided as a vector.
#' @param interactive Logical argument TRUE or FALSE whether to plot interactivity 
#' (tooltips and hyperlinked boxes).
#' @param font The font for text in each box. The default is 'Helvetica'.
#' @param title_colour The colour for the upper middle title box (new studies). 
#' The default is 'Goldenrod1'. See DiagrammeR colour scheme 
#' <http://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html#colors>.
#' @param greybox_colour The colour for the left and right column boxes. The 
#' default is 'Gainsboro'. See DiagrammeR colour scheme 
#' <http://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html#colors>.
#' @param main_colour The colour for the main box borders. The default is 
#' 'Black'. See DiagrammeR colour scheme 
#' <http://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html#colors>.
#' @param arrow_colour The colour for the connecting lines. The default
#' is 'Black'. See DiagrammeR colour scheme 
#' <http://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html#colors>.
#' @param arrow_head The head shape for the line connectors. The default is 
#' 'normal'. See DiagrammeR arrow shape specification 
#' <http://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html#arrow-shapes>.
#' @param arrow_tail The tail shape for the line connectors. The default is 
#' 'none'. See DiagrammeR arrow shape specification 
#' <http://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html#arrow-shapes>.
#' @return A flow chart plot.
#' @examples 
#' tooltips <- c("Previous studies", "Box 1", "New studies", "Box 2", "Box 3", 
#'     "Box 4", "Box 5", "Box 6", "Box 7", "Box 8", "Box 9", "Box 10", 
#'     "Other studies", "Box 11", "Box 12", "Box 13", "Box 14", 
#'     "Box 15", "Box 16", "Identification", "Screening", "Included")
#' urls <- c('page1.html', 'page2.html', 'page3.html', 'page4.html', 'page5.html', 
#'     'page6.html', 'page7.html', 'page8.html', 'page9.html', 'page10.html', 
#'     'page11.html', 'page12.html', 'page13.html', 'page14.html', 'page15.html', 
#'     'page16.html')
#' previous_studies <- 'xxx'
#' previous_reports <- 'xxx'
#' register_results <- 'xxx'
#' database_results <- 'xxx'
#' other_results <- data.frame(source = c('Websites', 'Organisations', 
#'     'Citation searching'), number = c('xxx', 'xxx', 'xxx'))
#' duplicates <- 'xxx'
#' excluded_automatic <- 'xxx'
#' excluded_other <- 'xxx'
#' records_screened <- 'xxx'
#' records_excluded <- 'xxx'
#' dbr_sought_reports <- 'xxx'
#' dbr_notretrieved_reports <- 'xxx'
#' other_sought_reports <- 'xxx'
#' other_notretrieved_reports <- 'xxx'
#' dbr_assessed <- 'xxx'
#' dbr_excluded <- data.frame(reason = c('Reason 1', 
#'                                       'Reason 2', 
#'                                       'Reason 3'), 
#'                            number = c('xxx', 
#'                                       'xxx', 
#'                                       'xxx'))
#' other_assessed <- 'xxx'
#' other_excluded <- data.frame(reason = c('Reason 1', 
#'                                         'Reason 2', 
#'                                         'Reason 3'), 
#'                              number = c('xxx', 
#'                                         'xxx', 
#'                                         'xxx'))
#' new_studies <- 'xxx'
#' new_reports <- 'xxx'
#' total_studies <- 'xxx'
#' total_reports <- 'xxx'
#' plot <- PRISMA_flowchart(previous_studies = previous_studies,
#'                 previous_reports = previous_reports,
#'                 register_results = register_results,
#'                 database_results = database_results,
#'                 other_results = other_results,
#'                 duplicates = duplicates,
#'                 excluded_automatic = excluded_automatic,
#'                 excluded_other = excluded_other,
#'                 records_screened = records_screened,
#'                 records_excluded = records_excluded,
#'                 dbr_sought_reports = dbr_sought_reports,
#'                 dbr_notretrieved_reports = dbr_notretrieved_reports,
#'                 other_sought_reports = other_sought_reports,
#'                 other_notretrieved_reports = other_notretrieved_reports,
#'                 dbr_assessed = dbr_assessed,
#'                 dbr_excluded = dbr_excluded,
#'                 other_assessed = other_assessed,
#'                 other_excluded = other_excluded,
#'                 new_studies = new_studies,
#'                 new_reports = new_reports,
#'                 total_studies = total_studies,
#'                 total_reports = total_reports,
#'                 tooltips = tooltips,
#'                 interactive = TRUE)
#' plot
#' @export
PRISMA_flowchart <- function (previous_studies,
                             previous_reports,
                             register_results,
                             database_results,
                             other_results,
                             duplicates,
                             excluded_automatic,
                             excluded_other,
                             records_screened,
                             records_excluded,
                             dbr_sought_reports,
                             dbr_notretrieved_reports,
                             other_sought_reports,
                             other_notretrieved_reports,
                             dbr_assessed,
                             dbr_excluded,
                             other_assessed,
                             other_excluded,
                             new_studies,
                             new_reports,
                             total_studies,
                             total_reports,
                             tooltips = '',
                             interactive = FALSE,
                             font = 'Helvetica',
                             title_colour = 'Goldenrod1',
                             greybox_colour = 'Gainsboro',
                             main_colour = 'Black',
                             arrow_colour = 'Black',
                             arrow_head = 'normal',
                             arrow_tail = 'none') {
  
  # Node text preparation
  # Left branch
  node1 <- 'Previous studies'
  node2 <- paste0('Studies included in\nprevious version of\nreview (k = ',
                  previous_studies, 
                  ')\n\nReports of studies\nincluded in previous\nversion of review (k = ',
                  previous_reports,
                  ')')
  # Central branch
  node3 <- 'Identification of new studies via databases and registers'
  node4 <- paste0('Records identified from:\n\tDatabases (k = ',
                  database_results,
                  ')\n\tRegisters (k = ',
                  register_results,
                  ')')
  node5 <- paste0('Records removed before\nscreening:\n\tDuplicate records (k = ',
                  duplicates,
                  ')\n\tRecords marked as ineligible\nby automation tools (k = ',
                  excluded_automatic,
                  ')\n\tRecords removed for other\nreasons (k = ',
                  excluded_other,
                  ')')
  node6 <- paste0('Records screened\n(k = ',
                  records_screened,
                  ')')
  node7 <- paste0('Records excluded*\n(k = ',
                  records_excluded,
                  ')')
  node8 <- paste0('Reports sought for retrieval\n(k = ',
                  dbr_sought_reports,
                  ')')
  node9 <- paste0('Reports not retrieved\n(k = ',
                  dbr_notretrieved_reports,
                  ')')
  node10 <- paste0('Reports assessed for eligibility\n(k = ',
                   dbr_assessed,
                   ')')
  node11 <- paste0('Reports excluded:',
                   paste(paste('\n\t', dbr_excluded[,1], ' (k = ', dbr_excluded[,2], ')', sep = ''), collapse = ''))
  node12 <- paste0('New studies included in review\n(k = ',
                   new_studies,
                   ')\n',
                   'Reports of new included studies\n(k = ',
                   new_reports,
                   ')')
  # Right branch
  node13 <- 'Identification of new studies via other methods'
  node14 <- paste0('Records identified from:',
                   paste(paste('\n\t', other_results[,1], ' (k = ', other_results[,2], ')', sep = ''), collapse = ''))
  node15 <- paste0('Reports sought for retrieval\n(k = ',
                   other_sought_reports,
                   ')')
  node16 <- paste0('Reports not retrieved\n(k = ',
                   other_notretrieved_reports,
                   ')')
  node17 <- paste0('Reports assessed for eligibility\n(k = ',
                   other_assessed,
                   ')')
  node18 <- paste0('Reports excluded:',
                   paste(paste('\n\t', other_excluded[,1], ' (k = ', other_excluded[,2], ')', sep = ''), collapse = ''))
  node19 <- paste0('Total studies included in review\n(k = ',
                   total_studies,
                   ')\n',
                   'Reports of total included studies\n(k = ',
                   total_reports,
                   ')')
  
  # Produce plot
  x <- DiagrammeR::grViz(
    paste0("digraph TD {
  
  graph[splines=ortho, layout=neato, tooltip = 'Click the boxes for further information']
  
  # node statements
  node [shape = box]
  identification [image='identification.png', color = LightSteelBlue2, label='', style = 'filled,rounded', pos='-1.5,7.93!', width = 0.4, height = 2.6, tooltip = '", tooltips[20], "'];
  screening [image='screening.png', color = LightSteelBlue2, label='', style = 'filled,rounded', pos='-1.5,4.5!', width = 0.4, height = 3.5, tooltip = '", tooltips[21], "'];
  included [image='included.png', color = LightSteelBlue2, label='', style = 'filled,rounded', pos='-1.5,0.87!', width = 0.4, height = 2.5, tooltip = '", tooltips[22], "'];
  
  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  1 [label = '@@1', style = 'rounded,filled', width = 3, height = 0.5, pos='0.5,9!', tooltip = '", tooltips[1], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  2 [label = '@@2', style = 'filled', width = 3, height = 0.5, pos='0.5,7.5!', tooltip = '", tooltips[2], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", title_colour, "]
  3 [label = '@@3', style = 'rounded,filled', width = 7, height = 0.5, pos='6,9!', tooltip = '", tooltips[3], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, "]
  4 [label = '@@4', width = 3, width = 3, height = 0.5, height = 0.5, pos='4,7.5!', tooltip = '", tooltips[4], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, "]
  5 [label = '@@5', width = 3, height = 0.5, pos='8,7.5!', tooltip = '", tooltips[5], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, "]
  6 [label = '@@6', width = 3, width = 3, height = 0.5, height = 0.5, pos='4,5.5!', tooltip = '", tooltips[6], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, "]
  7 [label = '@@7', width = 3, height = 0.5, pos='8,5.5!', tooltip = '", tooltips[7], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, "]
  8 [label = '@@8', width = 3, width = 3, height = 0.5, height = 0.5, pos='4,4.5!', tooltip = '", tooltips[8], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, "]
  9 [label = '@@9', width = 3, height = 0.5, pos='8,4.5!', tooltip = '", tooltips[9], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, "]
  10 [label = '@@10', width = 3, height = 0.5, pos='4,3.5!', tooltip = '", tooltips[10], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, "]
  11 [label = '@@11', width = 3, height = 0.5, pos='8,3.5!', tooltip = '", tooltips[11], "']
    
  node [shape = box,
        fontname = ", font, ",
        color = ", main_colour, ", pos='6,4.5!', tooltip = '", tooltips[12], "']
  12 [label = '@@12', pos='4,1.5!']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  13 [label = '@@13', style = 'rounded,filled', width = 7, height = 0.5, pos='13.5,9!', tooltip = '", tooltips[13], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  14 [label = '@@14', style = 'filled', width = 3, height = 0.5, pos='11.5,7.5!', tooltip = '", tooltips[14], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  15 [label = '@@15', style = 'filled', width = 3, height = 0.5, pos='11.5,4.5!', tooltip = '", tooltips[15], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  16 [label = '@@16', style = 'filled', width = 3, height = 0.5, pos='15.5,4.5!', tooltip = '", tooltips[16], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  17 [label = '@@17', style = 'filled', width = 3, height = 0.5, pos='11.5,3.5!', tooltip = '", tooltips[17], "']
  
  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  18 [label = '@@18', style = 'filled', width = 3, height = 0.5, pos='15.5,3.5!', tooltip = '", tooltips[18], "']

  node [shape = box,
        fontname = ", font, ",
        color = ", greybox_colour, "]
  19 [label = '@@19', style = 'filled', width = 3, height = 0.5, pos='4,0!', tooltip = '", tooltips[19], "']
  
  node [shape = square, width = 0, color=White]
  A [label = '', pos='0.5,0!']
  B [label = '', pos='11.5,1.5!']
  
  subgraph cluster0 {
    edge [color = White, 
        arrowhead = none, 
        arrowtail = none]
    1->2;
    edge [color = ", arrow_colour, ", 
        arrowhead = none, 
        arrowtail = ", arrow_tail, "]
    2->A; 
    edge [color = ", arrow_colour, ", 
        arrowhead = ", arrow_head, ", 
        arrowtail = none,
        constraint = FALSE]
    A->19;
  }
  
  subgraph cluster1 {
    edge [style = invis]
    3->4; 3->5;
    edge [color = ", arrow_colour, ", 
        arrowhead = ", arrow_head, ", 
        arrowtail = ", arrow_tail, ", 
        style = filled]
    4->5;
    4->6; 6->7;
    6->8; 8->9;
    8->10; 10->11;
    10->12;
    edge [style = invis]
    5->7;
    7->9;
    9->11;
    16->18;
  }
  
  subgraph cluster2 {
    edge [color = White, 
          arrowhead = none, 
          arrowtail = none]
    13->14;
    edge [color = ", arrow_colour, ", 
        arrowhead = ", arrow_head, ", 
        arrowtail = ", arrow_tail, "]
    14->15; 15->16;
    15->17; 17->18;
    edge [color = ", arrow_colour, ", 
        arrowhead = none, 
        arrowtail = ", arrow_tail, "]
    17->B; 
    edge [color = ", arrow_colour, ", 
        arrowhead = ", arrow_head, ", 
        arrowtail = none,
        constraint = FALSE]
    B->12;
  }
  
  edge [color = ", arrow_colour, ", 
        arrowhead = ", arrow_head, ", 
        arrowtail = ", arrow_tail, "]

  12->19;
  
  {rank = same; A; 19}
  {rank = same; 1; 3; 13}
  {rank = same; 2; 4; 5; 14}
  {rank = same; 6; 7}
  {rank = same; 8; 9; 15; 16}
  {rank = same; 10; 11; 17; 18}
  {rank = same; 12; B}
  
  }
  
  [1]: node1
  [2]: node2
  [3]: node3
  [4]: node4
  [5]: node5
  [6]: node6
  [7]: node7
  [8]: node8
  [9]: node9
  [10]: node10
  [11]: node11
  [12]: node12
  [13]: node13
  [14]: node14
  [15]: node15
  [16]: node16
  [17]: node17
  [18]: node18
  [19]: node19
  
  ")
    
  ) 
  
  insertJS <- function(plot){
    javascript <- htmltools::HTML('
var theDiv = document.getElementById("node1");
theDiv.innerHTML += "<text text-anchor=\'middle\' style=\'transform: rotate(-90deg);\' x=\'610\' y=\'19\' font-family=\'Helvetica,sans-Serif\' font-size=\'14.00\'>Identification</text>";
var theDiv = document.getElementById("node2");
theDiv.innerHTML += "<text text-anchor=\'middle\' style=\'transform: rotate(-90deg);\' x=\'365\' y=\'19\' font-family=\'Helvetica,sans-Serif\' font-size=\'14.00\'>Screening</text>";
var theDiv = document.getElementById("node3");
theDiv.innerHTML += "<text text-anchor=\'middle\' style=\'transform: rotate(-90deg);\' x=\'105\' y=\'19\' font-family=\'Helvetica,sans-Serif\' font-size=\'14.00\'>Included</text>";
                              ')
    htmlwidgets::appendContent(plot, htmlwidgets::onStaticRenderComplete(javascript))
  }
  
  x <- insertJS(x)
  
  if (interactive == TRUE) {
    x <- sr_flow_interactive(x, urls)
  }
  
  return(x)
}


#' Insert rotated text to side panel nodes
#' 
#' @description Text cannot be rotated within DiagrammeR, so this function appends 
#' a Javascript function to add in rotated text after the id="node" <g> tag that 
#' corresponds to the blue nodes at the side of the plot.
#' @param plot A PRISMA_flowchart plot.
#' @return A plot object containing javascript code.
#' @example 
#' \donttest{
#' plot <- insertJS(plot)
#' plot
#' }
#' @export
insertJS <- function(plot){
  javascript <- htmltools::HTML('
var theDiv = document.getElementById("node1");
theDiv.innerHTML += "<text text-anchor=\'middle\' style=\'transform: rotate(-90deg);\' x=\'610\' y=\'19\' font-family=\'Helvetica,sans-Serif\' font-size=\'14.00\'>Identification</text>";
var theDiv = document.getElementById("node2");
theDiv.innerHTML += "<text text-anchor=\'middle\' style=\'transform: rotate(-90deg);\' x=\'365\' y=\'19\' font-family=\'Helvetica,sans-Serif\' font-size=\'14.00\'>Screening</text>";
var theDiv = document.getElementById("node3");
theDiv.innerHTML += "<text text-anchor=\'middle\' style=\'transform: rotate(-90deg);\' x=\'105\' y=\'19\' font-family=\'Helvetica,sans-Serif\' font-size=\'14.00\'>Included</text>";
                              ')
  htmlwidgets::appendContent(plot, htmlwidgets::onStaticRenderComplete(javascript))
}


#' Plot interactive flow charts for systematic reviews
#' 
#' @description Converts a PRISMA systematic review flow chart into an 
#' interactive HTML plot, for embedding links from each box.
#' @param plot A plot object from sr_flow().
#' @param urls A dataframe consisting of two columns: nodes and urls. The first
#' column should contain 19 rows for the nodes from node1 to node19. The second 
#' column should contain a corresponding URL for each node.
#' @param intro_link Optional link for the blue 'Introduction' box. Default is 
#' empty.
#' @param screen_link Optional link for the blue 'Screening' box. Default is 
#' empty.
#' @param incl_link Optional link for the blue 'Included' box. Default is 
#' empty.
#' @return An interactive flow diagram plot.
#' @examples 
#' urls <- c('page1.html', 'page2.html', 'page3.html', 'page4.html', 'page5.html', 
#'     'page6.html', 'page7.html', 'page8.html', 'page9.html', 'page10.html', 
#'     'page11.html', 'page12.html', 'page13.html', 'page14.html', 'page15.html', 
#'     'page16.html')
#' output <- sr_flow_interactive(x, urls)
#' output;
#' @export
sr_flow_interactive <- function(plot, 
                                urls,
                                intro_link = '',
                                screen_link = '',
                                incl_link = '',
                                previous_link = '',
                                new_link = '',
                                other_link = '') {
  
  link <- data.frame(box = c('identification', 'screening', 'included', 'prevstud', 
                             'box1', 'newstud', 'box2', 'box3', 'box4', 'box5', 
                             'box6', 'box7', 'box8', 'box9', 'box10', 'othstud', 
                             'box11', 'box12', 'box13', 'box14', 'box15', 'box16', 
                             'A', 'B'), 
                     url = c(intro_link, screen_link, incl_link, previous_link, urls[1], new_link, 
                             urls[2], urls[3], urls[4], urls[5], urls[6], urls[7], 
                             urls[8], urls[9], urls[10], other_link, urls[11], urls[12], 
                             urls[13], urls[14], urls[15], urls[16], '', ''), 
                     node = paste0('node', seq(1, 24)))
  node <- link$node
  url <- link$url
  
  #the following function produces three lines of JavaScript per node to add a specified hyperlink for the node, pulled in from nodes.csv
  myfun <- function(node, 
                    url){
    t <- paste0('const ', node, ' = document.getElementById("', node, '");
  var link', node, ' = "<a href=\'', url, '\' target=\'_blank\'>" + ', node, '.innerHTML + "</a>";
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
