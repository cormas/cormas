"
ClassAttributeValueAnalysisRandomness for Monte Carlo analysis.
(I used initValue and finalValue, defined in the superclass, instead of minValue and maxValue !)

Instance Variables:
	randomType	<LensAbsentee | Object>	description of randomType
	randomTypeChoices	<ValueModel>	description of randomTypeChoices
	repetitions	<LensAbsentee | Object>	description of repetitions
	repNb	<SmallInteger>	description of repNb


"
Class {
	#name : #CMClassAttributeValueAnalysisRandomness,
	#superclass : #CMClassAttributeValueAnalysis,
	#instVars : [
		'randomType',
		'repetitions',
		'repNb',
		'randomTypeChoices'
	],
	#category : #'Cormas-UI-Attributes'
}

{ #category : #controlling }
CMClassAttributeValueAnalysisRandomness >> getRandomValue [
	"This method calculates the new value of a parameter."
	
	| factor |
	self flag:#shouldBeRevised.
	(self randomType = 'random'
		or: [self randomType = '' or: [self randomType isNil]])
		ifFalse:
			["ToDo"
			self halt].
	factor := self initValue asRational denominator
		max: self finalValue asRational denominator.
	factor := factor * self repetitions.
	factor := 10 raisedTo: factor log ceiling.
	^((Cormas
		randomFrom: self initValue * factor
		to: self finalValue * factor) / factor) asFloat
]

{ #category : #'initialize-release' }
CMClassAttributeValueAnalysisRandomness >> init [
	
	self randomTypeChoices value: (Array withAll: #('' 'simpleRandom'))
]

{ #category : #controlling }
CMClassAttributeValueAnalysisRandomness >> initializeCurrentValue [
	
	self currentValue: self getRandomValue
]

{ #category : #testing }
CMClassAttributeValueAnalysisRandomness >> isAnalysisDone [
	"answer if currentValue is upper than the final value"
	
	self currentValue isNil ifTrue: [^false].
	^self repNb = self repetitions
]

{ #category : #controlling }
CMClassAttributeValueAnalysisRandomness >> nbOfSims [
	"return the number of simulations for the analysis of this attribute, WITHOUT multiplying by the repeat number for each parameters set."
	
	^self repetitions
]

{ #category : #accessing }
CMClassAttributeValueAnalysisRandomness >> randomType [
	
	^randomType
]

{ #category : #accessing }
CMClassAttributeValueAnalysisRandomness >> randomType: anObject [
	
	randomType := anObject
]

{ #category : #accessing }
CMClassAttributeValueAnalysisRandomness >> randomTypeChoices [
	
	^randomTypeChoices isNil
		ifTrue: [randomTypeChoices := Array new ]
		ifFalse: [randomTypeChoices]
]

{ #category : #accessing }
CMClassAttributeValueAnalysisRandomness >> repNb [
	
	^repNb ifNil: [repNb := 0]
]

{ #category : #accessing }
CMClassAttributeValueAnalysisRandomness >> repNb: anObject [
	
	repNb := anObject
]

{ #category : #accessing }
CMClassAttributeValueAnalysisRandomness >> repetitions [
	
	^repetitions
]

{ #category : #accessing }
CMClassAttributeValueAnalysisRandomness >> repetitions: anObject [
	
	repetitions := anObject
]

{ #category : #controlling }
CMClassAttributeValueAnalysisRandomness >> reset [
	
	super reset.
	repetitions := nil
]

{ #category : #controlling }
CMClassAttributeValueAnalysisRandomness >> setNextValue [
	"This method calculates the new value of a parameter."
	
	self isAnalysisDone ifTrue: [^nil].
	self repNb: self repNb + 1.
	self currentValue: self getRandomValue.
	Cormas initRandomSeed
]
