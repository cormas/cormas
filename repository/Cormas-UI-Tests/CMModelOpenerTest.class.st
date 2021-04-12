"
A CMModelOpenerTest is a test class for testing the behavior of CMModelOpener
"
Class {
	#name : #CMModelOpenerTest,
	#superclass : #CMOpenerTest,
	#category : #'Cormas-UI-Tests-Project'
}

{ #category : #accessing }
CMModelOpenerTest >> openerClass [

	^ CMModelOpener
]

{ #category : #test }
CMModelOpenerTest >> testCormasOpenLocations [

	self 
		assert: self opener cormasOpenLocations 
		equals: self opener cormasOpenLocationsMap keys.
]

{ #category : #test }
CMModelOpenerTest >> testCormasOpenLocationsMap [

	self assert: (self opener cormasOpenLocationsMap isKindOf: Dictionary).
]

{ #category : #test }
CMModelOpenerTest >> testOpenImageProject [

	| openedModel |
	
	openedModel := self opener openModel: #CMECECModel.
	self assert: (openedModel isKindOf: CMProjectModel).
	self assert: openedModel cormasModelName equals: #CMECECModel
]
