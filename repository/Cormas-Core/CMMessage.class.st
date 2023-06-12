"
Msg is an Object that will serve for communication. Any agents which needs to send a Msg will create an instance of a subclass of Msg and fulfil it. The message will have at least three attributes listed below. It is up to the modeller to create new instance variables to be used for the exchanges modelled.

Instance Variables:
	receiver	<LensAbsentee | Object>	description of receiver : it is an instance of a class inheriting from AgentComm or AgentCommLocation or GroupComm or GroupCommLocation. It means that the receiver has a mailbox and will be automatically registered by the channel.
	sender	<LensAbsentee | Object>	description of sender. Usually it is the instance of the entity sending the message. But the entity sending the message can leave it blank ( for anonymous message) or even fulfill it with another agent adress. 
	symbol	<Object>					content of the message to be fufilled to give some sense to the conversation. It can be anything. The undelying idea is to use it for meta-information on the conversation (indicating if it is a proposal, an acceptance, a denial, etc.).

Methods :
from: and from: to: are two methods to fulfill the sender and receiver attributes.

methods in the protocol pov are methods which output must be true or false. These pov methods are cretaed through Cormas interface (Model-> Define the observation->Communication). When selected at the interface of the observer it will be applied on each message transmitted by the channle. If the output is true a line betwwen the sender and the receiver will be displayed. By default always and never are proposed. They can be copied at the level of the subclass.

Class methods.

isObserved set the active pov.




"
Class {
	#name : #CMMessage,
	#superclass : #CMObject,
	#instVars : [
		'sender',
		'receiver',
		'topic',
		'content',
		'symbol'
	],
	#classInstVars : [
		'isObserved'
	],
	#category : #'Cormas-Core-Communication'
}

{ #category : #'instance creation' }
CMMessage class >> from: unAgent [
	
	^self new from: unAgent
]

{ #category : #'instance creation' }
CMMessage class >> from: unAgent to: unAutre [
	"Purpose: Creates a message with a sender and a receiver. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: aSymbol = <anObject>
			anObject = <anObject>
Example: Msg topic: #comeHere content: aSpatialEntity)"
	
	^self new from: unAgent to: unAutre
]

{ #category : #communication }
CMMessage class >> from: anAgent to: anotherOne topic: anObject [
	"Purpose: Creates a message with a sender, a receiver and a topic. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			anotherOne = <AgentComm or AgentCommLocation	
			anObject = <anObject>
Example: Msg from: anAgent1 to: anAgent2 topic: #hello)"
	
	^super new from: anAgent to: anotherOne topic: anObject
]

{ #category : #communication }
CMMessage class >> from: anAgent to: anotherOne topic: aSymbol content: anObject [
	"Purpose: Creates a message with a sender, a receiver, a topic and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			anotherOne = <AgentComm or AgentCommLocation	
			aSymbol = <anObject>
			anObject = <anObject>
Example: Msg from: anAgent1 to: anAgent2 topic: #comeHere content: aSpatialEntity)"
	
	^super new from: anAgent to: anotherOne topic: aSymbol content: anObject
]

{ #category : #accessing }
CMMessage class >> isObserved [
	
	^isObserved
]

{ #category : #accessing }
CMMessage class >> isObserved: aSymbol [
	
	isObserved := aSymbol
]

{ #category : #testing }
CMMessage class >> isSituatedClass [
	
	^false
]

{ #category : #'instance creation' }
CMMessage class >> new: x [
	
	^self new
]

{ #category : #printing }
CMMessage class >> printHierarchy [
	"Answer a description containing the names of all of the subclasses and superclasses of the receiver."
	
	| s |
	s := WriteStream on: (String new: 16).
	self printSubclassesOn: s level: 0.
	^s contents
]

{ #category : #activityEditor }
CMMessage class >> superClassesUntil: aSuperClass [
	"Return the super classes of the class sender until aSuperClass"
	
	| coll |
	coll := self withAllSuperclasses
		select: [:aClass | aClass inheritsFrom: aSuperClass].
	coll add: aSuperClass.
	^coll
]

{ #category : #util }
CMMessage class >> superClassesUntilEntity [
	"Return the super classes of the class sender until Msg"

	^ self superClassesUntil: CMMessage
]

{ #category : #communication }
CMMessage class >> to: anotherOne topic: aSymbol [
	"Purpose: Creates a message with a receiver and a topic. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: Msg to: anAgent topic: #hello)"
	
	^super new to: anotherOne topic: aSymbol
]

{ #category : #communication }
CMMessage class >> to: anotherOne topic: aSymbol content: anObject [
	"Purpose: Creates a message with a receiver, a topic and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: Msg to: anAgent topic: #comeHere content: aSpatialEntity)"
	
	^super new to: anotherOne topic: aSymbol content: anObject
]

{ #category : #pov }
CMMessage >> always [
	
	^true
]

{ #category : #accessing }
CMMessage >> content [
	
	^self content
]

{ #category : #accessing }
CMMessage >> content: aValue [
	
	content := aValue
]

{ #category : #private }
CMMessage >> from: anAgent [
	"method to fulfill the sender attribute"
	
	self sender: anAgent
]

{ #category : #private }
CMMessage >> from: anAgent to: anotherOne [
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne
]

{ #category : #private }
CMMessage >> from: anAgent to: anotherOne content: anObject [
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne.
	self content: anObject
]

{ #category : #private }
CMMessage >> from: anAgent to: anotherOne topic: aSymbol [
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne.
	self topic: aSymbol
]

{ #category : #private }
CMMessage >> from: anAgent to: anotherOne topic: aSymbol content: anObject [
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne.
	self topic: aSymbol.
	self content: anObject
]

{ #category : #pov }
CMMessage >> never [
	
	^false
]

{ #category : #accessing }
CMMessage >> receiver [
	^ receiver
]

{ #category : #accessing }
CMMessage >> receiver: aReceiver [
	receiver := aReceiver
]

{ #category : #accessing }
CMMessage >> sender [
	^ sender
]

{ #category : #accessing }
CMMessage >> sender: aSender [
	sender := aSender
]

{ #category : #accessing }
CMMessage >> symbol [
	
	^symbol
]

{ #category : #accessing }
CMMessage >> symbol: aSymbol [
	
	symbol := aSymbol
]

{ #category : #private }
CMMessage >> to: anAgent content: aSymbol [
	"method to fulfill the sender and receiver attributes"
	
	self receiver: anAgent.
	self content: aSymbol
]

{ #category : #private }
CMMessage >> to: anotherOne topic: aSymbol [
	"method to fulfill the sender and receiver attributes"
	
	self receiver: anotherOne.
	self topic: aSymbol
]

{ #category : #private }
CMMessage >> to: anotherOne topic: aSymbol content: anObject [
	"method to fulfill the sender and receiver attributes"
	
	self receiver: anotherOne.
	self topic: aSymbol.
	self content: anObject
]

{ #category : #accessing }
CMMessage >> topic [
	
	^topic
]

{ #category : #accessing }
CMMessage >> topic: anObject [
	
	topic := anObject
]
