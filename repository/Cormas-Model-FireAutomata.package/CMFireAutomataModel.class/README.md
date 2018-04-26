This model illustrates how the principles of cellular automata are implemented in Cormas. 

The spatial entity of the model (the cell), named FireAutomataCell, can take four states: #fire (red), #tree (green), #ash (grey), #empty (white). 

The initial state of each cell of the spatial grid is either set to #tree with a probability p or to #empty with a probability 1-p. 

One cell is set on fire, and then the spreading of the fire, defined in the cell transition function, occurs. The transition function is the following: a cell being a tree at time t-1 will become on fire at time t if at least one of its 4 neighbours (North, East, South, West) is on fire at time t-1. 

The cells being on fire will become ash at the next timestep, the cells being ash will become empty at the next timestep. 

The probability to observe a resteint fire is high if p is lower than 0.55, whereas when p is greater than 0.55, a global fire is likely to occur. 

This percolation threshold characterizes cellular automata which are representing diffusion processes.