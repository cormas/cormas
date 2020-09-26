Class {
	#name : #CMClassAttributeValueAnalysis,
	#superclass : #CMClassAttributeValue,
	#instVars : [
		'initValue',
		'finalValue',
		'step'
	],
	#category : #'Cormas-UI-Attributes'
}

{ #category : #accessing }
CMClassAttributeValueAnalysis >> finalValue [
	
	^finalValue
]

{ #category : #accessing }
CMClassAttributeValueAnalysis >> finalValue: anObject [
	
	finalValue := anObject.
	self hasBeenModified: anObject isNil not
]

{ #category : #accessing }
CMClassAttributeValueAnalysis >> initValue [
	
	^initValue
]

{ #category : #accessing }
CMClassAttributeValueAnalysis >> initValue: anObject [
	
	initValue := anObject.
	self hasBeenModified: anObject isNil not
]

{ #category : #controlling }
CMClassAttributeValueAnalysis >> initializeCurrentValue [
	
	self currentValue: self initValue
]

{ #category : #testing }
CMClassAttributeValueAnalysis >> isAnalysisDone [
	"answer if currentValue is upper than the final value"
	
	self currentValue isNil ifTrue: [^false].
	^self step > 0
		ifTrue: [self currentValue >= self finalValue]
		ifFalse: [self currentValue <= self finalValue]
]

{ #category : #controlling }
CMClassAttributeValueAnalysis >> nbOfSims [
	"return the number of simulations for the analysis of this attribute, WITHOUT multiplying by the repeat number for each parameters set.
self cormas displaySimNumber value: self simNumero printString , '/', self simNumber printString.
"
	
	^((self finalValue - self initValue) / self step) asInteger + 1
]

{ #category : #controlling }
CMClassAttributeValueAnalysis >> reset [
	
	initValue := nil.
	finalValue := nil.
	step := nil.
	self hasBeenModified: false
]

{ #category : #controlling }
CMClassAttributeValueAnalysis >> setNextValue [
	"This method calculates the new value of a parameter. 
	For avoiding problems of flotting numbers (Cf. The gohst in the model), currentValue, step, nextValue & finalValue are stored as Rational numbers. We thus avoid accumulating a delta to minimize round-off error."
	
	| currentRational stepRational nextRational |
	self currentValue ifNil: [^self currentValue: self initValue].
	self isAnalysisDone ifTrue: [^nil].
	currentRational := self currentValue asRational.
	stepRational := self step asRational.
	nextRational := currentRational + stepRational.
	self step sign * nextRational >= (self step sign * self finalValue)
		ifTrue: [nextRational := self finalValue].
	nextRational isInteger
		ifTrue: [self currentValue: nextRational]
		ifFalse: [self currentValue: nextRational asFloat].
	^nextRational
]

{ #category : #accessing }
CMClassAttributeValueAnalysis >> step [
	
	^step
]

{ #category : #accessing }
CMClassAttributeValueAnalysis >> step: anObject [
	
	step := anObject.
	self hasBeenModified: anObject isNil not
]
