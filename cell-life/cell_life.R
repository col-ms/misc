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

# Initialize empty matrix of cells.
cells <- matrix(0, nrow = 101, ncol = 101)
  
# Set starting locations for active cells.
# Initial pattern is as follows:
  
# . . . . .
# . 1 1 1 .   '1' = active cell
# . 1 . 1 .   '.' = inactive cell
# . 1 1 1 .
# . . . . .

# Note, this pattern is centered in the matrix.
cells[50, 50:52] = cells[51, c(50, 52)] = cells[52, 50:52] = 1

# Display initial matrix state.
# Active cells are colored oragnge,
# inactive cells are colored dark blue.
image(cells, col = c("darkblue", "orange"), 
      asp = 1, bty = "n", xaxt = "n", yaxt = "n", main = "1")

# Initialize step counter.
step = 1

# Begin repeat loop. 
# Note: loop continues until manual termination from user.
repeat{
  
  # Create a copy of the original matrix state.
  copymat = cells
  
  # Iterate over every row in matrix.
  for(i in 1:nrow(cells)){
    
    # Iterate over every column in matrix.
    for(j in 1:ncol(cells)){
      
      # If current cell has an odd number of active 
      # neighbours, set current cell to active.
      # Otherwise, set current cell to inactive.
      cells[i, j] = ifelse(
        (cnt.nbrs(copymat, i, j) %% 2 != 0),
        1, 0)
    }
  }
  
  # Increment step counter by 1.
  step = step + 1
  
  # Display updated matrix state, using same colors as before.
  image(cells, col = c("darkblue", "orange"), 
        asp = 1, bty = "n", xaxt = "n", yaxt = "n", main = step)
  
  # Short wait time before next cycle.
  Sys.sleep(0.75)
}
