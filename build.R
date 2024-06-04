library(bookdown)

build_chapter_hdz <- function(
  head, toc, chapter, link_prev, link_next, rmd_cur, html_cur, foot
) {
  toc = gsub("^(<li>)(.+<ul>)$", "<li class=\"has-sub\">\\2", 
             toc)
  chapter = gsub("class=\"section ", "class=content \"", 
                 chapter)
  chapter = gsub("<h1(.+)?/h1>", "<h1\\1/h1><hr/>", 
                 chapter)
  paste(c(
    head, 
    toc, 
    chapter, 
    "<p style=\"text-align: center;\">", 
    bookdown:::source_link(rmd_cur, type = "edit"), 
    bookdown:::source_link(rmd_cur, type = "history"), 
    bookdown:::source_link(rmd_cur, type = "view"),
    foot), 
    collapse = "\n")
}

output <- html_book(
  split_by = "chapter", 
  template = bookdown:::bookdown_file("templates/hedaozi_iknow.html"),
  page_builder = build_chapter_hdz,
  toc_depth = 1
)

rmarkdown::render_site(
  output_format = output, 
  encoding = 'UTF-8'
)
