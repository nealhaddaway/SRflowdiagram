x <- grViz("

digraph TD {

# node statements
node [shape = box,
      fontname = Helvetica,
      style = filled,
      color = LightBlue1]
1 [label = '@@1']
2 [label = '@@2']
13 [label = '@@13']
18 [label = '@@18']

node [shape = box,
      fontname = Helvetica,
      style = filled,
      color = HoneyDew2]
3 [label = '@@3']
5 [label = '@@5']
7 [label = '@@7']
9 [label = '@@9']
11 [label = '@@11']
14 [label = '@@14']
15 [label = '@@15']
17 [label = '@@17']

node [shape = box,
      fontname = Helvetica,
      style = filled,
      color = RosyBrown1]
4 [label = '@@4']
6 [label = '@@6']
8 [label = '@@8']
10 [label = '@@10']
12 [label = '@@12']
16 [label = '@@16']
19 [label = '@@19']

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

")
x
#add javascript to replace 'id="node1"' with 'id="node1" href="[url]"


devtools::install_github('rich-iannone/DiagrammeR')
library(DiagrammeR)

search_results <- 'xxx'
other_results <- 'xxx'
unique_records <- 'xxx'
duplicates <- 'xxx'
included_titles <- 'xxx'
excluded_titles <- 'xxx'
included_abstracts <- 'xxx'
excluded_abstracts <- 'xxx'
retrieved_fulltexts <- 'xxx'
notaccessible_fulltexts <- 'xxx'
notfound_fulltexts <- 'xxx'
included_fulltexts <- 'xxx'
excluded_fulltexts <- 'xxx'
exclusion_reasons <- data.frame(reason = c('reason1', 
                                           'reason2', 
                                           'reason3'), 
                                number = c('xxx', 
                                           'xxx', 
                                           'xxx'))
prescreened_records <- 'xxx'
included_articles <- 'xxx'
included_studies <- 'xxx'
critappr_includes <- 'xxx'
critappr_excludes <- 'xxx'
critappr_exclusion_reasons <- data.frame(reason = c('reason1', 
                                                    'reason2', 
                                                    'reason3'), 
                                         number = c('xxx', 
                                                    'xxx', 
                                                    'xxx'))
narrsynth_includes <- 'xxx'
fullsynth_includes <- 'xxx'
fullsynth_excludes <- 'xxx'
fullsynth_exclusion_reasons <- data.frame(reason = c('reason1', 
                                                     'reason2', 
                                                     'reason3'), 
                                          number = c('xxx', 
                                                     'xxx', 
                                                     'xxx'))

node1 <- paste0('Records identified through database searching\nn = ',
                search_results)
node2 <- paste0('Records identified through other sources, listed\nn = ',
                other_results)
node3 <- paste0('Records after duplicates removed\nn = ',
                unique_records)
node4 <- paste0('Duplicates\nn = ',
                duplicates)
node5 <- paste0('Records after title screening\nn = ',
                included_titles)
node6 <- paste0('Excluded titles\nn = ',
                excluded_titles)
node7 <- paste0('Records after acstract screening\nn = ',
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
                 '/ n = ',
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

urldf <- data.frame(nodeid = c("node1", "node2", "node3", "node4", "node5", 
                               "node6", "node7", "node8", "node9", "node10",
                               "node11", "node12", "node13", "node14", "node15",
                               "node16", "node17", "node18", "node19"),
                    url = c("node1.html", "node2.html", "node3.html", "node4.html", "node5.html", 
                            "node6.html", "node7.html", "node8.html", "node9.html", "node10.html",
                            "node11.html", "node12.html", "node13.html", "node14.html", "node15.html",
                            "node16.html", "node17.html", "node18.html", "node19.html"))

nodes <- read.csv(file.choose())

interact <- function(x, nodes) {
  #the following function produces three lines of JavaScript per node to add a specified hyperlink for the node, pulled in from nodes.csv
  myfun <- function(node, 
                    url){
t <- paste0('const ', node, ' = document.getElementById("', node, '");
var link', node, ' = "<a href=', url, ' target=\'_blank\'>" + ', node, '.innerHTML + "</a>"
', node, '.innerHTML = link', node, ';
')
  }
  #the following code adds the location link for the new window - here specified to 'iframe2', but works in a new window if no iframe named
  javascript <- htmltools::HTML(paste(mapply(myfun, nodes$node, nodes$link), collapse = '\n'))  
  htmlwidgets::prependContent(x, htmlwidgets::onStaticRenderComplete(javascript))
}

interact(x, nodes)
