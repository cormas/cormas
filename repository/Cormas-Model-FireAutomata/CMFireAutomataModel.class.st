"
This model illustrates how the principles of cellular automata are implemented in Cormas. 

The spatial entity of the model (the cell), named FireAutomataCell, can take four states: #fire (red), #tree (green), #ash (grey), #empty (white). 

The initial state of each cell of the spatial grid is either set to #tree with a probability p or to #empty with a probability 1-p. 

One cell is set on fire, and then the spreading of the fire, defined in the cell transition function, occurs. The transition function is the following: a cell being a tree at time t-1 will become on fire at time t if at least one of its 4 neighbours (North, East, South, West) is on fire at time t-1. 

The cells being on fire will become ash at the next timestep, the cells being ash will become empty at the next timestep. 

The probability to observe a resteint fire is high if p is lower than 0.55, whereas when p is greater than 0.55, a global fire is likely to occur. 

This percolation threshold characterizes cellular automata which are representing diffusion processes.
"
Class {
	#name : #CMFireAutomataModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'trees',
		'numberOfFires',
		'percentageOfTrees',
		'numberOfFiremen',
		'theFiremen',
		'theCells'
	],
	#classInstVars : [
		'defaultInit'
	],
	#category : #'Cormas-Model-FireAutomata'
}

{ #category : #accessing }
CMFireAutomataModel class >> aboutThisModel [
	" Answer a <String> which is the main description of the receiver's purpose "
	
	^ 'This is a simple cellular automata (CA) that simulate the diffusion of fire in a forest.
A cell can take one of the 3 following states: forest, fire or empty.
In one step, the CA uses 2 loops in order to 

1) calculate the next state of each cell (stored in the bufferState attribute), 

then 2) to update the state of all the cells.

For more information, see: http://cormas.cirad.fr/fr/applica/fireautomata.htm 
'
	

]

{ #category : #examples }
CMFireAutomataModel class >> createInJSONFile [
	" Create a JSON file for example 8 "

	'input.json' asFileReference ensureCreateFile writeStreamDo: [ : stream | stream nextPutAll: self inJSON ]

]

{ #category : #'default settings' }
CMFireAutomataModel class >> defaultControl [
	^ #step:
]

{ #category : #'default settings' }
CMFireAutomataModel class >> defaultInit [

	^ defaultInit ifNil: [ defaultInit := #init58WithFireWithFiremen ]
]

{ #category : #'default settings' }
CMFireAutomataModel class >> defaultInit: aSelector [

	defaultInit := aSelector
]

{ #category : #'default settings' }
CMFireAutomataModel class >> defaultProbes [
	^ #(#nbTrees)
]

{ #category : #description }
CMFireAutomataModel class >> howToRunIt [

	^ '1. Prepare the visualisation of the spatial grid. 

1.1 Click on the first icon of the Visualisation area to open the standard spatial grid.

1.2 In the Topology menu, clicking on the Grid size item opens a window allowing you to choose the number of lines and columns. For example, choose 30 * 30.

1.3 Check the border condition: Topology -> Grid boundaries -> closed.

1.4 Right-click within the spatial grid window to select the pov view for FireAutomata_Cell .

1.5 To display the legend of this viewpoint: Tools -> Display legends.


2. Prepare the initial spatial grid

2.1 Click on the Initialize button of the Simulation area.

2.2 Select the init53 and stepSynchronously: methods, then validate by clicking on Apply and close.

2.3 From the spatial grid menu, use Tools -> Click to... -> Change attribute... -> state, enter fire and validate. The cursor takes a new shape. Click on a cell to change manually its state to fire, then switch back to the mouse select mode with Tools -> Click to... -> Select 


3. Run the model

3.1 Enter 50 in the Final time input field of the Simulation area.

3.2 Click on the Run button of the Simulation area.


4. Have a look at the charts

4.1 Click on the third icon of the Visualisation area to open the charts window.



5. Run alternative versions of the model

5.1 Select the init58 and stepSynchronously: methods, then run the model again.

5.2 Select the init53 and stepAsynchronously: methods, then run the model again.'

]

{ #category : #examples }
CMFireAutomataModel class >> inJSON [
	"Use in example8"

	^ '{
    "numberOfFires": 3,
	"numberOfFiremen": 20,
	"percentageOfTrees": 0.65,
	"dimensionMin": 60, 
	"dimensionMax": 80
}
'
]

{ #category : #examples }
CMFireAutomataModel class >> lastValuesOfVariables: aDictionnary [
	"a Dictionnary is a dictionnary formatted by CORMAS with name of the class containing a dictionnary of keys"

	"representing values, containing collection"
	"This is a really bad conception and we need to replace all of this by DataFrame later :-)"
	| d r |

	d := Dictionary new.
	(aDictionnary at: self name) keysAndValuesDo: [ :k :v | d at: k put: v last ].
	r := Dictionary new.
	r at: self name asSymbol put: d.
	r := r values first.
	^ r 
]

{ #category : #examples }
CMFireAutomataModel class >> newWithProgrammableScenario [

	^ self 
		defaultInit: #initWithProgrammableScenario;
		initialize;
		new.
]

{ #category : #examples }
CMFireAutomataModel class >> simuOpenMole [
	"Example used in OpenMole (https://openmole.org/)"
    | conf aModel |
	 "self createInJSONFile." "OpenMole usually generate this file"
    conf := CMOpenMoleExchange loadJSONFile: 'input.json'.
    aModel := self newWithProgrammableScenario
        numberOfFires: (conf at: #numberOfFires) ;
        percentageOfTrees: (conf at: #percentageOfTrees);
        dimensions: (conf at: #dimensionMin) -> (conf at: #dimensionMax);
        activeControl: #step:;
        initSimulation.
    aModel simManager
        initializeSimulation;
        finalTime: 100;
        runSimulation.
    CMOpenMoleExchange saveJSONFile: (self lastValuesOfVariables: (aModel data)) 
]

{ #category : #examples }
CMFireAutomataModel class >> simuOpenMole2 [
	"Example used in OpenMole (https://openmole.org/)"
    | conf aModel |
	 "self createInJSONFile." "OpenMole usually generate this file"
    conf := CMOpenMoleExchange loadJSONFile: 'input.json'.
    aModel := self newWithProgrammableScenario
        numberOfFires: (conf at: #numberOfFires) ;"we use values from input.json you need to "
        percentageOfTrees: (conf at: #percentageOfTrees);
        dimensions: (conf at: #dimensionMin) -> (conf at: #dimensionMax);
        activeControl: #step:;
        initSimulation.
    aModel simManager
        initializeSimulation;
        finalTime: 100;
        runSimulation.
    CMOpenMoleExchange saveJSONFile: (CMOpenMoleExchange lastDataOfModel: aModel). 
]

{ #category : #'programmable scenario' }
CMFireAutomataModel >> dimensions: aPair [
	self initializeSpaceModel.
	self
		createGridLines: aPair value
		columns: aPair key
		neighbourhood: 4
		closed: true
]

{ #category : #init }
CMFireAutomataModel >> init53 [
	self
		createGridLines: 80
		columns: 80
		neighbourhood: 4
		closed: false.
		self theCells do: #init53.
]

{ #category : #init }
CMFireAutomataModel >> init53WithFire [
	self init53.
	self pickCell state: #fire
]

{ #category : #init }
CMFireAutomataModel >> init58 [
	self
		createGridLines: 80
		columns: 80
		neighbourhood: 4
		closed: false.
		self theCells do: #init58
]

{ #category : #init }
CMFireAutomataModel >> init58WithFire [
	self init58.
	self pickCell ifNotNil: [ :c | c state: #fire ]
]

{ #category : #init }
CMFireAutomataModel >> init58WithMultipleFires [
	self init58.
	self theCells do: #init58WithMultipleFires.
	1 to: self numberOfFires do: [ :i | self pickCell state: #fire ]
]

{ #category : #probes }
CMFireAutomataModel >> nbAshes [
	"Return number of cells in ash state"
	<probe>
	^ self theCells count: [ :c | c state = #ash ]
]

{ #category : #probes }
CMFireAutomataModel >> nbFires [
<probe>
	^ self theCells count: [ :c | c state = #fire ]
]

{ #category : #probes }
CMFireAutomataModel >> nbTrees [
<probe>
	^ self theCells count: [ :c | c state = #tree ]
]

{ #category : #accessing }
CMFireAutomataModel >> numberOfFires [

	^ numberOfFires ifNil:[numberOfFires := 3]
]

{ #category : #accessing }
CMFireAutomataModel >> numberOfFires: aNumber [

	numberOfFires := aNumber
]

{ #category : #accessing }
CMFireAutomataModel >> percentageOfTrees [

	^ percentageOfTrees 
]

{ #category : #accessing }
CMFireAutomataModel >> percentageOfTrees: aNumber [

	percentageOfTrees := aNumber
]

{ #category : #control }
CMFireAutomataModel >> step: t [
"To be completed"

	self stepSynchronously: t.

]

{ #category : #accessing }
CMFireAutomataModel >> theCells [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	!! This method was automatically generated by Cormas !!"

	^ theCells ifNil: [ theCells := OrderedCollection new ]
]

{ #category : #accessing }
CMFireAutomataModel >> theCells: aNewCollection [
	"Set a new collection for theXXXs attribute.
	!! This method was automatically generated by Cormas !!"

	theCells := aNewCollection
]
