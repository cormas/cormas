"
I'm a model of Conway's Game of Life: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent.

At each step in time, the following transitions occur:
- Any live cell with fewer than two live neighbours dies, as if caused by under-population.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by over-population.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

How to run it

1. In the Model zone, double-click on the Cell entity that appears in the spatial entities list, you then access the definition window. 
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

6. To launch the simulation from a particular initial situation ("" glider gun "" structure), load the gliderGun.ext file from the spatial grid menu: 
Initial state -> Attributes -> state -> Load map
Then repeat steps 4 and 5.
"
Class {
	#name : #CMConwayModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'theCells'
	],
	#category : #'Cormas-Model-Conway'
}

{ #category : #description }
CMConwayModel class >> aboutThisModel [
	" Answer a <String> which is the main description of the receiver's purpose "

	^ 'ToDo'

]

{ #category : #default }
CMConwayModel class >> defaultControl [

	^ #stepSynchronously:
]

{ #category : #default }
CMConwayModel class >> defaultInit [

	^ #initRandomly
]

{ #category : #examples }
CMConwayModel class >> example1 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	self initialize.
	tmp1 := self new.
	tmp1 initializeSpaceModel.
	tmp2 := RTView new.
	tmp1
		initSimulation;
		runStep.
	tmp2 clean.
	tmp5 := RTBox new.
	tmp5 color: [ :arg1 | 
		arg1 state == #dead
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ].
	tmp3 := (tmp5 size: 25) elementsOn: tmp1 theCells.
	tmp2 addAll: tmp3.
	tmp6 := RTGridLayout new.
	tmp6
		gapSize: 0;
		lineItemsCount: tmp1 spaceModel column;
		on: tmp2 elements.
	tmp2 canvas camera focusOnCenterScaled.
	tmp4 := RTActiveAnimation new.
	tmp4
		intervalInMilliseconds: 0;
		blockToExecute: [ 
			tmp1 runStep.
			tmp2 elements do: #updateShape ];
		inView: tmp2.
	tmp2 openWithToolbar
]

{ #category : #examples }
CMConwayModel class >> example2 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 tmp10 tmp11 |
	tmp1 := RTView new.
	tmp2 := CMConwayModel.
	tmp3 := 4.
	tmp4 := (1 to: tmp3) collect: [ :arg1 | 
		        tmp2 initialize.
		        tmp10 := tmp2 new.
		        tmp10
			        initializeSpaceModel;
			        activeInit: #initSmallGrid;
			        initSimulation;
			        runStep.
		        tmp10 ].
	tmp5 := RTMultiLinearColor new colors: RTPalette c4.
	tmp6 := (1 to: tmp3) collect: [ :arg2 | 
		        tmp5 level: (arg2 / tmp3) asFloat ].
	tmp7 := tmp4 with: tmp6 collect: [ :arg3 :arg4 | 
		        | tmp12 tmp13 |
		        tmp12 := RTBox new.
		        tmp12 color: [ :arg5 | 
			        arg5 state == #dead
				        ifTrue: [ Color white ]
				        ifFalse: [ arg4 ] ].
		        tmp11 := (tmp12 size: 25) elementsOn: arg3 theCells.
		        tmp1 addAll: tmp11.
		        tmp13 := RTGridLayout new.
		        tmp13
			        gapSize: 0;
			        lineItemsCount: arg3 spaceModel column;
			        on: tmp11.
		        tmp11 ].
	RTGridLayout on: tmp7.
	tmp1 canvas camera focusOnCenterScaled.
	tmp8 := RTActiveAnimation new.
	tmp8
		intervalInMilliseconds: 500;
		blockToExecute: [ 
			tmp4 do: #runStep.
			tmp1 elements do: #updateShape ];
		inView: tmp1.
	tmp1 openWithToolbar
]

{ #category : #examples }
CMConwayModel class >> example3 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 |
	self initialize.
	tmp1 := self new.
	tmp2 := 100.
	tmp1
		initializeSpaceModel;
		createGridLines: tmp2
		columns: tmp2
		neighbourhood: 4
		closed: true.
	tmp3 := RTView new.
	tmp1
		initSimulation;
		runStep.
	tmp3 clean.
	tmp6 := RTBox new.
	tmp6 color: [ :arg1 | 
		arg1 state == #dead
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ].
	tmp4 := (tmp6 size: 25) elementsOn: tmp1 theCells.
	tmp3 addAll: tmp4.
	tmp7 := RTGridLayout new.
	tmp7
		gapSize: 0;
		lineItemsCount: tmp1 spaceModel column;
		on: tmp3 elements.
	tmp3 canvas camera focusOnCenterScaled.
	tmp5 := RTActiveAnimation new.
	tmp5
		intervalInMilliseconds: 0;
		blockToExecute: [ 
			tmp1 runStep.
			tmp3 elements do: #updateShape ];
		inView: tmp3.
	tmp3 openWithToolbar
]

{ #category : #examples }
CMConwayModel class >> example4 [

	| tmp1 |
	tmp1 := self initialize new initSimulation.
	(CMSimulationGrid initialize new
		 on: tmp1
		 withCells: tmp1 theESE
		 withSituatedEntities: tmp1 allTheSituatedEntities) runAndVisualize
]

{ #category : #examples }
CMConwayModel class >> example5 [

	| tmp1 |
	tmp1 := self initialize new.
	tmp1
		activeInit: #initGlidersGun;
		initSimulation.
	(CMSimulationGrid initialize new
		 on: tmp1
		 withCells: tmp1 theESE
		 withSituatedEntities: tmp1 allTheSituatedEntities) runAndVisualize
]

{ #category : #examples }
CMConwayModel class >> exampleGlidersGun [

	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	self initialize.
	tmp1 := self new.
	tmp1
		initializeSpaceModel;
		activeInit: #initGlidersGun.
	tmp2 := RTView new.
	tmp1
		initSimulation;
		runStep.
	tmp2 clean.
	tmp5 := RTBox new.
	tmp5 color: [ :arg1 | 
		arg1 state == #dead
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ].
	tmp3 := (tmp5 size: 25) elementsOn: tmp1 theCells.
	tmp2 addAll: tmp3.
	tmp6 := RTGridLayout new.
	tmp6
		gapSize: 0;
		lineItemsCount: tmp1 spaceModel column;
		on: tmp2 elements.
	tmp2 canvas camera focusOnCenterScaled.
	tmp4 := RTActiveAnimation new.
	tmp4
		intervalInMilliseconds: 0;
		blockToExecute: [ 
			tmp1 runStep.
			tmp2 elements do: #updateShape ];
		inView: tmp2.
	tmp2 openWithToolbar
]

{ #category : #description }
CMConwayModel class >> howToRunIt [

	^ '1. In the Model zone, double-click on the Cell entity that appears in the spatial entities list, you then access the definition window. 
	
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

]

{ #category : #probes }
CMConwayModel >> alive [

	<probe>
	^ (self theCells count: [ :arg1 | arg1 state = #alive ])
	  / self theCells size
]

{ #category : #probes }
CMConwayModel >> dead [

	<probe>
	^ (self theCells count: [ :arg1 | arg1 state = #dead ])
	  / self theCells size
]

{ #category : #init }
CMConwayModel >> initCustomMap [

	self loadEnvironmentFromDirectory: 'cormas.cells'
]

{ #category : #init }
CMConwayModel >> initGliders [

	self loadEnvironmentFromDirectory: 'gliders.cells'
]

{ #category : #init }
CMConwayModel >> initGlidersGun [

	self spaceModel loadEnvironmentFromDirectory: 'glidersGun.cells'
]

{ #category : #init }
CMConwayModel >> initRandomly [

	self
		createGridLines: 100
		columns: 100
		neighbourhood: 8
		closed: true.
	self theCells do: #initRandomly
]

{ #category : #init }
CMConwayModel >> initSmallGrid [

	self
		createGridLines: 10
		columns: 10
		neighbourhood: 4
		closed: false.
	self theCells do: #initRandomly
]

{ #category : #control }
CMConwayModel >> stepSynchronously: arg1 [

	super stepSynchronously: arg1
]

{ #category : #accessing }
CMConwayModel >> theCells [

	| tmp1 |
	tmp1 := theCells.
	^ tmp1
		  ifNil: [ theCells := OrderedCollection new ]
		  ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
CMConwayModel >> theCells: arg1 [

	theCells := arg1
]
