description
howToRunIt
	
	^'1. In the Model zone, double-click on the Cell entity that appears in the spatial entities list, you then access the definition window. 
1.1. Double-click on the initialize method. A text editor appears with the corresponding code (the state attribute of a Cell can take either the #dead or the #alive value). Close the text editor window.
1.2. Double-click on the newState method. A text editor appears with the code corresponding to the transition function of the game of life. Close both windows.

2. In the Model zone, at the bottom-right, in the Define the observation scrolling menu, choose the Space item. A window appears for the definition of viewpoints.
2.1. In the situated entities list, at the top-left, select Cell
2.2. In the observation methods list, below, select the pdv method.
2.3. If you click on the associated symbols in the list (at the top-right), you can visualize the colors corresponding to the different states of the Cell: #alive (white) #dead (black).
2.4. Close this window.

3. In the Visualization zone, open a spatial grid (1st icon). A new window opens. By default, it is a 10 * 10 spatial grid composed of 4-connexe squares with toroidal boundaries. 
3.1. Choose an 8-connexity: Topology -> Cell shape -> Square -> 8-connexe.
3.2. The Grid size item from the Topology menu perm opens a window allowing you to choose the number of lines and columns. For example, choose 50 * 50.
3.3. Initial state -> Execute method... -> initialize launches the execution of the initialization method (see step 1) for each cell of the grid.
3.4. If you right-click on the grid, you can choose for each entity of the model the observation method or viewpoint (cf. step 2). For the Cell choose the pdv viewpoint.

4. In the Simulation zone, click on the Initialize... button.
4.1. Select the init and evoluerSynchrone: methods.
4.2. Validate and close the window (Apply and close button).

5. In the Simulation zone, click on the Step button or enter the number of time steps in the Final time field and click Run. 

6. To launch the simulation from a particular initial situation (" glider gun " structure), load the gliderGun.ext file from the spatial grid menu: 
Initial state -> Attributes -> state -> Load map
Then repeat steps 4 and 5.'