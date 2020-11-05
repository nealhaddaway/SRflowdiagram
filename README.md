# SRflowdiagram <img src="SRflowdiagram.png" align="right" width="40%" height="40%" />

Evidence reviews (including systematic reviews and maps) should be described in a high degree of methodological detail. An integral part of the methodological description of a review is a flow driagram (e.g. the famous PRISMA flow diagram). 

This package produces an interactive flow diagram using a .Rhtml document to output an interactive .html file that can be added as a static image to a review report or embedded within a project website as an interactive visualisation of the review process. 

When interactive, the user can click on each box and be directed to another website or file online (e.g. a detailed description of the screeeing methods, or a list of excluded full texts), with a mouseover tool tip that describes the information linked to in more detail. 

The file choices are:

* Systematic reviews (file names beginning with 'SR...')
* Systematic maps (file names beginning with 'SM...')

* Title and abstract screening conducted together (file names containing 'TAcombined')
* Title and absrtact screening conducted separately (file names containing 'TAseparate')

* Files requiring the user to enter the numbers of records in a code chunk at the start of the file before 'knitting' to produce an HTML output
* Files that read in a CSV file containing the relevant data for the flow diagram (the corresponding 'mapdata...csv' file)

There is a set of the files dedicated to systematic maps ('SM...Rhtml') and a set of the files dedicated to systematic reviews ('SR...Rhtml').

<a href="https://srflowdiagram.github.io/" target="_blank">See the interactive examples here.</a>

---
## PRISMA2020 Flow Chart <img src="PRISMA.png" align="right" width="40%" height="40%" />

You can now produce a flow chart that conforms to the PRISMA 2020 preprint standards by opening the 'PRISMA_flow.R' file in R and entering the relevant data in the R script. Simply replace the relevant 'xxx' values with your data and rerun the `PRISMA_flowchart()` function, which (if 'interactive = TRUE') produces an interactive HTML ouput with each box linking to a specific page (e.g. of search results or methods details), and hover-over tooltips for further information. A static version is produced otherwise. <a href="https://srflowdiagram.github.io/template.html" target="_blank">See the interactive template here.</a>
