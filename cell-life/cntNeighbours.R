# Define a function that returns the number of active cells
# that neighbour a cell in a specified position.
cnt.nbrs <- function(x, i, j){
  
  # If cell is not at the edge of the matrix,
  # return the sum of all 8 neighbouring cells.
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
  
  # If cell is on bottom row of matrix,
  # return sum of 5 neighbouring cells.
  else if(i == nrow(x) & j < ncol(x)){
    return(sum(c(x[i-1, j-1],
                 x[i-1, j],
                 x[i-1, j+1],
                 x[i, j-1],
                 x[i, j+1])))
  }
  
  # If cell is on right edge of matrix,
  # return sum of 5 neighbouring cells.
  else if(i < nrow(x) & j == ncol(x)){
    return(sum(c(x[i-1, j-1],
                 x[i-1, j],
                 x[i, j-1],
                 x[i+1, j-1],
                 x[i+1, j])))
  }
  
  # If cell is on the bottom right corner of matrix,
  # return sum of 3 neighbouring cells.
  else if(i == nrow(x) & j == ncol(x)){
    return(sum(c(x[i-1, j-1],
                 x[i-1, j],
                 x[i, j-1])))
  }
}