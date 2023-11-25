library(tidyverse)

## ATTENTION: Changes files in place!!

directory <- "data/RemNote_Export"

files <- list.files(path = directory, pattern = "\\.md$", full.names = TRUE, recursive = TRUE)
# files

# dir <- paste0(dirname(files[1]), "_cleaned")
#
# # remove existing
# unlink(dir, recursive = TRUE)
#
# # create new folder
# dir.create(dir)


for (file in files) {
  content <- readLines(con = file, encoding = "UTF-8")
  modified_content <- content |>
    str_replace_all("\\[(.+?)\\]", "[[\\1]]") |> # use match group, non-greedy
    str_remove_all("(?<=])\\(.+?\\.md\\)") # non-greedy ? and look-behind


  # new_file <- paste0(dirname(file), "_cleaned/", basename(file))
  writeLines(modified_content, con = file)
  cat("Processed:", file, "\n")
}
