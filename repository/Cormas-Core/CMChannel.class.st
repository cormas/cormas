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
	#name : 'CMChannel',
	#superclass : 'Object',
	#instVars : [
		'messages'
	],
	#category : 'Cormas-Core-Communication',
	#package : 'Cormas-Core',
	#tag : 'Communication'
}

{ #category : 'adding' }
CMChannel >> addMessageToQueue: aMessage [

	messages add: aMessage
]

{ #category : 'initialization' }
CMChannel >> initialize [
	
	super initialize.
	messages := OrderedCollection new
]

{ #category : 'testing' }
CMChannel >> isEmpty [

	^ messages isEmpty
]

{ #category : 'sending' }
CMChannel >> sendAllMessages [
	
	messages do: [ :each | each send ].
	messages removeAll.
]
