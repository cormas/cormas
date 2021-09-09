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

	| tmp1 tmp2 tmp3 |
	tmp1 := 'Simulation [' , arg2 , ']was run in ' , arg1 printString
	        , ' milliseconds'.
	arg1 > 1000 ifTrue: [ 
		tmp1 := tmp1 , ', ie. '.
		tmp2 := Time fromSeconds: arg1 / 1000.
		tmp1 := tmp1 , tmp2 hours printString , ' h: '
		        , tmp2 minutes printString , ' m: '
		        , tmp2 seconds asFloat printString , ' s.' ].
	tmp3 := Transcript.
	tmp3
		cr;
		show: tmp1
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM1 [

	| tmp1 tmp2 tmp3 |
	tmp1 := self initialize new initSimulation.
	tmp2 := 200.
	tmp3 := Time millisecondsToRun: [ tmp2 timesRepeat: [ tmp1 runStep ] ].
	self
		displayRunDuration: tmp3 simName: 'a exampleSM1';
		transcriptShow_simulationTime: tmp1 timeStep
		nbRestrainedForagers: tmp1 restrainedSize
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM2 [

	| tmp1 tmp3 |
	tmp1 := self initialize new initSimulation.
	tmp3 := tmp1 simManager.
	tmp3
		finalTime: 200;
		runSimulation.
	self
		transcriptShow_simulationTime: tmp1 simManager currentTime
		nbRestrainedForagers: tmp1 restrainedSize
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM3 [

	| tmp1 tmp3 |
	tmp1 := self initialize new.
	tmp3 := tmp1 simManager.
	tmp3
		initializeSimulation;
		finalTime: 200;
		runSimulation.
	self
		transcriptShow_simulationTime: tmp1 simManager currentTime
		nbRestrainedForagers: tmp1 restrainedSize
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM4 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := 10.
	tmp3 := 20.
	tmp2 := OrderedCollection new.
	tmp4 := tmp1.
	1 to: tmp4 do: [ :tmp6 | 
		tmp5 := nil.
		tmp5 := Time millisecondsToRun: [ 
			        | tmp8 |
			        tmp8 := self initialize new initSimulation.
			        tmp3 timesRepeat: [ tmp8 runStep ] ].
		tmp2 add: tmp5 ].
	Transcript
		cr;
		show: 'exampleSM1 (no SimManager) - average time over ';
		show: tmp1;
		show: ' repetitions: ';
		show: (tmp2 sum / tmp1) rounded;
		show: ' ms'.
	tmp2 := OrderedCollection new.
	tmp4 := tmp1.
	1 to: tmp4 do: [ :tmp6 | 
		tmp5 := nil.
		tmp5 := Time millisecondsToRun: [ 
			        | tmp9 tmp11 |
			        tmp9 := self initialize new initSimulation.
			        tmp11 := tmp9 simManager.
			        tmp11
				        finalTime: tmp3;
				        runSimulation ].
		tmp2 add: tmp5 ].
	Transcript
		cr;
		show: 'exampleSM2 (SimManager used for run) - average time over ';
		show: tmp1;
		show: ' repetitions: ';
		show: (tmp2 sum / tmp1) rounded;
		show: ' ms'.
	tmp2 := OrderedCollection new.
	tmp4 := tmp1.
	1 to: tmp4 do: [ :tmp6 | 
		tmp5 := nil.
		tmp5 := Time millisecondsToRun: [ 
			        | tmp12 tmp14 |
			        tmp12 := self initialize new.
			        tmp14 := tmp12 simManager.
			        tmp14
				        initializeSimulation;
				        finalTime: tmp3;
				        runSimulation ].
		tmp2 add: tmp5 ].
	Transcript
		cr;
		show:
			'exampleSM3 (SimManager used for init and run) - average time over ';
		show: tmp1;
		show: ' repetitions: ';
		show: (tmp2 sum / tmp1) rounded;
		show: ' ms';
		open
]

{ #category : #'default value' }
CMECECModel class >> restrainedInitialNumber_default [

	^ 10
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> transcriptShow_simulationTime: arg1 nbRestrainedForagers: arg2 [

	Transcript
		cr;
		show: 'Number of steps : ';
		show: arg1 asString;
		cr;
		show: 'Number of restrained foragers: ';
		show: arg2 asString;
		open
]

{ #category : #'default value' }
CMECECModel class >> unrestrainedInitialNumber_default [

	^ 10
]

{ #category : #init }
CMECECModel >> fragmentedEnv [

	self spaceModel loadEnvironmentFromDirectory: 'fragmented.cells'.
	self initAgents
]

{ #category : #init }
CMECECModel >> homogeneousEnv2 [

	self
		createGridLines: 27
		columns: 27
		neighbourhood: 8
		closed: false.
	self theVegetationUnits do: [ :arg1 | arg1 initRandomBiomass ].
	self
		initAgents;
		displayPov: #povBiomass of: CMECECVegetationUnit;
		displayPov: #defaultPOV of: CMECECForager
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

	| tmp1 |
	tmp1 := restrainedInitialNumber.
	^ tmp1 ifNil: [ restrainedInitialNumber := 10 ] ifNotNil: [ tmp1 ]
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

	^ theRestraineds
		  ifNil: [ theRestraineds := OrderedCollection new ]
		  ifNotNil: [ theRestraineds ]
]

{ #category : #accessing }
CMECECModel >> theRestraineds: arg1 [

	theRestraineds := arg1
]

{ #category : #accessing }
CMECECModel >> theUnrestraineds [

	^ theUnrestraineds
		  ifNil: [ theUnrestraineds := OrderedCollection new ]
		  ifNotNil: [ theUnrestraineds ]
]

{ #category : #accessing }
CMECECModel >> theUnrestraineds: arg1 [

	theUnrestraineds := arg1
]

{ #category : #accessing }
CMECECModel >> theVegetationUnits [

	^ theVegetationUnits
		  ifNil: [ theVegetationUnits := OrderedCollection new ]
		  ifNotNil: [ theVegetationUnits ]
]

{ #category : #accessing }
CMECECModel >> theVegetationUnits: arg1 [

	^ theVegetationUnits := arg1
]

{ #category : #accessing }
CMECECModel >> unrestrainedInitialNumber [

	| tmp1 |
	tmp1 := unrestrainedInitialNumber.
	^ tmp1 ifNil: [ unrestrainedInitialNumber := 10 ] ifNotNil: [ tmp1 ]
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
