Class {
	#name : #CMSpecSimulationContainer,
	#superclass : #CMSpecObject,
	#instVars : [
		'simWindow'
	],
	#category : #'Cormas-UI-Spec1-Simulation-Controls'
}

{ #category : #specs }
CMSpecSimulationContainer class >> defaultSpec [
    <spec>
    ^ SpecLayout composed newColumn: [ : c | 
			c add: #simWindow ]
]

{ #category : #'as yet unclassified' }
CMSpecSimulationContainer >> fsmState [

	^ self owner fsmState
]

{ #category : #'as yet unclassified' }
CMSpecSimulationContainer >> fsmStateName [

	^ self fsmState name
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
	" Make visible the simulation controls "

"	| theRealWidget |
	
	self halt.
	theRealWidget := self simWindow window widget model widget widget.
	theRealWidget assureExtension visible: true.
	theRealWidget changed."

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
	" If the user closed the project, then clean the input controls in the receiver "

	self simInterfaceIsDisplayed
		ifTrue: [ self hideSimInterface ]
		ifFalse: [ self showSimInterface ].
	self fsmStateName = #stateWaitNewOrOpen
		ifTrue: [ 
			self simWindow currentStepInputText text: '0'.
			self simWindow finalStepInputText text: CMSimManager defaultFinalTime asString  ]
	
]
