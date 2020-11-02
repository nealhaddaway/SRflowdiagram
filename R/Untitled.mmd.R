DiagrammeR(
  paste0("graph TB;", "\n",
       node1, "\n",
       node2, "\n",
       node3
       )
)

node1 <- paste0('node1(Records identified through database searching<br />n = ',
                search_results,
                ')')
node2 <- paste0('node2(Records identified through other sources, listed<br />n = ',
                other_results,
                ')')
node3 <- paste0('node3(Records after duplicates removed<br />n = ',
                unique_records,
                ')')
node4 <- paste0('node4(Duplicates<br />n = ',
                duplicates,
                ')')
node5 <- paste0('node5(Records after title screening<br />n = ',
                included_titles,
                ')')
node6 <- paste0('node6(Excluded titles<br />n = ',
                excluded_titles,
                ')')
node7 <- paste0('node7(Records after acstract screening<br />n = ',
                included_abstracts,
                ')')
node8 <- paste0('node8(Excluded abstracts<br />n = ',
                excluded_abstracts,
                ')')
node9 <- paste0('node9(Articles retrieved at full text<br />n = ',
                retrieved_fulltexts,
                ')')
node10 <- paste0('node10(Unretrievable full texts<br />Not accessible n = ',
                 notaccessible_fulltexts,
                 '; Not found n = ',
                 notfound_fulltexts,
                 ')')
node11 <- paste0('node11(Articles after full text screening<br />n = ',
                 retrieved_fulltexts,
                 ')')
node12 <- paste0('node12(Excluded full texts<br />n = ',
                 retrieved_fulltexts,
                 ')<br />',
                 'Exclusion reasons:<br />',
                 paste(paste(exclusion_reasons[,1],
                             exclusion_reasons[,2],
                             sep = '; n = '),
                       collapse = '<br />'))
node13 <- paste0('node13(Pre-screened articles from other sources<br />n = ',
                 prescreened_records,
                 ')')
node14 <- paste0('node14(Articles / Studies included in the review<br />n = ',
                 included_articles,
                 '/ n = ',
                 included_studies,
                 ')')
node15 <- paste0('node15(Studies included after critical appraisal<br />n = ',
                 critappr_includes,
                 ')')
node16 <- paste0('node16(Excluded from further synthesis<br />n = ',
                 critappr_excludes,
                 ')<br />',
                 'Exclusion reasons:<br />',
                 paste(paste(critappr_exclusion_reasons[,1],
                             critappr_exclusion_reasons[,2],
                             sep = '; n = '),
                       collapse = '<br />'))
node17 <- paste0('node17(Studies included in narrative synthesis<br />n = ',
                 narrsynth_includes,
                 ')')
node18 <- paste0('node18(Studies included in quantitative/qualitative/other synthesis<br />n = ',
                 fullsynth_includes,
                 ')')
node19 <- paste0('node19(Studies not included in further synthesis<br />n = ',
                 fullsynth_excludes,
                 'Exclusion reason:',
                 paste(paste(fullsynth_exclusion_reasons[,1],
                             fullsynth_exclusion_reasons[,2],
                             sep = '; n = '),
                       collapse = '<br />'))