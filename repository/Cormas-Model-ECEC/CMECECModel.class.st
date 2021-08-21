Class {
	#name : #CMECECModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'restrainedInitialNumber',
		'unrestrainedInitialNumber',
		'theRestraineds',
		'theUnrestraineds',
		'theVegetationUnits'
	],
	#category : #'Cormas-Model-ECEC'
}

{ #category : #probes }
CMECECModel class >> colorOfProbe_restrainedSize [
	^ Color red: 0.104993 green: 0.104993 blue: 0.839458
]

{ #category : #probes }
CMECECModel class >> colorOfProbe_unrestrainedSize [
	^ Color r: 0.839458 g: 0.0 b: 0.0
]

{ #category : #probes }
CMECECModel class >> colorOfProbe_vegetationBiomass [
	^ Color red: 0.0 green: 0.839458 blue: 0.0
]

{ #category : #default }
CMECECModel class >> defaultInit [
	^ #randomEnv
]

{ #category : #default }
CMECECModel class >> defaultProbes [
	^ self probes
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> displayRunDuration: arg1 simName: arg2 [
	| tmp1 tmp2 tmp4 |
	tmp1 := 'Simulation [' , arg2 , ']was run in ' , arg1 printString
		, ' milliseconds'.
	arg1 > 1000
		ifTrue: [ tmp1 := tmp1 , ', ie. '.
			tmp2 := Time fromSeconds: arg1 / 1000.
			tmp1 := tmp1 , tmp2 hours printString , ' h: '
				, tmp2 minutes printString , ' m: '
				, tmp2 seconds asFloat printString , ' s.' ].
	tmp4 := Transcript.
	tmp4
		cr;
		show: tmp1
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM1 [
	"In this example the SimManager is not used at all"

	| aModel finalTime chrono |
	aModel := self initialize new initSimulation.
	finalTime := 200.
	chrono := Time millisecondsToRun: [ finalTime timesRepeat: [ aModel runStep ] ].
	self displayRunDuration: chrono simName: 'a exampleSM1'.
	self transcriptShow_simulationTime: aModel timeStep nbRestrainedForagers: aModel restrainedSize
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM2 [
	"In this example the run of the simulation is managed by the SimManager"

	| aModel |
	aModel := self initialize new initSimulation.
	aModel simManager
		finalTime: 200;
		runSimulation.
			self transcriptShow_simulationTime:  aModel simManager currentTime nbRestrainedForagers: aModel restrainedSize 
	
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM3 [
	"In this example the initialization and the run of the simulation is managed by the SimManager"

	| aModel |
	aModel := self initialize new.
	aModel simManager
		initializeSimulation;
		finalTime: 200;
		runSimulation.
	self
		transcriptShow_simulationTime: aModel simManager currentTime
		nbRestrainedForagers: aModel restrainedSize
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM4 [
	"This example compares the performance of using SimManager or not using it"

	| nbRepetitions chronoRecords finalTime |
	nbRepetitions := 10.
	finalTime := 20.
	"exampleSM1"
	chronoRecords := OrderedCollection new.
	1 to: nbRepetitions do: [ :idRepetition | 
		| chrono |
		chrono := Time
			millisecondsToRun: [ | aModel |
				aModel := self initialize new initSimulation.
				finalTime timesRepeat: [ aModel runStep ] ].
		chronoRecords add: chrono
		"	self displayRunDuration: chrono simName: 'exampleSM1 - repetition' , idRepetition asString " ].
	Transcript
		cr;
		show: 'exampleSM1 (no SimManager) - average time over ';
		show: nbRepetitions;
		show: ' repetitions: ';
		show: (chronoRecords sum / nbRepetitions) rounded;
		show: ' ms'.
	"exampleSM2"
	chronoRecords := OrderedCollection new.
	1 to: nbRepetitions do: [ :idRepetition | 
		| chrono |
		chrono := Time
			millisecondsToRun: [ | aModel |
				aModel := self initialize new initSimulation.
				aModel simManager
					finalTime: finalTime;
					runSimulation ].
		chronoRecords add: chrono
		"	self displayRunDuration: chrono simName: 'exampleSM2 - repetition' , idRepetition asString " ].
	Transcript
		cr;
		show: 	'exampleSM2 (SimManager used for run) - average time over ';
		show: nbRepetitions;
		show: ' repetitions: ';
		show: (chronoRecords sum / nbRepetitions) rounded;
		show: ' ms'.
	"exampleSM3"
	chronoRecords := OrderedCollection new.
	1 to: nbRepetitions do: [ :idRepetition | 
		| chrono |
		chrono := Time
			millisecondsToRun: [ | aModel |
				aModel := self initialize new.
				aModel simManager
					initializeSimulation;
					finalTime: finalTime;
					runSimulation ].
		chronoRecords add: chrono
		"	self displayRunDuration: chrono simName: 'exampleSM3 - repetition' , idRepetition asString " ].
	Transcript
		cr;
		show: 'exampleSM3 (SimManager used for init and run) - average time over ';
		show: nbRepetitions;
		show: ' repetitions: ';
		show: (chronoRecords sum / nbRepetitions) rounded;
		show: ' ms'.
	Transcript open
]

{ #category : #'default value' }
CMECECModel class >> restrainedInitialNumber_default [
	"Return the default value of restrainedInitialNumber attribute"
	
	^10
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> transcriptShow_simulationTime: nbTimeStep nbRestrainedForagers: aNbRestrainedForagers [

	Transcript
		cr;
		show: 'Number of steps : ';
		show: nbTimeStep asString;
		cr;
		show: 'Number of restrained foragers: ';
		show: aNbRestrainedForagers asString;
		open
]

{ #category : #'default value' }
CMECECModel class >> unrestrainedInitialNumber_default [
	"Return the default value of unrestrainedInitialNumber attribute"
	
	^10
]

{ #category : #init }
CMECECModel >> fragmentedEnv [
	self spaceModel loadEnvironmentFromDirectory: 'fragmented.cells'.
	self initAgents
]

{ #category : #init }
CMECECModel >> homogeneousEnv2 [
	self spaceModel
		initializeRegularLines: 27
		columns: 27
		nbType: #eight		
		closed: false.
	self theVegetationUnits do: [ :arg1 | arg1 initRandomBiomass ].
	self initAgents
]

{ #category : #'init entities' }
CMECECModel >> initAgents [
	self
		createN: self restrainedInitialNumber
			randomlyLocatedAloneEntities: CMECECRestrained;
		createN: self unrestrainedInitialNumber
			randomlyLocatedAloneEntities: CMECECUnrestrained
]

{ #category : #init }
CMECECModel >> noAgent [
	
	self spaceModel loadEnvironmentFromDirectory: 'poor.cells'
]

{ #category : #init }
CMECECModel >> randomEnv [
	self
		createGridLines: 27
		columns: 15
		neighbourhood: 8
		closed: true.
	self theVegetationUnits do: [ :arg1 | arg1 initRandomBiomass ].
	self initAgents
]

{ #category : #accessing }
CMECECModel >> restrainedInitialNumber [
	| tmp2 |
	tmp2 := restrainedInitialNumber.
	^ tmp2 ifNil: [ restrainedInitialNumber := 10 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECModel >> restrainedInitialNumber: arg1 [
	restrainedInitialNumber := arg1
]

{ #category : #probes }
CMECECModel >> restrainedSize [
	<probe>
	^ self theRestraineds size
]

{ #category : #control }
CMECECModel >> step: arg1 [
	self
		stepEntities: self theVegetationUnits;
		askRandom: CMECECForager toDo: #step
]

{ #category : #accessing }
CMECECModel >> theCMECECForagers [
	^ self allTheEntities: CMECECForager
]

{ #category : #accessing }
CMECECModel >> theRestraineds [
	| tmp2 |
	tmp2 := theRestraineds.
	^ tmp2
		ifNil: [ theRestraineds := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECModel >> theRestraineds: arg1 [
	theRestraineds := arg1
]

{ #category : #accessing }
CMECECModel >> theUnrestraineds [
	| tmp2 |
	tmp2 := theUnrestraineds.
	^ tmp2
		ifNil: [ theUnrestraineds := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECModel >> theUnrestraineds: arg1 [
	theUnrestraineds := arg1
]

{ #category : #accessing }
CMECECModel >> theVegetationUnits [
	| tmp2 |
	tmp2 := theVegetationUnits.
	^ tmp2
		ifNil: [ theVegetationUnits := OrderedCollection new ]
		ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECModel >> theVegetationUnits: arg1 [
	theVegetationUnits := arg1
]

{ #category : #accessing }
CMECECModel >> unrestrainedInitialNumber [
	| tmp2 |
	tmp2 := unrestrainedInitialNumber.
	^ tmp2 ifNil: [ unrestrainedInitialNumber := 10 ] ifNotNil: [ tmp2 ]
]

{ #category : #accessing }
CMECECModel >> unrestrainedInitialNumber: arg1 [
	unrestrainedInitialNumber := arg1
]

{ #category : #probes }
CMECECModel >> unrestrainedSize [
	<probe>
	^ self theUnrestraineds size
]

{ #category : #probes }
CMECECModel >> vegetationBiomass [
	<probe>
	^ self theVegetationUnits
		inject: 0
		into: [ :arg1 :arg2 | arg1 + arg2 biomass ]
]
