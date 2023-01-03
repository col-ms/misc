# Defines a function to generate a file name for a .png
# file, takes optional path argument to specify desired
# file location. Step param used to identify the file.
fnamegen <- function(step = 1, path = NULL){
  if(is.null(path)) path <- 'cell-plots/'
  dir.create(path = path, showWarnings = FALSE)
  return(paste0(path,'step',step,'.png',collapse=''))
}