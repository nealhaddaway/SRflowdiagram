#' Plot interactive flow charts for systematic reviews
#' 
#' @description 
#' @param plot A plot object from sr_flow().
#' @param urls A dataframe consisting of two columns: nodes and urls. The first
#' column should contain 19 rows for the nodes from node1 to node19. The second 
#' column should contain a corresponding URL for each node.
#' @param search_results 
#' @param other_results 
#' @param unique_records 
#' @param duplicates 
#' @param included_tanda 
#' @param excluded_tanda 
#' @param included_titles 
#' @param excluded_titles 
#' @param included_abstracts 
#' @param excluded_abstracts 
#' @param retrieved_fulltexts 
#' @param notaccessible_fulltexts 
#' @param notfound_fulltexts 
#' @param included_fulltexts 
#' @param excluded_fulltexts 
#' @param exclusion_reasons 
#' @param prescreened_records 
#' @param included_articles 
#' @param included_studies 
#' @param critappr_includes 
#' @param critappr_excludes 
#' @param critappr_exclusion_reasons 
#' @param narrsynth_includes 
#' @param fullsynth_includes 
#' @param fullsynth_excludes 
#' @param fullsynth_exclusion_reasons
#' @param titleabstract_separate Whether title and abstract screening should be 
#' separated (relevant values must be provided). Default is 'FALSE'.
#' @param font The default value is 'Helvetica.
#' @param node_style The default value is 'filled.
#' @param input_colour The default value is 'LightBlue1.
#' @param process_colour The default value is 'LemonChiffon1.
#' @param exclude_colour The default value is 'RosyBrown2.
#' @param output_colour The default value is 'HoneyDew2.
#' @param arrow_colour The default value is 'Black.
#' @param arrow_head The default value is 'none.
#' @param arrow_tail The default value is 'none' 
#' @return A flow chart plot.
#' @examples 
#' search_results <- 'xxx'
#' other_results <- 'xxx'
#' unique_records <- 'xxx'
#' duplicates <- 'xxx'
#' included_tanda <- 'xxx'
#' excluded_tanda <- 'xxx'
#' #included_titles <- 'xxx'
#' #excluded_titles <- 'xxx'
#' #included_abstracts <- 'xxx'
#' #excluded_abstracts <- 'xxx'
#' retrieved_fulltexts <- 'xxx'
#' notaccessible_fulltexts <- 'xxx'
#' notfound_fulltexts <- 'xxx'
#' included_fulltexts <- 'xxx'
#' excluded_fulltexts <- 'xxx'
#' exclusion_reasons <- data.frame(reason = c('reason1', 
#'                                            'reason2', 
#'                                            'reason3'), 
#'                                 number = c('xxx', 
#'                                            'xxx', 
#'                                            'xxx')) 
#' prescreened_records <- 'xxx'
#' included_articles <- 'xxx'
#' included_studies <- 'xxx'
#' critappr_includes <- 'xxx'
#' critappr_excludes <- 'xxx'
#' critappr_exclusion_reasons <- data.frame(reason = c('reason1', 
#'                                                     'reason2', 
#'                                                     'reason3'), 
#'                                          number = c('xxx', 
#'                                                     'xxx', 
#'                                                     'xxx'))
#' narrsynth_includes <- 'xxx'
#' fullsynth_includes <- 'xxx'
#' fullsynth_excludes <- 'xxx'
#' fullsynth_exclusion_reasons <- data.frame(reason = c('reason1', 
#'                                                      'reason2', 
#'                                                      'reason3'), 
#'                                           number = c('xxx', 
#'                                                      'xxx', 
#'                                                      'xxx'))
#' x <- sr_flow(search_results = search_results,
#'              other_results = other_results,
#'              unique_records = unique_records,
#'              duplicates = duplicates,
#'              included_titles = included_titles,
#'              excluded_titles = excluded_titles,
#'              included_abstracts = included_abstracts,
#'              excluded_abstracts = excluded_abstracts,
#'              retrieved_fulltexts = retrieved_fulltexts,
#'              notaccessible_fulltexts = notaccessible_fulltexts,
#'              notfound_fulltexts = notfound_fulltexts,
#'              included_fulltexts = included_fulltexts,
#'              excluded_fulltexts = excluded_fulltexts,
#'              exclusion_reasons = exclusion_reasons,
#'              prescreened_records = prescreened_records,
#'              included_articles = included_articles,
#'              included_studies = included_studies,
#'              critappr_includes = critappr_includes,
#'              critappr_excludes = critappr_excludes,
#'              critappr_exclusion_reasons = critappr_exclusion_reasons,
#'              narrsynth_includes = narrsynth_includes,
#'              fullsynth_includes = fullsynth_includes,
#'              fullsynth_excludes = fullsynth_excludes,
#'              fullsynth_exclusion_reasons = fullsynth_exclusion_reasons,
#'              titleabstract_separate = TRUE)
#' x
#' y <- sr_flow(search_results = search_results,
#'              other_results = other_results,
#'              unique_records = unique_records,
#'              duplicates = duplicates,
#'              included_tanda = included_tanda,
#'              excluded_tanda = excluded_tanda,
#'              retrieved_fulltexts = retrieved_fulltexts,
#'              notaccessible_fulltexts = notaccessible_fulltexts,
#'              notfound_fulltexts = notfound_fulltexts,
#'              included_fulltexts = included_fulltexts,
#'              excluded_fulltexts = excluded_fulltexts,
#'              exclusion_reasons = exclusion_reasons,
#'              prescreened_records = prescreened_records,
#'              included_articles = included_articles,
#'              included_studies = included_studies,
#'              critappr_includes = critappr_includes,
#'              critappr_excludes = critappr_excludes,
#'              critappr_exclusion_reasons = critappr_exclusion_reasons,
#'              narrsynth_includes = narrsynth_includes,
#'              fullsynth_includes = fullsynth_includes,
#'              fullsynth_excludes = fullsynth_excludes,
#'              fullsynth_exclusion_reasons = fullsynth_exclusion_reasons)
#' y
#' @export
sr_flow <- function (search_results,
                     other_results,
                     unique_records,
                     duplicates,
                     included_tanda,
                     excluded_tanda,
                     included_titles,
                     excluded_titles,
                     included_abstracts,
                     excluded_abstracts,
                     retrieved_fulltexts,
                     notaccessible_fulltexts,
                     notfound_fulltexts,
                     included_fulltexts,
                     excluded_fulltexts,
                     exclusion_reasons,
                     prescreened_records,
                     included_articles,
                     included_studies,
                     critappr_includes,
                     critappr_excludes,
                     critappr_exclusion_reasons,
                     narrsynth_includes,
                     fullsynth_includes,
                     fullsynth_excludes,
                     fullsynth_exclusion_reasons,
                     titleabstract_separate = FALSE,
                     font = 'Helvetica',
                     node_style = 'filled',
                     input_colour = 'LightBlue1',
                     process_colour = 'LemonChiffon1',
                     exclude_colour = 'RosyBrown2',
                     output_colour = 'HoneyDew2',
                     arrow_colour = 'Black',
                     arrow_head = 'none',
                     arrow_tail = 'none') {
  
  # If title and abstract data provided separately
  #if (exists('included_tanda') == FALSE && exists('excluded_tanda') == FALSE && 
     #(exists('included_titles') == TRUE && exists('excluded_titles') == TRUE && 
      #exists('included_abstracts') == TRUE && exists('excluded_abstracts') == TRUE) == TRUE) {
  if (titleabstract_separate == TRUE){
    
  # Set up text for nodes
  node1 <- paste0('Records identified through database searching\nn = ',
                  search_results)
  node2 <- paste0('Records identified through other sources\nn = ',
                  other_results)
  node3 <- paste0('Records after duplicates removed\nn = ',
                  unique_records)
  node4 <- paste0('Duplicates\nn = ',
                  duplicates)
  node5 <- paste0('Records after title screening\nn = ',
                  included_titles)
  node6 <- paste0('Excluded titles\nn = ',
                  excluded_titles)
  node7 <- paste0('Records after abstract screening\nn = ',
                  included_abstracts)
  node8 <- paste0('Excluded abstracts\nn = ',
                  excluded_abstracts)
  node9 <- paste0('Articles retrieved at full text\nn = ',
                  retrieved_fulltexts)
  node10 <- paste0('Unretrievable full texts:\nNot accessible n = ',
                   notaccessible_fulltexts,
                   '\nNot found n = ',
                   notfound_fulltexts)
  node11 <- paste0('Articles after full text screening\nn = ',
                   retrieved_fulltexts)
  node12 <- paste0('Excluded full texts\nn = ',
                   retrieved_fulltexts,
                   '\n\nExclusion reasons:\n',
                   paste(paste(exclusion_reasons[,1],
                               exclusion_reasons[,2],
                               sep = '; n = '),
                         collapse = '\n'))
  node13 <- paste0('Pre-screened articles from other sources\nn = ',
                   prescreened_records)
  node14 <- paste0('Articles / Studies included in the review\nn = ',
                   included_articles,
                   ' / n = ',
                   included_studies)
  node15 <- paste0('Studies included after critical appraisal\nn = ',
                   critappr_includes)
  node16 <- paste0('Excluded from further synthesis\nn = ',
                   critappr_excludes,
                   '\nExclusion reasons:\n',
                   paste(paste(critappr_exclusion_reasons[,1],
                               critappr_exclusion_reasons[,2],
                               sep = '; n = '),
                         collapse = '\n'))
  node17 <- paste0('Studies included in narrative synthesis\nn = ',
                   narrsynth_includes)
  node18 <- paste0('Studies included in quantitative/qualitative/other synthesis\nn = ',
                   fullsynth_includes)
  node19 <- paste0('Studies not included in further synthesis\nn = ',
                   fullsynth_excludes,
                   '\n\nExclusion reasons:\n',
                   paste(paste(fullsynth_exclusion_reasons[,1],
                               fullsynth_exclusion_reasons[,2],
                               sep = '; n = '),
                         collapse = '\n'))
  
  # Produce plot
  x <- DiagrammeR::grViz(
  paste0("digraph TD {
  
  # node statements
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", input_colour, "]
  1 [label = '@@1']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", input_colour, "]
  2 [label = '@@2']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  3 [label = '@@3']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  4 [label = '@@4']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  5 [label = '@@5']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  6 [label = '@@6']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  7 [label = '@@7']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  8 [label = '@@8']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  9 [label = '@@9']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  10 [label = '@@10']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  11 [label = '@@11']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  12 [label = '@@12']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", input_colour, "]
  13 [label = '@@13']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  14 [label = '@@14']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  15 [label = '@@15']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  16 [label = '@@16']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  17 [label = '@@17']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", output_colour, "]
  18 [label = '@@18']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  19 [label = '@@19']
  
  edge [color = ", arrow_colour, ", 
        arrowhead = ", arrow_head, ", 
        arrowtail = ", arrow_tail, "]
  1->3; 2->3;
  13->14; 
  3->4;
  3->5; 5->6;
  5->7; 7->8;
  7->9; 9->10;
  9->11; 11->12;
  11->14;
  14->15; 15->16;
  15->17;
  17->18; 18->19;
  
  {rank = same; 3; 4}
  {rank = same; 5; 6}
  {rank = same; 7; 8}
  {rank = same; 9; 10}
  {rank = same; 11; 12}
  {rank = same; 13; 14}
  {rank = same; 15; 16}
  {rank = same; 18; 19}
  
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
  
  "))
  
  return(x)
  
  } else if (titleabstract_separate == FALSE){
    
    # Set up text for nodes
    node1 <- paste0('Records identified through database searching\nn = ',
                    search_results)
    node2 <- paste0('Records identified through other sources\nn = ',
                    other_results)
    node3 <- paste0('Records after duplicates removed\nn = ',
                    unique_records)
    node4 <- paste0('Duplicates\nn = ',
                    duplicates)
    node5 <- paste0('Records after title and abstract screening\nn = ',
                    included_tanda)
    node6 <- paste0('Excluded titles and abstracts\nn = ',
                    excluded_tanda)
    node7 <- paste0('Articles retrieved at full text\nn = ',
                    retrieved_fulltexts)
    node8 <- paste0('Unretrievable full texts:\nNot accessible n = ',
                     notaccessible_fulltexts,
                     '\nNot found n = ',
                     notfound_fulltexts)
    node9 <- paste0('Articles after full text screening\nn = ',
                     retrieved_fulltexts)
    node10 <- paste0('Excluded full texts\nn = ',
                     retrieved_fulltexts,
                     '\n\nExclusion reasons:\n',
                     paste(paste(exclusion_reasons[,1],
                                 exclusion_reasons[,2],
                                 sep = '; n = '),
                           collapse = '\n'))
    node11 <- paste0('Pre-screened articles from other sources\nn = ',
                     prescreened_records)
    node12 <- paste0('Articles / Studies included in the review\nn = ',
                     included_articles,
                     ' / n = ',
                     included_studies)
    node13 <- paste0('Studies included after critical appraisal\nn = ',
                     critappr_includes)
    node14 <- paste0('Excluded from further synthesis\nn = ',
                     critappr_excludes,
                     '\nExclusion reasons:\n',
                     paste(paste(critappr_exclusion_reasons[,1],
                                 critappr_exclusion_reasons[,2],
                                 sep = '; n = '),
                           collapse = '\n'))
    node15 <- paste0('Studies included in narrative synthesis\nn = ',
                     narrsynth_includes)
    node16 <- paste0('Studies included in quantitative/qualitative/other synthesis\nn = ',
                     fullsynth_includes)
    node17 <- paste0('Studies not included in further synthesis\nn = ',
                     fullsynth_excludes,
                     '\n\nExclusion reasons:\n',
                     paste(paste(fullsynth_exclusion_reasons[,1],
                                 fullsynth_exclusion_reasons[,2],
                                 sep = '; n = '),
                           collapse = '\n'))
    
    # Produce plot
    x <- DiagrammeR::grViz(
      paste0("digraph TD {
  
  # node statements
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", input_colour, "]
  1 [label = '@@1']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", input_colour, "]
  2 [label = '@@2']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  3 [label = '@@3']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  4 [label = '@@4']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  5 [label = '@@5']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  6 [label = '@@6']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  7 [label = '@@7']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  8 [label = '@@8']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  9 [label = '@@9']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  10 [label = '@@10']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", input_colour, "]
  11 [label = '@@11']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  12 [label = '@@12']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  13 [label = '@@13']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  14 [label = '@@14']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", process_colour, "]
  15 [label = '@@15']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", output_colour, "]
  16 [label = '@@16']
  
  node [shape = box,
        fontname = ", font, ",
        style = ", node_style, ",
        color = ", exclude_colour, "]
  17 [label = '@@17']
  
  edge [color = ", arrow_colour, ", 
        arrowhead = ", arrow_head, ", 
        arrowtail = ", arrow_tail, "]
  1->3; 2->3;
  11->12; 
  3->4;
  3->5; 5->6;
  5->7; 7->8;
  7->9; 9->10;
  9->12;
  12->13; 13->14;
  13->15;
  15->16; 16->17
  
  {rank = same; 3; 4}
  {rank = same; 5; 6}
  {rank = same; 7; 8}
  {rank = same; 9; 10}
  {rank = same; 11; 12}
  {rank = same; 13; 14}
  {rank = same; 16; 17}
  
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
  
  "))
  
    return(x)
    
  } 
  
}
