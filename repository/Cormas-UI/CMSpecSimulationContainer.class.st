Class {
	#name : #CMSpecSimulationContainer,
	#superclass : #CMSpecObject,
	#instVars : [
		'simWindow'
	],
	#category : 'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecSimulationContainer class >> defaultSpec [
    <spec>
    ^ SpecLayout composed newColumn: [ : c | 
			c add: #simWindow ]
]

{ #category : #accessing }
CMSpecSimulationContainer >> hideSimInterface [

	self simulationWidget hide.
]

{ #category : #initialization }
CMSpecSimulationContainer >> initializeWidgets [
	" Private - See superimplementor's comment "
	
	self simWindow: (CMSpecSimulationWindow for: self projectManager).


]

{ #category : #accessing }
CMSpecSimulationContainer >> showSimInterface [

	self simulationWidget show.
]

{ #category : #accessing }
CMSpecSimulationContainer >> simInterfaceIsDisplayed [

	^ self simulationWidget visible 
]

{ #category : #accessing }
CMSpecSimulationContainer >> simWindow [
	^ simWindow
]

{ #category : #accessing }
CMSpecSimulationContainer >> simWindow: anObject [
	simWindow := anObject
]

{ #category : #accessing }
CMSpecSimulationContainer >> simulationWidget [

	^ spec instance widget
]

{ #category : #accessing }
CMSpecSimulationContainer >> toggleSimInterface [

	self simInterfaceIsDisplayed
		ifTrue: [ self hideSimInterface ]
		ifFalse: [ self showSimInterface ]
]
