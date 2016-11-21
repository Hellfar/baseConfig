#!/usr/bin/env Rscript

lock_screen_log <- read.delim("~/log/lock_screen.log")

lock_screen_data <- data.frame(
  datetime=lock_screen_log[[1]],
  lap=strptime(lock_screen_log[[1]], "%a %b %d %T CEST %Y"),
  way=lock_screen_log[[2]]
)
