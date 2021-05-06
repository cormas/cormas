"
The model is available online here: http://cormas.cirad.fr/en/applica/diffuse.htm

This model illustrates how the principles of cellular automata are 
implemented in Cormas. 

The spatial entity of the model (the cell), named Cell, 
can take four states: #fire (red); #tree (green); #ash (grey); #empty (white). 
The initial state of each cell of the spatial grid is either set to #tree with a 
probability p or to #empty with a probability 1-p. 

One cell is set on fire, and then the spreading of the fire, defined in the 
cell transition function, occurs. The transition function is the following: 
a cell being a tree at time t-1 will become on fire at time t if at least 
one of its 4 neighbours (North, East, South, West) is on fire at time t-1. 
The cells being on fire will become ash at the next timestep, the cells 
being ash will become empty at the next timestep. 

The probability to observe a resteint fire is high if p is lower than 0.55, 
whereas when p is greater than 0.55, a global fire is likely to occur. 
This percolation threshold characterizes cellular automata which are 
representing diffusion processes.
"
Class {
	#name : #CMDiffuseModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'activeCells',
		'newActiveCells',
		'noMoreActiveCells',
		'antNumber',
		'theAnts',
		'theCells'
	],
	#category : #'Cormas-Model-Diffuse'
}

{ #category : #'default value' }
CMDiffuseModel class >> activeCells_default [
	^ nil
]

{ #category : #'default value' }
CMDiffuseModel class >> antNumber_default [
	^ 1
]

{ #category : #examples }
CMDiffuseModel class >> example1 [
	| aModel |
	aModel := self initialize new initSimulation.
	(CMSimulationGrid new
		on: aModel
		withCells: aModel theESE
		withSituatedEntities: aModel allTheSituatedEntities) runAndVisualize
]

{ #category : #description }
CMDiffuseModel class >> howToInstructions [
	^ String
		streamContents: [ :arg1 | 
			| tmp2 |
			tmp2 := arg1.
			tmp2
				nextPutAll: '1. Prepare the visualisation of the spatial grid\' withCRs asText;
				nextPutAll: '1.1 Click on the first icon of the ' asText;
				nextPutAll: ('Visualisation ' asText emphasized: TextEmphasis bold emphasisCode);
				nextPutAll: 'area to open the standard spatial grid.\' withCRs asText;
				nextPutAll: '1.2 In the ' asText;
				nextPutAll: ('Topology ' asText emphasizeAllWith: #italic);
				nextPutAll: 'menu, clicking on the ' asText;
				nextPutAll: ('Grid size ' asText emphasizeAllWith: #italic);
				nextPutAll:
					'item opens a window allowing you to choose the number of lines and columns. For example, choose 30 * 30.\'
						withCRs asText;
				nextPutAll: '1.3 Check the border condition: ' asText;
				nextPutAll:
					('Topology -> Grid boundaries -> closed' asText
						emphasizeAllWith: #italic);
				nextPutAll: '.\' withCRs asText;
				nextPutAll: '1.4 Right-click within the spatial grid window to select the ' asText;
				nextPutAll: ('pov ' asText emphasizeAllWith: #italic);
				nextPutAll: 'view for ' asText;
				nextPutAll: ('Cell ' asText emphasizeAllWith: #italic);
				nextPutAll: '.\' withCRs asText;
				nextPutAll: '1.5 To display the legend of this viewpoint: ' asText;
				nextPutAll:
					('Tools -> Display legends.\\' withCRs asText
						emphasizeAllWith: #italic);
				nextPutAll:
					('2. Prepare the initial spatial grid\' withCRs asText
						emphasizeAllWith: #(#bold #large));
				nextPutAll:
					'2.1 Click on the ' asText
						, ('Initialize ' asText emphasizeAllWith: #italic);
				nextPutAll: 'button of the ' asText;
				nextPutAll: ('Simulation ' asText emphasizeAllWith: #color -> Color red);
				nextPutAll: 'area.\' withCRs asText;
				nextPutAll: '2.2 Select the ' asText;
				nextPutAll: ('init53 ' asText emphasizeAllWith: #italic);
				nextPutAll: 'and ' asText;
				nextPutAll: ('stepSynchronously: ' asText emphasizeAllWith: #italic);
				nextPutAll: 'methods, then validate by clicking on ' asText;
				nextPutAll: ('Apply and close.\' asText emphasizeAllWith: #italic) withCRs asText;
				nextPutAll: '2.3 From the spatial grid menu, use ' asText;
				nextPutAll:
					('Tools -> Click to... -> Change attribute... -> state' asText
						emphasizeAllWith: #italic);
				nextPutAll: ', enter ' asText;
				nextPutAll: ('fire ' asText emphasizeAllWith: #italic);
				nextPutAll:
					'and validate. The cursor takes a new shape. Click on a cell to change manually its state to fire, then switch back to the mouse select mode with '
						asText;
				nextPutAll: ('Tools -> Click to... -> Select ' asText emphasizeAllWith: #italic);
				nextPutAll: '.\\' withCRs asText;
				nextPutAll: ('3. Run the model\' withCRs asText emphasizeAllWith: #(#bold #large));
				nextPutAll: '3.1 Enter 50 in the ' asText;
				nextPutAll: ('Final time ' asText emphasizeAllWith: #italic);
				nextPutAll: 'input field of the ' asText;
				nextPutAll: ('Simulation ' asText emphasizeAllWith: #color -> Color red);
				nextPutAll: 'area.\' withCRs asText;
				nextPutAll: '3.2 Click on the ' asText;
				nextPutAll: ('Run ' asText emphasizeAllWith: #italic);
				nextPutAll: 'button of the ' asText;
				nextPutAll:
					('Simulation ' asText emphasizeAllWith: #color -> Color red)
						, 'area.\\' withCRs asText;
				nextPutAll:
					('4. Have a look at the charts\' withCRs asText
						emphasizeAllWith: #(#bold #large));
				nextPutAll: '4.1 Click on the third icon of the ' asText;
				nextPutAll: ('Visualisation ' asText emphasizeAllWith: #color -> Color red);
				nextPutAll: 'area to open the charts window.\\' withCRs asText;
				nextPutAll:
					('5. Run alternative versions of the model\' withCRs asText
						emphasizeAllWith: #(#bold #large));
				nextPutAll: '5.1 Select the ' asText;
				nextPutAll: ('init58 ' asText emphasizeAllWith: #italic);
				nextPutAll: 'and ' asText;
				nextPutAll: ('stepSynchronously: ' asText emphasizeAllWith: #italic);
				nextPutAll: 'methods, then run the model again.\' withCRs asText;
				nextPutAll: '5.2 Select the ' asText;
				nextPutAll: ('init53 ' asText emphasizeAllWith: #italic);
				nextPutAll: 'and ' asText;
				nextPutAll: ('stepAsynchronously: ' asText emphasizeAllWith: #italic);
				nextPutAll: 'methods, then run the model again.\' withCRs asText ]
]

{ #category : #testing }
CMDiffuseModel class >> isAbstract [
	^ false
]

{ #category : #'default value' }
CMDiffuseModel class >> newActiveCells_default [
	^ nil
]

{ #category : #'default value' }
CMDiffuseModel class >> noMoreActiveCells_default [
	^ nil
]

{ #category : #accessing }
CMDiffuseModel >> activeCells [
	^ activeCells
]

{ #category : #accessing }
CMDiffuseModel >> activeCells: arg1 [
	activeCells := arg1
]

{ #category : #accessing }
CMDiffuseModel >> antNumber [
	^antNumber ifNil: [ antNumber := 1 ].
	
]

{ #category : #accessing }
CMDiffuseModel >> antNumber: arg1 [
	antNumber := arg1
]

{ #category : #init }
CMDiffuseModel >> init [
	self spaceModel
		loadEnvironmentFromDirectory: '40x40.cells'
		withPov: #pov.
	self initOptimize.
	self theCells do: #initEmpty.
	self createN: self antNumber randomlyLocatedEntities: CMDiffuseAnt
]

{ #category : #optimize }
CMDiffuseModel >> initOptimize [
	CMDiffuseCell scheduler: self.
	self
		activeCells: Set new;
		newActiveCells: Bag new;
		noMoreActiveCells: Bag new
]

{ #category : #accessing }
CMDiffuseModel >> newActiveCells [
	^ newActiveCells
]

{ #category : #accessing }
CMDiffuseModel >> newActiveCells: arg1 [
	newActiveCells := arg1
]

{ #category : #accessing }
CMDiffuseModel >> noMoreActiveCells [
	^ noMoreActiveCells
]

{ #category : #accessing }
CMDiffuseModel >> noMoreActiveCells: arg1 [
	noMoreActiveCells := arg1
]

{ #category : #optimize }
CMDiffuseModel >> setActiveCells [
	self activeCells
		addAll: self newActiveCells;
		removeAll: self noMoreActiveCells.
	self
		newActiveCells: Set new;
		noMoreActiveCells: Set new
]

{ #category : #control }
CMDiffuseModel >> step: arg1 [
	self activeCells
		do: [ :arg2 | 
			arg2
				evaporate;
				diffuse ].
	self updateActiveCells.
	self activeCells do: [ :arg3 | arg3 updateState ].
	self theAnts do: [ :arg4 | arg4 step ].
	self updateActiveCells
]

{ #category : #control }
CMDiffuseModel >> stepSynchronously: arg1 [
	self activeCells
		do: [ :arg2 | 
			arg2
				evaporate;
				diffuse ].
	self updateActiveCells.
	self activeCells do: [ :arg3 | arg3 updateState ].
	self theAnts do: [ :arg4 | arg4 step ].
	self updateActiveCells
]

{ #category : #accessing }
CMDiffuseModel >> theAnts [
	| tmp2 |
	tmp2 := theAnts.
	^ tmp2 ifNil: [ theAnts := OrderedCollection new ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDiffuseModel >> theAnts: arg1 [
	theAnts := arg1
]

{ #category : #accessing }
CMDiffuseModel >> theCells [
	| tmp2 |
	tmp2 := theCells.
	^ tmp2
		ifNil: [ theCells := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMDiffuseModel >> theCells: arg1 [
	theCells := arg1
]

{ #category : #optimize }
CMDiffuseModel >> updateActiveCells [
	self activeCells
		addAll: self newActiveCells;
		removeAll: self noMoreActiveCells.
	self
		newActiveCells: Set new;
		noMoreActiveCells: Set new
]
