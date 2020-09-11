"
CMChannel is the object in charge of receiving the messages from a sender and deliver them to the receivers. They can be delivered synchronously (sent immediately) or asynchronously (they are stored in the messages collection).

Instance Variables:
- observerFunctions	<(Collection of: ObserverFunction)>	In CORMAS there is an interface to observe the exchanges of messages. Instances of object ObserverFunction is in charge of establishing a link between the MChannel and the interface
- messages<(Collection of: (LensAbsentee | Object))>	a collection of messages
- population	<LensAbsentee | Object>	the population of agents registered. Automatically any instance of CMAgentComm, CMGroupComm, CMAgentCommLocation and CMGroupCommLocation is registered.

Methods

- stock: will record the receiving argument which is supposed to be an instance of subclass of CMMsg in the
messages attribute.
- transmit: will immediately deliver the message to the receiver of the message. 
- flush will transmit the set of messages in the message collection to the receivers.
"
Class {
	#name : #CMChannel,
	#superclass : #Object,
	#instVars : [
		'population',
		'messages',
		'observerFunctions'
	],
	#category : #'Cormas-Core-Communication'
}

{ #category : #observer }
CMChannel >> addObserverFunction: anObserverFunction [
	anObserverFunction addCanal: self.
	observerFunctions add: anObserverFunction
]

{ #category : #procedures }
CMChannel >> flush [
	"flush will transmit the set of messages in the message collection to the receivers."
	
	self messages do: [ : a | self transmit: a].
	messages := OrderedCollection new
]

{ #category : #initialization }
CMChannel >> initialize [
	
	observerFunctions := OrderedCollection new.
	messages := OrderedCollection new
]

{ #category : #accessing }
CMChannel >> messages [
	^ messages
]

{ #category : #accessing }
CMChannel >> observerFunctions [
	
	^observerFunctions
]

{ #category : #accessing }
CMChannel >> population [
	^ population
]

{ #category : #accessing }
CMChannel >> population: aCollection [
	population := aCollection.
	observerFunctions do: [ :f | f populationSource: aCollection ]
]

{ #category : #observer }
CMChannel >> removeObserverFunction: anObserverFunction [
	observerFunctions isEmpty
		ifFalse: [ observerFunctions remove: anObserverFunction ]
]

{ #category : #procedures }
CMChannel >> stock: aMsg [
	"will record the receiving argument which is supposed to be an instance of subclass of CMMsg in the messages attribute."

	self messages add: aMsg
]

{ #category : #procedures }
CMChannel >> transmit: aMsg [
	"will immediately deliver the message to the receiver of the message. "
	
	aMsg receiver messageFromChannel: aMsg.
	observerFunctions do: [ : fobs | fobs message: aMsg ]
]
