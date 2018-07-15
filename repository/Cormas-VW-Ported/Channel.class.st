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
	#name : #Channel,
	#superclass : #Object,
	#instVars : [
		'population',
		'listeFonctionObs',
		'messages'
	],
	#category : 'Cormas-VW-Ported'
}

{ #category : #'instance creation' }
Channel class >> new [
	
	^super new initialize
]

{ #category : #observer }
Channel >> addFonctionObs: uneFObs [
	
	uneFObs addCanal: self.
	listeFonctionObs add: uneFObs
]

{ #category : #procedures }
Channel >> flush [
	"flush will transmit the set of messages in the message collection to the receivers."
	
	self messages do: [:a | self transmit: a].
	messages := OrderedCollection new
]

{ #category : #initialization }
Channel >> initialize [
	
	listeFonctionObs := OrderedCollection new.
	messages := OrderedCollection new
]

{ #category : #accessing }
Channel >> listeFonctionObs [
	
	^listeFonctionObs
]

{ #category : #accessing }
Channel >> messages [
	^ messages
]

{ #category : #accessing }
Channel >> population [
	^ population
]

{ #category : #accessing }
Channel >> population: anArray [
	
	population := anArray.
	listeFonctionObs do: [:fobs | fobs populationSource: anArray]
]

{ #category : #observer }
Channel >> removeFonctionObs: uneFObs [
	
	listeFonctionObs isEmpty ifFalse: [listeFonctionObs remove: uneFObs]
]

{ #category : #procedures }
Channel >> stock: aMsg [
	"will record the receiving argument which is supposed to be an instance of subclass of Msg in the
messages attribute."
	
	self messages add: aMsg
]

{ #category : #procedures }
Channel >> transmit: aMsg [
	"will immediately deliver the message to the receiver of the message. "
	
	aMsg receiver messageFromChannel: aMsg.
	listeFonctionObs do: [:fobs | fobs message: aMsg]
]
