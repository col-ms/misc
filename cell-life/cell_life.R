cnt.nbrs <- function(x, i, j){
  if(i < nrow(x) & j < ncol(x)){
    return(sum(c(x[i-1, j-1],
                 x[i-1, j],
                 x[i-1, j+1],
                 x[i, j-1],
                 x[i, j+1],
                 x[i+1, j-1],
                 x[i+1, j],
                 x[i+1, j+1])))
  }
  else if(i == nrow(x) & j < ncol(x)){
    return(sum(c(x[i-1, j-1],
                 x[i-1, j],
                 x[i-1, j+1],
                 x[i, j-1],
                 x[i, j+1])))
  }
  else if(i < nrow(x) & j == ncol(x)){
    return(sum(c(x[i-1, j-1],
                 x[i-1, j],
                 x[i, j-1],
                 x[i+1, j-1],
                 x[i+1, j])))
  }
  else if(i == nrow(x) & j == ncol(x)){
    return(sum(c(x[i-1, j-1],
                 x[i-1, j],
                 x[i, j-1])))
  }
}

cells <- matrix(0, nrow = 101, ncol = 101)
cells[50, 50:52] = cells[51, c(50, 52)] = cells[52, 50:52] = 1

image(cells, col = c("darkblue", "orange"), 
      asp = 1, bty = "n", xaxt = "n", yaxt = "n", main = "1")

step = 1

repeat{
  copymat = cells
  for(i in 1:nrow(cells)){
    for(j in 1:nrow(cells)){
    cells[i, j] = ifelse(
      (cnt.nbrs(copymat, i, j) %% 2 != 0),
      1, 0)
    }
  }
  step = step + 1
  image(cells, col = c("darkblue", "orange"), 
        asp = 1, bty = "n", xaxt = "n", yaxt = "n", main = step)
  Sys.sleep(0.75)
}