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

{ #category : #examples }
CMFireAutomataModel class >> createInJSONFile [
	"Create a JSON file for example 8"

	| stream |
	stream := FileStream newFileNamed: 'input.json'.
	stream nextPutAll: self inJSON.
	stream close
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

{ #category : #examples }
CMFireAutomataModel class >> example1 [
	| aModel nbLines v es anim |
	aModel := self
		initialize;
		new.
	nbLines := 100.
	aModel initializeSpaceModel.
	aModel
		createGridLines: nbLines
		columns: nbLines
		neighbourhood: 4
		closed: true.
	v := RTView new.
	aModel activeInit: #init58WithFire.
	aModel initSimulation.
	aModel runStep.
	es := (RTBox new
		color: [ :e | 
			e state == #tree
				ifTrue: [ Color green ]
				ifFalse: [ e state == #fire
						ifTrue: [ Color red ]
						ifFalse: [ e state == #ash
								ifTrue: [ Color gray ]
								ifFalse: [ Color black ] ] ] ];
		size: 25) elementsOn: aModel theCells.
	v addAll: es.
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: aModel spaceModel column;
		on: v elements.
	v canvas camera focusOnCenterScaled.
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: 0.
	anim
		blockToExecute: [ aModel runStep.
			v elements do: #updateShape ].
	anim inView: v.
	v openWithToolbar
]

{ #category : #examples }
CMFireAutomataModel class >> example10 [
	| aModel |
	"With growing Firemen"
	self setActiveProbes: OrderedCollection new.
	"Parameterize model"
	aModel := self newWithProgrammableScenario
		numberOfFires: 3;
		numberOfFiremen: 10;
		percentageOfTrees: 0.60;
		dimensions: 30 -> 30;
		activeControl: #stepGrowingFiremen:;
		initSimulation.
	"open interface"
	((CMSimulationGrid initialize new)
		on: aModel
		withCells: aModel theCells
		withSituatedEntities: aModel theFiremen) runAndVisualizeWithMenus goSlow
]

{ #category : #examples }
CMFireAutomataModel class >> example2 [
	| aModel |
	aModel := self newWithProgrammableScenario
		numberOfFires: 3;
		numberOfFiremen: 2;
		percentageOfTrees: 0.58;
		dimensions: 80 -> 200;
		activeControl: #step:;
		initSimulation.
	((CMSimulationGrid initialize new) on: aModel with: aModel theCells) runAndVisualize
]

{ #category : #examples }
CMFireAutomataModel class >> example3 [
	| aModel |
	aModel := self newWithProgrammableScenario
		numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60 -> 80;
		activeControl: #step:;
		initSimulation.
	((CMSimulationGrid initialize new)
		on: aModel
		withCells: aModel theCells
		withSituatedEntities: aModel theFiremen) runAndVisualize
]

{ #category : #examples }
CMFireAutomataModel class >> example4 [
	| aModel |
	"reset probes saving specification"
	self setActiveProbes: OrderedCollection new.
	"Parameterize model"
	aModel := self newWithProgrammableScenario
		numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60 -> 80;
		activeControl: #step:;
		initSimulation.
	"open interface"
	((CMSimulationGrid initialize new)
		on: aModel
		withCells: aModel theCells
		withSituatedEntities: aModel theFiremen) runAndVisualizeWithMenus
]

{ #category : #examples }
CMFireAutomataModel class >> example5 [
	| aModel probes |
	"reset probes saving specification"
	self setActiveProbes: OrderedCollection new.
	"set model configuration"
	aModel := self newWithProgrammableScenario
		numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60 -> 80;
		activeControl: #step:.
	"set probes configuration (probes to save)"
	probes := OrderedCollection new.
	probes add: 'CMFireAutomataModel>>nbFires'.
	probes add: 'CMFireAutomataModel>>nbAshes'.
	aModel class setActiveProbes: probes.
	"Init simulation"
	aModel initSimulation.
	"create view that control the model and enables visualisation of non dynamic charts"
	(CMSimulationGrid new
		on: aModel
		withCells: aModel theCells
		withSituatedEntities: aModel theFiremen) runAndVisualizeWithMenus
]

{ #category : #examples }
CMFireAutomataModel class >> example6 [
	| aModel |
	"set model configuration"
	aModel := self initialize new.
	aModel
		activeInit: #init58WithFireWithFiremen;
		" #initWithProgrammableScenario;"
			numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60 -> 80;
		activeControl: #step:.
	aModel simManager
		initializeSimulation;
		finalTime: 100;
		runSimulation.
	Transcript
		cr;
		show: 'Number of steps: ' , aModel simManager currentTime asString;
		cr;
		show: 'Number of fires: ' , aModel nbFires asString;
		cr;
		show: 'Number of ashes: ' , aModel nbAshes asString;
		open.
	"aModel inspect"
]

{ #category : #examples }
CMFireAutomataModel class >> example7 [
	| aModel probes |
	"set model configuration"
	aModel := self initialize new.
	aModel
		activeInit: #init58WithFireWithFiremen;
		" #initWithProgrammableScenario;"
			numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60 -> 80;
		activeControl: #step:.
	"set probes configuration (probes to save)"
	probes := OrderedCollection new.
	probes add: 'CMFireAutomataModel>>nbFires'.
	probes add: 'CMFireAutomataModel>>nbAshes'.
	aModel class setActiveProbes: probes.
	aModel simManager
		initializeSimulation;
		finalTime: 100;
		runSimulation.
	(CMSimpleChart newOn: aModel)  refresh openWithToolbar 
]

{ #category : #examples }
CMFireAutomataModel class >> example8 [
	| aModel probes |
	"set model configuration"
	aModel := self initialize new.
	aModel
		activeInit: #init58WithFireWithFiremen;
		" #initWithProgrammableScenario;"
			numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60 -> 80;
		activeControl: #step:.
	"set probes configuration (probes to save)"
	probes := OrderedCollection new.
	probes add: 'CMFireAutomataModel>>nbFires'.
	probes add: 'CMFireAutomataModel>>nbAshes'.
	aModel class setActiveProbes: probes.
	aModel simManager
		initializeSimulation;
		finalTime: 100.
	CMSimpleChart openOn: aModel.
	aModel simManager loopRunStep_untilFinalTime
]

{ #category : #examples }
CMFireAutomataModel class >> example9 [
	| aModel |
	"reset probes saving specification"
	self setActiveProbes: OrderedCollection new.
	"Parameterize model"
	aModel := self newWithProgrammableScenario
		numberOfFires: 3;
		numberOfFiremen: 10;
		percentageOfTrees: 0.60;
		dimensions: 30 -> 30;
		activeControl: #step:;
		initSimulation.
	"open interface"
	((CMSimulationGrid initialize new) on: aModel
		withCells: aModel theCells
		withSituatedEntities: aModel theFiremen) runAndVisualizeWithMenus goSlow
]

{ #category : #description }
CMFireAutomataModel class >> howToRunIt [
<script>
| txt |
txt := '1. Prepare the visualisation of the spatial grid\' withCRs asText allBold.

txt := txt, '1.1 Click on the first icon of the ' asText, ('Visualisation ' asText makeAllColor: Color red), 'area to open the standard spatial grid.\' withCRs asText.

txt := txt, '1.2 In the ' asText, ('Topology ' asText allItalic), 'menu, clicking on the ' asText, ('Grid size ' asText allItalic), 'item opens a window allowing you to choose the number of lines and columns. For example, choose 30 * 30.\' withCRs asText.

txt := txt, '1.3 Check the border condition: ' asText, ('Topology -> Grid boundaries -> closed' asText allItalic), '.\' withCRs asText.

txt := txt, '1.4 Right-click within the spatial grid window to select the ' asText, ('pov ' asText allItalic), 'view for ' asText, ('FireAutomata_Cell ' asText allItalic), '.\' withCRs asText.

txt := txt, '1.5 To display the legend of this viewpoint: ' asText, ('Tools -> Display legends.\\' withCRs asText allItalic).



txt := txt, ('2. Prepare the initial spatial grid\' withCRs asText allBold).

txt := txt, '2.1 Click on the ' asText, ('Initialize ' asText allItalic), 'button of the ' asText, ('Simulation ' asText makeAllColor: Color red),  'area.\' withCRs asText.

txt := txt, '2.2 Select the ' asText, ('init53 ' asText allItalic), 'and ' asText, ('stepSynchronously: ' asText allItalic), 'methods, then validate by clicking on ' asText, ('Apply and close.\' withCRs asText allItalic).

txt := txt, '2.3 From the spatial grid menu, use ' asText, ('Tools -> Click to... -> Change attribute... -> state' asText allItalic), ', enter ' asText, ('fire ' asText allItalic), 'and validate. The cursor takes a new shape. Click on a cell to change manually its state to fire, then switch back to the mouse select mode with ' asText, ('Tools -> Click to... -> Select ' asText allItalic), '.\\' withCRs asText. 


txt := txt, ('3. Run the model\' withCRs asText allBold).

txt := txt, '3.1 Enter 50 in the ' asText, ('Final time ' asText allItalic), 'input field of the ' asText,  ('Simulation ' asText makeAllColor: Color red),  'area.\' withCRs asText.

txt := txt, '3.2 Click on the ' asText, ('Run ' asText allItalic), 'button of the ' asText,  ('Simulation ' asText makeAllColor:Color red),  'area.\\' withCRs asText.



txt := txt, ('4. Have a look at the charts\' withCRs asText allBold).

txt := txt, '4.1 Click on the third icon of the ' asText, ('Visualisation ' asText makeAllColor: Color red), 'area to open the charts window.\\' withCRs asText.



txt := txt, ('5. Run alternative versions of the model\' withCRs asText allBold).

txt := txt, '5.1 Select the ' asText, ('init58 ' asText allItalic), 'and ' asText, ('stepSynchronously: ' asText allItalic), 'methods, then run the model again.\' withCRs asText.

txt := txt, '5.2 Select the ' asText, ('init53 ' asText allItalic), 'and ' asText, ('stepAsynchronously: ' asText allItalic), 'methods, then run the model again.\' withCRs asText.

txt inspect
"ComposedTextView open: txt asValue label: ('How to run ', self name, '     step-by-step instructions') icon: (Icon constantNamed: #workspace) extent: 620@550" 
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
        numberOfFiremen: (conf at: #numberOfFiremen);
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
        numberOfFiremen: (conf at: #numberOfFiremen);
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

{ #category : #description }
CMFireAutomataModel >> howToRunIt [

^self class howToRunIt 
]

{ #category : #init }
CMFireAutomataModel >> init53 [
self theCells do:#init53 

]

{ #category : #init }
CMFireAutomataModel >> init53WithFire [
	self
		createGridLines: 80
		columns: 80
		neighbourhood: 4
		closed: false.
		self theCells do: #init53.
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
	self theCells do: #init58.
	self pickCell ifNotNil: [ :c | c state: #fire ]
]

{ #category : #init }
CMFireAutomataModel >> init58WithFireWithFiremen [
	| aCell |
	self
		createGridLines: 80
		columns: 80
		neighbourhood: 4
		closed: false.
	self theCells do: #init58FireWithFiremen.
	1 to: self numberOfFires do: [ :i | 
		aCell := self pickCell.
		aCell = nil
			ifTrue: [ self halt ].
		aCell state: #fire ].
	self initAgents
]

{ #category : #init }
CMFireAutomataModel >> init58WithMultipleFires [
	self theCells do: #init58WithMultipleFires.
	1 to: self numberOfFires do: [ :i | self pickCell state: #fire ]
]

{ #category : #'instance-creation' }
CMFireAutomataModel >> initAgents [
	"To be completed"

self createN: self numberOfFiremen
randomlyLocatedEntities: CMFireAutomataFireman.
	self
		generateSymetricNetworkDensity: 1
		forAgents: CMFireAutomataFireman
]

{ #category : #init }
CMFireAutomataModel >> initSmallWithFireWithFiremen [
	| aCell |
	self
		createGridLines: 40
		columns: 40
		neighbourhood: 4
		closed: false.
	self theCells do: ##init58.
	1 to: self numberOfFires do: [ :i | 
		aCell := self pickCell.
		aCell = nil
			ifTrue: [ self halt ].
		aCell state: #fire ].
	self initAgents
]

{ #category : #init }
CMFireAutomataModel >> initWithFiremen [
	| aCell |
	self
		createGridLines: 80
		columns: 80
		neighbourhood: 4
		closed: false.
	self theCells do: [ :each | each initWith: 60 ].
	1 to: self numberOfFires do: [ :i | 
		aCell := self pickCell.
		aCell state: #fire ].
	self initAgents
]

{ #category : #'programmable scenario' }
CMFireAutomataModel >> initWithProgrammableScenario [
self theCells do: [:each | each initWith: percentageOfTrees ].
	1 to: self numberOfFires do: [ :i | self pickCell state: #fire ].
	self initAgents
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
CMFireAutomataModel >> numberOfFiremen [

	^numberOfFiremen ifNil:[numberOfFiremen := 20]
]

{ #category : #accessing }
CMFireAutomataModel >> numberOfFiremen: aNumber [

	numberOfFiremen := aNumber
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
	self theFiremen do: [:fm | fm step].
]

{ #category : #control }
CMFireAutomataModel >> stepGrowingFiremen: t [
"To be completed"

	self stepSynchronously: t.
	self theFiremen do: [:fm | fm step. fm agsize: fm agsize + 1].
]

{ #category : #control }
CMFireAutomataModel >> stepSynchronously: t [
	super stepSynchronously: t.
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

{ #category : #accessing }
CMFireAutomataModel >> theFiremen [
	"Returns a collection of all the instances of the sub classes collected by cormasModel.
	!! This method was automatically generated by Cormas !!"

	^ theFiremen ifNil: [ theFiremen := OrderedCollection new ]
]

{ #category : #accessing }
CMFireAutomataModel >> theFiremen: aNewCollection [
	"Set a new collection for theXXXs attribute.
	!! This method was automatically generated by Cormas !!"

	theFiremen := aNewCollection
]

{ #category : #deprecated }
CMFireAutomataModel >> trees [
	trees isNil
		ifTrue: [ trees := OrderedCollection new ].
	^ trees
]

{ #category : #deprecated }
CMFireAutomataModel >> trees: aCollection [
	trees := aCollection
]

{ #category : #deprecated }
CMFireAutomataModel >> treesData [
	"return the data to be plotted with the trees chart"

	^ (self theCells count: [ :c | c state = #tree ]) / self theCells size
]
