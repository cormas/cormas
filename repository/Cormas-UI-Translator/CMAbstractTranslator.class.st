Class {
	#name : 'CMAbstractTranslator',
	#superclass : 'Object',
	#category : 'Cormas-UI-Translator',
	#package : 'Cormas-UI-Translator'
}

{ #category : 'as yet unclassified' }
CMAbstractTranslator class >> languageName [

	| className |
	className := self name.
	
	^ className copyFrom: 3 to: (className size - 10).
]

{ #category : 'translations' }
CMAbstractTranslator >> tAdd [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tAddMeasurementHelp [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tCharts [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tClass [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tControlMethod [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tData [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tDisplayEveryLabel [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tFinalStep [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tFixRandomSeed [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tInitMethod [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tInspector [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tMeasure [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tMeasureOf [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tNumberOfRepetitions [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tParameter [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tParameters [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tProbesToBeMeasured [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tProgressBarLabel [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tReleaseRandomSeedAfterInitialization [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tRun [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tRunButtonHelp [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpace [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeed10xFaster [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeed10xSlower [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeed2xFaster [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeed2xSlower [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeed5xFaster [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeed5xSlower [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeedHelp [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeedLabel [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tSpeedNormal [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tStepButtonHelp [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tStepButtonLabel [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tValue [

	self subclassResponsibility
]
