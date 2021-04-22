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

{ #category : #examples }
CMECECModel class >> example1 [
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp9 tmp11 tmp13 |
	tmp9 := self.
	tmp9 initialize.
	tmp1 := tmp9 new.
	tmp2 := RTView new.
	tmp3 := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 9 scheme: 'YlGnBu').
	tmp4 := tmp3 command: [ :arg1 | arg1 biomass / 10.0 ].
	tmp1
		initSimulation;
		runStep.
	tmp11 := RTBox new.
	tmp11 color: tmp4.
	tmp5 := (tmp11 size: 25) elementsOn: tmp1 theVegetationUnits.
	tmp2 addAll: tmp5.
	tmp7 := RTPopup new.
	tmp7 text: [ :arg2 | arg2 asPopupText ].
	tmp5
		@ tmp7;
		do: [ :arg3 | arg3 when: TRMouseLeftClick do: [ :arg4 | arg3 model inspect ] ].
	tmp13 := RTGridLayout new.
	tmp13
		gapSize: 0;
		lineItemsCount: tmp1 spaceModel column;
		on: tmp2 elements.
	tmp2 canvas camera focusOnCenterScaled.
	tmp6 := RTActiveAnimation new.
	tmp6
		intervalInMilliseconds: 0;
		blockToExecute: [ tmp1 runStep.
			tmp2 elements do: #updateShape ];
		inView: tmp2.
	tmp2 openWithToolbar
]

{ #category : #examples }
CMECECModel class >> example1R3 [
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp7 tmp9 tmp13 tmp15 |
	tmp7 := self.
	tmp7 initialize.
	tmp1 := tmp7 new.
	tmp2 := RSCanvas new.
	tmp3 := RSColorPalette sequential ylgnbu9.
	tmp9 := NSScale linear.
	tmp9 domain: {0 . 0.1 . 0.2 . 0.3 . 0.4 . 0.5 . 0.6 . 0.7 . 1}.
	tmp3 := tmp9 range: tmp3 range.
	tmp1
		initSimulation;
		runStep.
	tmp4 := tmp1 theVegetationUnits
		collect: [ :arg1 | 
			| tmp11 |
			tmp11 := RSBox new.
			tmp11
				size: 25;
				model: arg1;
				yourself ]
		as: RSGroup.
	tmp2 addAll: tmp4.
	tmp5 := RSPopup text: [ :arg2 | arg2 asPopupText ].
	tmp4
		@ tmp5;
		when: RSMouseLeftClick do: [ :arg3 | arg3 shape model inspect ].
	tmp13 := RSGridLayout new.
	tmp13
		gapSize: 0;
		lineItemsCount: tmp1 spaceModel column;
		on: tmp2 nodes.
	tmp2 zoomToFit.
	tmp15 := tmp2 newAnimation.
	tmp15
		repeat;
		onStepDo: [ :arg4 | 
			tmp1 runStep.
			tmp4
				do: [ :arg5 | arg5 color: (tmp3 scale: arg5 model biomass / 10.0) ] ].
	tmp2
		addInteraction: RSCanvasController new;
		open
]

{ #category : #examples }
CMECECModel class >> example2 [
	| tmp1 |
	tmp1 := self initialize new initSimulation.
	(CMSimulationGrid new on: tmp1 with: tmp1 theVegetationUnits)
		runAndVisualize
]

{ #category : #examples }
CMECECModel class >> example3 [
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 tmp10 tmp12 tmp14 |
	tmp10 := self.
	tmp10 initialize.
	tmp1 := tmp10 new.
	tmp2 := RTView new.
	tmp3 := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 9 scheme: 'YlGnBu').
	tmp4 := tmp3 command: [ :arg1 | arg1 biomass / 10.0 ].
	tmp1
		initSimulation;
		runStep.
	tmp12 := RTBox new.
	tmp12 color: tmp4.
	tmp5 := (tmp12 size: 25) elementsOn: tmp1 theVegetationUnits.
	tmp2 addAll: tmp5.
	tmp7 := RTPopup new.
	tmp7 text: [ :arg2 | arg2 asPopupText ].
	tmp5
		@ tmp7;
		do: [ :arg3 | arg3 when: TRMouseLeftClick do: [ :arg4 | arg3 model inspect ] ].
	tmp8 := RTMenuBuilder new view: tmp2.
	tmp8
		menu: 'Visualize'
		background: Color red
		callback: [ self visualize ].
	tmp14 := RTGridLayout new.
	tmp14
		gapSize: 0;
		lineItemsCount: tmp1 spaceModel column;
		on: tmp2 elements.
	tmp2 canvas camera focusOnCenterScaled.
	tmp6 := RTActiveAnimation new.
	tmp6
		blockToExecute: [ tmp1 runStep.
			tmp2 elements do: #updateShape ];
		inView: tmp2.
	tmp2 openWithToolbar
]

{ #category : #examples }
CMECECModel class >> example4 [
	| tmp1 |
	tmp1 := self initialize new initSimulation.
	(CMSimulationGrid initialize new
		on: tmp1
		withCells: tmp1 theESE
		withSituatedEntities: tmp1 allTheSituatedEntities) runAndVisualize
]

{ #category : #examples }
CMECECModel class >> example5 [
	| tmp1 |
	self setActiveProbes: OrderedCollection new.
	tmp1 := self initialize new initSimulation.
	(CMSimulationGrid initialize new
		on: tmp1
		withCells: tmp1 theESE
		withSituatedEntities: tmp1 allTheSituatedEntities)
		runAndVisualizeWithMenus goSlow
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> exampleSM1 [
	| tmp1 tmp2 tmp3 |
	tmp1 := self initialize new initSimulation.
	tmp2 := 200.
	tmp3 := Time
		millisecondsToRun: [ tmp2 timesRepeat: [ tmp1 runStep ] ].
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
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp10 tmp15 tmp20 |
	tmp1 := 10.
	tmp3 := 20.
	tmp2 := OrderedCollection new.
	tmp4 := tmp1.
	1 to: tmp4 do: [ :tmp6 | 
		tmp5 := nil.
		tmp5 := Time
			millisecondsToRun: [ | tmp8 |
				tmp8 := self initialize new initSimulation.
				tmp3 timesRepeat: [ tmp8 runStep ] ].
		tmp2 add: tmp5 ].
	tmp10 := Transcript.
	tmp10
		cr;
		show:
			'exampleSM1 (no SimManager) - average time over ' , tmp1 asString
				, ' repetitions: ' , (tmp2 sum / tmp1) rounded asString , ' ms'.
	tmp2 := OrderedCollection new.
	tmp4 := tmp1.
	1 to: tmp4 do: [ :tmp6 | 
		tmp5 := nil.
		tmp5 := Time
			millisecondsToRun: [ | tmp11 tmp13 |
				tmp11 := self initialize new initSimulation.
				tmp13 := tmp11 simManager.
				tmp13
					finalTime: tmp3;
					runSimulation ].
		tmp2 add: tmp5 ].
	tmp15 := Transcript.
	tmp15
		cr;
		show:
			'exampleSM2 (SimManager used for run) - average time over '
				, tmp1 asString , ' repetitions: '
				, (tmp2 sum / tmp1) rounded asString , ' ms'.
	tmp2 := OrderedCollection new.
	tmp4 := tmp1.
	1 to: tmp4 do: [ :tmp6 | 
		tmp5 := nil.
		tmp5 := Time
			millisecondsToRun: [ | tmp16 tmp18 |
				tmp16 := self initialize new.
				tmp18 := tmp16 simManager.
				tmp18
					initializeSimulation;
					finalTime: tmp3;
					runSimulation ].
		tmp2 add: tmp5 ].
	tmp20 := Transcript.
	tmp20
		cr;
		show:
			'exampleSM3 (SimManager used for init and run) - average time over '
				, tmp1 asString , ' repetitions: '
				, (tmp2 sum / tmp1) rounded asString , ' ms'.
	Transcript open
]

{ #category : #'default value' }
CMECECModel class >> restrainedInitialNumber_default [
	^ 10
]

{ #category : #'examples - with SimManager' }
CMECECModel class >> transcriptShow_simulationTime: arg1 nbRestrainedForagers: arg2 [
	| tmp2 |
	tmp2 := Transcript.
	tmp2
		cr;
		show: 'Number of steps : ' , arg1 asString;
		cr;
		show: 'Number of restrained foragers: ' , arg2 asString;
		open
]

{ #category : #'default value' }
CMECECModel class >> unrestrainedInitialNumber_default [
	^ 10
]

{ #category : #accessing }
CMECECModel class >> visualize [
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp7 tmp9 |
	tmp1 := #(20 30 50 100).
	tmp5 := RTComposer new.
	tmp2 := RTGrapher new.
	tmp2
		extent: 200 @ 200;
		view: tmp5 view.
	tmp3 := RTData new.
	tmp3 interaction popup.
	tmp3 barShape color: Color blue.
	tmp3 points: tmp1.
	tmp2 add: tmp3.
	tmp7 := tmp2 axisX.
	tmp7
		noTick;
		noLabel.
	tmp2 build.
	tmp5 group: #graph.
	tmp4 := RTPieBuilder new.
	tmp4 view: tmp5 view.
	tmp4 interaction popup.
	tmp4
		objects: tmp1;
		slice: #yourself;
		labeled;
		build.
	tmp5
		group: #pie;
		move: #graph onTheLeftOf: #pie.
	tmp9 := RTMetricNormalizer new.
	tmp9
		view: tmp5 view;
		objects: tmp1;
		distinctColor.
	tmp5 open
]

{ #category : #accessing }
CMECECModel class >> visualize: arg1 [
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp7 tmp9 |
	tmp1 := #(20 30 50 100).
	tmp5 := RTComposer new.
	tmp2 := RTGrapher new.
	tmp2
		extent: 200 @ 200;
		view: tmp5 view.
	tmp3 := RTData new.
	tmp3 interaction popup.
	tmp3 barShape color: Color blue.
	tmp3 points: tmp1.
	tmp2 add: tmp3.
	tmp7 := tmp2 axisX.
	tmp7
		noTick;
		noLabel.
	tmp2 build.
	tmp5 group: #graph.
	tmp4 := RTPieBuilder new.
	tmp4 view: tmp5 view.
	tmp4 interaction popup.
	tmp4
		objects: tmp1;
		slice: #yourself;
		labeled;
		build.
	tmp5
		group: #pie;
		move: #graph onTheLeftOf: #pie.
	tmp9 := RTMetricNormalizer new.
	tmp9
		view: tmp5 view;
		objects: tmp1;
		distinctColor.
	tmp5 open
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
		shape: #squared
		nbNeighbours: #eight
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
