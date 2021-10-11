Class {
	#name : #CMBushmeatHuntingModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'anthelopes',
		'cells',
		'huntingFamilies',
		'maximumNumberOffspring'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatHuntingModel >> anthelopes [
	^ anthelopes
]

{ #category : #accessing }
CMBushmeatHuntingModel >> anthelopes: anAString [
	anthelopes := anAString
]

{ #category : #accessing }
CMBushmeatHuntingModel >> cells [
	^ cells
]

{ #category : #accessing }
CMBushmeatHuntingModel >> cells: anAString [
	cells := anAString
]

{ #category : #accessing }
CMBushmeatHuntingModel >> huntingFamilies [
	^ huntingFamilies
]

{ #category : #accessing }
CMBushmeatHuntingModel >> huntingFamilies: anAString [
	huntingFamilies := anAString
]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> init [

	self 
		initializeSpace;
		initializeAgents.
]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> initializeAgents [

]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> initializeSpace [

]

{ #category : #accessing }
CMBushmeatHuntingModel >> maximumNumberOffspring [
	^ maximumNumberOffspring
]

{ #category : #accessing }
CMBushmeatHuntingModel >> maximumNumberOffspring: anAString [
	maximumNumberOffspring := anAString
]
