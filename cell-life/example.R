source("cell_life.R")


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


cycle(cells = cells, steps = 50, sleep.time = 0.1, save.plots = T)
