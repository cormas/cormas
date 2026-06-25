Class {
	#name : 'CMSensitivityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'setup',
		'data',
		'runner',
		'numberOfCompletedSimulations',
		'whenProgressBlock',
		'whenFinishedBlock'
	],
	#category : 'Cormas-Core-SensitivityAnalysis',
	#package : 'Cormas-Core',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMSensitivityAnalysis >> announceFinished [

	whenFinishedBlock value: self
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysis >> announceProgress [

	whenProgressBlock value: self
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> data [

	^ data 
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysis >> dataColumnNames [

	| parameterNames probeNames |
	
	parameterNames := (setup parameterSamplings keys
		collect: [ :parameter | parameter name ])
		asOrderedCollection.
	
	probeNames := (setup probes
		collect: [ :probe | probe name ])
		asOrderedCollection.
	
	^ parameterNames, probeNames 
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> initialize [

	super initialize.
	
	data := OrderedCollection new.
	numberOfCompletedSimulations := 0.
	whenProgressBlock := [ :analysis | "do nothing" ].
	whenFinishedBlock := [ :analysis | "do nothing" ].
	
	self initializeRunner
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> initializeRunner [

	runner := CMSensitivityAnalysisProcessRunner new
		sensitivityAnalysis: self;
		yourself
]

{ #category : 'testing' }
CMSensitivityAnalysis >> isPaused [
	
	^ runner isPaused
]

{ #category : 'testing' }
CMSensitivityAnalysis >> isRunning [
	
	^ runner isRunning
]

{ #category : 'instance creation' }
CMSensitivityAnalysis >> newSimulationFor: aParameterCombination [

	| model simulation |
	model := setup modelClass new.
	
	simulation := (CMSimulation for: model)
		activeInitSelector: setup initSelector;
		activeControlSelector: setup controlSelector;
		stopWhen: setup stopCondition;
		hasFixedRandomSeed: true;
		yourself.
	
	self setParameterValues: aParameterCombination on: model.
	simulation initializeSimulation.
	
	^ simulation
	
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> numberOfCompletedSimulations [

	^ numberOfCompletedSimulations
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysis >> parameterCombinations [

	| combinations |
	combinations := { OrderedDictionary new } asOrderedCollection.
	
	setup parameterSamplings keysAndValuesDo: [ :parameter :values |
		combinations := combinations flatCollect: [ :existingCombination |
			values collect: [ :value |
				existingCombination copy
					at: parameter put: value;
					yourself ] ] ].
		
	^ combinations
]

{ #category : 'running' }
CMSensitivityAnalysis >> pause [

	runner pause
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> progress [

	self totalNumberOfSimulations = 0 ifTrue: [ ^ 0 ].
	^ numberOfCompletedSimulations / self totalNumberOfSimulations
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysis >> recordDataFrom: aSimulation combination: aParameterCombination [

	| row lastDataRow |
	row := OrderedDictionary new.
	
	aParameterCombination keysAndValuesDo: [ :parameter :value |
		row
			at: parameter name
			put: value ].
		
	lastDataRow := aSimulation data last.
	
	setup probes do: [ :probe |
		row
			at: probe name
			put: (lastDataRow at: probe name) ].
		
	data add: row.
	numberOfCompletedSimulations := numberOfCompletedSimulations + 1.
	
	^ row
]

{ #category : 'running' }
CMSensitivityAnalysis >> resume [
	
	runner resume
]

{ #category : 'running' }
CMSensitivityAnalysis >> run [

	data := OrderedCollection new.
	numberOfCompletedSimulations := 0.
	
	runner runInBackground
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> setParameter: aParameter value: aValue on: aCormasModel [
	
	"One parameter represents the random seed.
	It is the only parameter for which the target class is the simulation context"
	aParameter targetClass = CMSimulationContext ifTrue: [
		^ aParameter
			setValue: aValue
			for: aCormasModel simulationContext ].
	
	"Class side parameters correspond to entity classes.
	We set their values on those classes"
	aParameter isClassSide ifTrue: [
		^ aParameter
			setValue: aValue
			for: aParameter targetClass ].

	"The only instance side parameters are model parameters"
	^ aParameter
		setValue: aValue
		for: aCormasModel
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> setParameterValues: aParameterCombination on: aCormasModel [

	aParameterCombination keysAndValuesDo: [ :parameter :value |
		self
			setParameter: parameter
			value: value
			on: aCormasModel ]
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> setup: aSensitivityAnalysisSetup [

	setup := aSensitivityAnalysisSetup
]

{ #category : 'running' }
CMSensitivityAnalysis >> stop [

	runner stop
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> totalNumberOfSimulations [

	setup ifNil: [ ^ 0 ].
	^ setup numberOfSimulations
]

{ #category : 'enumerating' }
CMSensitivityAnalysis >> whenFinishedDo: aBlock [

	whenFinishedBlock := aBlock
]

{ #category : 'enumerating' }
CMSensitivityAnalysis >> whenProgressDo: aBlock [

	whenProgressBlock := aBlock
]
