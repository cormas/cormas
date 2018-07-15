"
Channel is the object in charge of receiving the messages from a sender and deliver them to the receivers. They can be delivered synchronously ( sent immediately) or asynchronousley (they are stored in the messages collection)

Instance Variables:
	listeFonctionObs	<(Collection of: FonctionObs)>	In Cormas there is an interface to observe the exchanges of messages.  Instances of object FonctionObs is in charge of establishing a linkage between the Chaneel and the interface
. 	messages	<(Collection of: (LensAbsentee | Object))>	a collection of messages
	population	<LensAbsentee | Object>	the population of agents registered. Automatically any instace of AgentComm, GroupComm, AgentCommLocation and GroupCommLocation is registered.

Methods

stock: will record the receiving argument which is supposed to be an instance of subclass of Msg in the
messages attribute.
transmit: will immediately deliver the message to the receiver of the message. 
flush will transmit the set of messages in the message collection to the receivers.
"
Class {
	#name : #CMChannel,
	#superclass : #Object,
	#instVars : [
		'population',
		'listeFonctionObs',
		'messages'
	],
	#category : 'Cormas-Core-Communication'
}

{ #category : #observer }
CMChannel >> addFonctionObs: uneFObs [
	
	uneFObs addCanal: self.
	listeFonctionObs add: uneFObs
]

{ #category : #procedures }
CMChannel >> flush [
	"flush will transmit the set of messages in the message collection to the receivers."
	
	self messages do: [ : a | self transmit: a].
	messages := OrderedCollection new
]

{ #category : #initialization }
CMChannel >> initialize [
	
	listeFonctionObs := OrderedCollection new.
	messages := OrderedCollection new
]

{ #category : #accessing }
CMChannel >> listeFonctionObs [
	
	^listeFonctionObs
]

{ #category : #accessing }
CMChannel >> messages [
	^ messages
]

{ #category : #accessing }
CMChannel >> population [
	^ population
]

{ #category : #accessing }
CMChannel >> population: anArray [
	
	population := anArray.
	listeFonctionObs do: [ : fobs | fobs populationSource: anArray ]
]

{ #category : #observer }
CMChannel >> removeFonctionObs: uneFObs [
	
	listeFonctionObs isEmpty 
		ifFalse: [ listeFonctionObs remove: uneFObs ]
]

{ #category : #procedures }
CMChannel >> stock: aMsg [
	" will record the receiving argument which is supposed to be an instance of subclass of Msg in the messages attribute."
	
	self messages add: aMsg
]

{ #category : #procedures }
CMChannel >> transmit: aMsg [
	"will immediately deliver the message to the receiver of the message. "
	
	aMsg receiver messageFromChannel: aMsg.
	listeFonctionObs do: [ : fobs | fobs message: aMsg ]
]
