# EXAMPLE SOLUTIONS

The code here illustrates two approaches to re-factoring `bad.R`. Your approach might be different!

For both approaches, the work is broken up into steps:

 - synthesize a population,
 - extract features from that population in an analysis,
 - and finally visualize the synthetic population + analysis results

...and then there's a single point that applies each of these steps: either `main.R` or using the `Makefile`.  You can watch either in action from Rstudio or the command line. In Rstudio, navigate to the solutions directory, set it as your working directory, then open and source the `main.R` script.  Or you can use the Rstudio terminal, again navigate to the solutions directory, then type command `make` which will invoke `make` with the defaults (i.e., assumes you want to use the targets in a file named `Makefile` and to create the first one defined).

Both approaches use the same underlying scripts. Because of this, there are some bits that
might seem strange at the start of the files. You can safely ignore these, but they do have comments explaining
how they work, and feel free to ask the instructor about them.

