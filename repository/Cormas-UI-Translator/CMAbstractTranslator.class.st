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
CMAbstractTranslator >> tCharts [

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
CMAbstractTranslator >> tFinalStepLabel [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tInspector [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tProgressBarLabel [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tRunButtonHelp [

	self subclassResponsibility
]

{ #category : 'translations' }
CMAbstractTranslator >> tRunButtonLabel [

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
