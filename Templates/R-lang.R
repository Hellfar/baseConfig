#!/usr/bin/env Rscript

if (!require("optparse", quietly = TRUE)) {
	install.packages("optparse", repos="http://cran.rstudio.com/")
	library("optparse")
}

parser <- OptionParser()
parser <- add_option(parser, c("-v", "--verbose"), action="store_true",
                default=TRUE, help="Print extra output [default]")
parser <- add_option(parser, c("-q", "--quietly"), action="store_false",
                    dest="verbose", help="Print little output")
parser <- add_option(parser, c("-c", "--count"), type="integer", default=5,
                help="Number of random normals to generate [default %default]",
                metavar="number")
options <- parse_args(parser)

x11()

numbers <- scan("stdin")
plot(1:length(numbers), numbers, type="l")

while (!is.null(dev.list())) Sys.sleep(.1)
