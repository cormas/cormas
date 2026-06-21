Class {
	#name : 'CMSensitivityAnalysisSetup',
	#superclass : 'Object',
	#instVars : [
		'modelClass',
		'initSelector',
		'controlSelector',
		'stopConditionSelector',
		'finalTimeStep',
		'probes',
		'parameterSamplings'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> controlSelector [

	^ controlSelector
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> controlSelector: anObject [

	controlSelector := anObject
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> finalTimeStep [

	^ finalTimeStep
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> finalTimeStep: anObject [

	finalTimeStep := anObject
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> initSelector [

	^ initSelector
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> initSelector: anObject [

	initSelector := anObject
]

{ #category : 'initialization' }
CMSensitivityAnalysisSetup >> initialize [

	super initialize.
	probes := OrderedCollection new.
	parameterSamplings := Dictionary new
]

{ #category : 'testing' }
CMSensitivityAnalysisSetup >> isComplete [

	modelClass ifNil: [ ^ false ].
	initSelector ifNil: [ ^ false ].
	controlSelector ifNil: [ ^ false ].
	finalTimeStep ifNil: [ ^ false ].
	probes ifEmpty: [ ^ false ].
	parameterSamplings ifEmpty: [ ^ false ].
	
	^ true
	
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> modelClass [

	^ modelClass
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> modelClass: anObject [

	modelClass := anObject
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisSetup >> numberOfSimulations [

	self isComplete ifFalse: [ ^ 0 ].

	^ parameterSamplings values inject: 1 into: [ :product :collection |
		product * collection size ]
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> parameterSamplings [

	^ parameterSamplings
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> parameterSamplings: anObject [

	parameterSamplings := anObject
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> probes [

	^ probes
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> probes: anObject [

	probes := anObject
]

{ #category : 'stop condition block' }
CMSensitivityAnalysisSetup >> stopCondition [

	^ stopConditionSelector
		ifNil: [ self stopConditionWithoutBooleanMethod ]
		ifNotNil: [ self stopConditionWithBooleanMethod ]
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> stopConditionSelector [

	^ stopConditionSelector
]

{ #category : 'accessing' }
CMSensitivityAnalysisSetup >> stopConditionSelector: anObject [

	stopConditionSelector := anObject
]

{ #category : 'stop condition block' }
CMSensitivityAnalysisSetup >> stopConditionWithBooleanMethod [

	^ [ :model |
		(model currentTimeStep >= finalTimeStep) or: [ 
			model perform: stopConditionSelector ] ]
]

{ #category : 'stop condition block' }
CMSensitivityAnalysisSetup >> stopConditionWithoutBooleanMethod [

	^ [ :model | model currentTimeStep >= finalTimeStep ]
]
