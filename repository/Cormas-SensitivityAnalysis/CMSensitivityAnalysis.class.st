Class {
	#name : 'CMSensitivityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'modelClass',
		'activeInitSelector',
		'activeControlSelector',
		'numberOfRepetitions',
		'simulations',
		'dataCollectors',
		'data',
		'randomSeed',
		'releaseRandomSeedAfterInit'
	],
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'as yet unclassified' }
CMSensitivityAnalysis class >> defaultNumberOfRepetitions [

	^ 10
]

{ #category : 'instance creation' }
CMSensitivityAnalysis class >> for: aModelClass [

	^ self new
		modelClass: aModelClass;
		yourself
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> activeControlSelector: aSymbol [

	activeControlSelector := aSymbol
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> activeInitSelector: aSymbol [

	activeInitSelector := aSymbol
]

{ #category : 'adding' }
CMSensitivityAnalysis >> addSimulationForParameter: aParameter value: aValue [

	| simulation |
	
	simulation := (CMSimulation for: modelClass)
		activeInitSelector: activeInitSelector;
		activeControlSelector: activeControlSelector;
		shouldReleaseRandomSeedAfterInitialization: releaseRandomSeedAfterInit;
		yourself.
		
	simulation initialParameterValues at: aParameter put: aValue.
	simulations add: simulation
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysis >> clearData [

	data := OrderedCollection new
]

{ #category : 'adding' }
CMSensitivityAnalysis >> clearSimulations [

	simulations removeAll
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> data [

	^ data
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> dataCollectors: aCollection [

	dataCollectors := aCollection
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> initialize [

	super initialize.
	
	numberOfRepetitions := self class defaultNumberOfRepetitions.
	simulations := OrderedCollection new.
	dataCollectors := OrderedCollection new.
	self clearData 
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> modelClass [

	^ modelClass
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> modelClass: aClass [

	modelClass := aClass 
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> numberOfRepetitions [

	^ numberOfRepetitions
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> numberOfRepetitions: aNumber [

	numberOfRepetitions := aNumber
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> randomSeed [

	^ randomSeed
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> randomSeed: aNumber [

	randomSeed := aNumber
]

{ #category : 'running' }
CMSensitivityAnalysis >> run [

	self runAfterEachRepetitionDo: [ "do nothing" ]
]

{ #category : 'running' }
CMSensitivityAnalysis >> runAfterEachRepetitionDo: aBlock [

	self clearData.

	simulations do: [ :simulation |
		self
			runSimulation: simulation
			afterEachRepetitionDo: aBlock ].
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> runSimulation: aSimulation afterEachRepetitionDo: aBlock [

	| dataRecord |

	dataCollectors do: [ :collector | collector simulation: aSimulation ].

	1 to: numberOfRepetitions do: [ :i |
		dataCollectors do: #activateProbeBeforeSimulation.
		aSimulation randomSeed: randomSeed.
		aSimulation initializeSimulation.
		aSimulation runAllSteps.
		dataCollectors do: #collectDataAfterSimulation.
		
		dataRecord := {
			'Parameter class' -> aSimulation initialParameterValues keys anyOne receiver name .
			'Parameter name' -> aSimulation initialParameterValues keys anyOne name .
			'Parameter value' -> aSimulation initialParameterValues values anyOne .
			'Repetition' -> i
		} asOrderedDictionary.
		
		dataCollectors do: [ :collector |
			dataRecord at: ((collector class collectorNameFromTranslator: CMEnglishTranslator new), ' of ', collector probe name) put: collector data last ].
		
		data add: dataRecord.
		aBlock value ].
]

{ #category : 'asserting' }
CMSensitivityAnalysis >> shouldReleaseRandomSeedAfterInitialization: aBoolean [

	releaseRandomSeedAfterInit := aBoolean
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> simulations [

	^ simulations
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> totalNumberOfRuns [

	^ simulations size * numberOfRepetitions
]
