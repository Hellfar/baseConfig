#!/usr/bin/env R

data.frame(
  datetime=lock_screen_log[[1]],
  timestamp=strptime(lock_screen_log[[1]], "%a %b %d %T CEST %Y")
)
