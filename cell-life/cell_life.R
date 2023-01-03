cycle <- function(cells, steps = 10, path = NULL,
                  save.plots = FALSE, check.orig = 'f', return = FALSE,
                  colors = c("darkblue", "orange"), sleep.time = 0.75){
  
  source("cntNeighbours.R")
  #if(check.orig != 'f') orig <- cells
  if(save.plots) source("utils.R")
  
  drawPlot <- function(){
    if(!save.plots){
      image(z=cells, col = colors,
            asp = 1, main = step,
            bty = 'n', xaxt = 'n', yaxt = 'n')
    }
    else if(save.plots){
      png(fnamegen(step = step, path = path))
      image(z=cells, col = colors,
            asp = 1, main = step,
            bty = 'n', xaxt = 'n', yaxt = 'n')
      dev.off()
    }
  }
  
  step <- 1
  
  drawPlot()
  
  for(i in 1:(steps-1)){
    
    # Sleep time before next cycle (defaults to 0.75).
    Sys.sleep(sleep.time)
    
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
    
    
    # see TODO below
    # if(check.orig != 'f' && i == 1) orig <- cells
    
    # Increment step counter.
    step = step + 1
    
    # Display updated matrix state, using same colors as before.
    drawPlot()
    
    
    # TODO: get original comparison working
    # if(check.orig != 'f'){
    #   if(all(orig == cells) && check.orig == 'n'){ 
    #     cat("Matrix has returned to original state at step #", step, sep = '')
    #   }
    #   else if(all(orig == cells) && check.orig == 'r'){
    #     cat("Matrix has returned to original state at step #", step, sep = '')
    #     return(step)
    #   }
    # }
    

  }
  if(return) return(cells)
  return(-1)
}

