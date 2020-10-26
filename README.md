# SRflowdiagram <img src="SRflowdiagram.png" align="right" width="40%" height="40%" />

Evidence reviews (including systematic reviews and maps) should be described in a high degree of methodological detail. An integral part of the methodological description of a review is a flow driagram (e.g. the famous PRISMA flow diagram). 

This package produces an interactive flow diagram using a .Rhtml document to output an interactive .html file that can be added as a static image to a review report or embedded within a project website as an interactive visualisation of the review process. 

When interactive, the user can click on each box and be directed to another website or file online (e.g. a detailed description of the screeeing methods, or a list of excluded full texts), with a mouseover tool tip that describes the information linked to in more detail. 

The file choices are:

* Systematic reviews (file names beginning with 'SR...')
* Systematic maps (file names beginning with 'SM...')

* Title and absract screening conducted together (file names containing '_TAcombined')
* Title and absract screening conducted separately (file names containing '_TAseparate')

* Files requiring the user to enter the numbers of records in a code chunk at the start of the file before 'knitting' to produce an HTML output
* Files that read in a CSV file containing the relevant data for the flow diagram (the corresponding 'mapdata...csv' file)

<a href="https://srflowdiagram.github.io/" target="_blank">See the interactive example here.</a>