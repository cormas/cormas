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
	#name : #ClassAttributeValueAnalysisRandomness,
	#superclass : #ClassAttributeValueAnalysis,
	#instVars : [
		'randomType',
		'repetitions',
		'repNb',
		'randomTypeChoices'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #controlling }
ClassAttributeValueAnalysisRandomness >> getRandomValue [
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
ClassAttributeValueAnalysisRandomness >> init [
	
	self randomTypeChoices value: (List withAll: #('' 'simpleRandom'))
]

{ #category : #controlling }
ClassAttributeValueAnalysisRandomness >> initializeCurrentValue [
	
	self currentValue: self getRandomValue
]

{ #category : #testing }
ClassAttributeValueAnalysisRandomness >> isAnalysisDone [
	"answer if currentValue is upper than the final value"
	
	self currentValue isNil ifTrue: [^false].
	^self repNb = self repetitions
]

{ #category : #controlling }
ClassAttributeValueAnalysisRandomness >> nbOfSims [
	"return the number of simulations for the analysis of this attribute, WITHOUT multiplying by the repeat number for each parameters set."
	
	^self repetitions
]

{ #category : #accessing }
ClassAttributeValueAnalysisRandomness >> randomType [
	
	^randomType
]

{ #category : #accessing }
ClassAttributeValueAnalysisRandomness >> randomType: anObject [
	
	randomType := anObject
]

{ #category : #accessing }
ClassAttributeValueAnalysisRandomness >> randomTypeChoices [
	
	^randomTypeChoices isNil
		ifTrue: [randomTypeChoices := List new asValue]
		ifFalse: [randomTypeChoices]
]

{ #category : #accessing }
ClassAttributeValueAnalysisRandomness >> repNb [
	
	^repNb ifNil: [repNb := 0]
]

{ #category : #accessing }
ClassAttributeValueAnalysisRandomness >> repNb: anObject [
	
	repNb := anObject
]

{ #category : #accessing }
ClassAttributeValueAnalysisRandomness >> repetitions [
	
	^repetitions
]

{ #category : #accessing }
ClassAttributeValueAnalysisRandomness >> repetitions: anObject [
	
	repetitions := anObject
]

{ #category : #controlling }
ClassAttributeValueAnalysisRandomness >> reset [
	
	super reset.
	repetitions := nil
]

{ #category : #controlling }
ClassAttributeValueAnalysisRandomness >> setNextValue [
	"This method calculates the new value of a parameter."
	
	self isAnalysisDone ifTrue: [^nil].
	self repNb: self repNb + 1.
	self currentValue: self getRandomValue.
	Cormas initRandomSeed
]
