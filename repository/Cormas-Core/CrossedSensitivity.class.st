"
CrossedSensitivity allows to conduct Crossed sensitivity analysis by modifying parameters' values simultaneously.


"
Class {
	#name : #CrossedSensitivity,
	#superclass : #Object,
	#category : #'Cormas-Core-Analysis'
}

{ #category : #'actions_buttons' }
CrossedSensitivity >> checkSettings [
	"return self if ok"
	
	super checkSettings = self ifFalse: [^nil].
	self parametersToAnalyse size < 2
		ifTrue:
			[^self cormas warn: 'There should be at least 2 attributes to analyse']
]

{ #category : #accessing }
CrossedSensitivity >> defaultDirectoryName [
	
	^'CrossedSensitivity_'
]

{ #category : #testing }
CrossedSensitivity >> isCrossedAnalysis [
	
	^true
]

{ #category : #setParameters }
CrossedSensitivity >> setInitialParameters [
	"Set the initial values of the analysed attributes but the last one (that will be initialized at #setNextAttributeValue)"
	
	self parametersToAnalyse do: [:cav | cav initializeCurrentValue].
	self parametersToAnalyse last currentValue: nil.	"refresh"
	self classAttribValueAnalysis_List list: self parametersToAnalyse
]

{ #category : #accessing }
CrossedSensitivity >> totalSimNumber [
	"return the number of simulations for the analysis, Without multiplying by the repeat number for each parameters set."
	
	| tot |
	tot := 1.
	self parametersToAnalyse do: [:cav | tot := tot * cav nbOfSims].
	^tot
]
