Class {
	#name : #CMPRAuctioneer,
	#superclass : #CMAgentCommLocation,
	#classVars : [
		'CurrentId'
	],
	#category : #'Cormas-Model-PlotsRental'
}

{ #category : #'pov symbols' }
CMPRAuctioneer class >> VectorialPOV_PR_Auctioneer [
	"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."

	^ #(0.0 1.0 1.0 0.0 0.0 0.0 1 1 #center #(0.0 #@ -16.0 16.0 #@ 0.0 0.0 #@ 16.0 -16.0 #@ 0.0 0.0 #@ -16.0) true)
]

{ #category : #'pov symbols' }
CMPRAuctioneer class >> defaultColor [
	"Returns the default color (Automatically defined by Cormas)."

 	^ ColorValue cyan 
]

{ #category : #image }
CMPRAuctioneer class >> defaultImage [
	"defaultImage adapted for Cormas versions previous to 2010. Returns a copy of the POV image stored in the povDict of the class at a specifed symbol key"

	^ ((self povDict keys includes: #CMPRAuctioneer)
		ifTrue: [ self povDict at: #CMPRAuctioneer ]
		ifFalse: [ super defaultImage ]) copy
]

{ #category : #control }
CMPRAuctioneer >> createMsg: aMsgClass topic: aSymbol receiver: anAgent object: anObject [
	| m |
	m := aMsgClass new.
	m
		topic: aSymbol;
		object: anObject;
		sender: self;
		receiver: anAgent.
	^ m 
]

{ #category : #control }
CMPRAuctioneer >> createMsgTopic: aSymbol receiver: anAgent object: anObject [
	^ self
		createMsg: CMPRMessage
		topic: aSymbol
		receiver: anAgent
		object: anObject 
]

{ #category : #control }
CMPRAuctioneer >> getPlotsFromMessages [
	"Returns all the plots from the last received messages"

	^ OrderedCollection
		withAll: (self mailBox collect: [ :aMessage | aMessage object ])
]

{ #category : #control }
CMPRAuctioneer >> offer: patchs to: occ [
	"the auctioneer offers a set of plots to the farmer (sendMessageAsynchronously)"

	| m |
	patchs
		do: [ :aPatch | 
			m := self createMsgTopic: #proposal receiver: occ object: aPatch.
			self sendMessageAsynchronously: m ] 
]

{ #category : #control }
CMPRAuctioneer >> process: patchs [
	"from the accepted msgs, select the plots with the highest amount and send a #finalise msg to the winner"

	| proposals higherAmount chosenProposal m |
	patchs 
		do: [ :aPatch | 
			proposals := self mailBox
				select: [ :aMessage | aMessage object = aPatch ].
			higherAmount := 0.
			proposals
				do: [ :a | 
					a amount > higherAmount
						ifTrue: [ chosenProposal := a.
							higherAmount := a amount ] ].
			higherAmount = 0
				ifFalse: [ proposals
						do: [ :prop | 
							m := self
								createMsgTopic: nil
								receiver: prop sender
								object: prop object.
							m amount: prop amount.
							prop = chosenProposal
								ifTrue: [ m topic: #finalise ]
								ifFalse: [ m topic: #sorry ].
							self sendMessageAsynchronously: m ] ] ]
]

{ #category : #control }
CMPRAuctioneer >> processAcceptMessages [
	"from the accepted msgs, select the plots with the highest amount and send a #finalise msg to the winner"

	self process: self getPlotsFromMessages 
]
