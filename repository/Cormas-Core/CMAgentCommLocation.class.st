"
AgentCommLocation is a class which subclass instances need to have the functionalities of AgentComm and AgentLocation

Instance Variables:
	acquaintances	<IndexedSet>	is a set of other communicating entities to communicate with.
	agentObs	<AgentObs>	is an instance of the interface agent (on the observer)
	channel	<Channel>	is used to receive, store and deliver messages processed by communication agents
	mailBox	<OrderedCollection>	an orderedCollection to store the received messages.

Methods

messageFromChannel: will receive as argument an instance of a subclass of Msg. It will be stored in the mailBox at last position.
nextMessage returns the first message in the mailBox and remove it from the mailBox.
sendMessage Synchronously: will ask the channel to store the message. It will be delivered at the end of the current time step.
sendmessageSynchrounously: will ask the channel to deliver the message immediately.


"
Class {
	#name : #CMAgentCommLocation,
	#superclass : #CMAgentLocation,
	#instVars : [
		'mailBox',
		'channel',
		'agentObs',
		'acquaintances'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #testing }
CMAgentCommLocation class >> isAgentCommClass [
	
	^true
]

{ #category : #accessing }
CMAgentCommLocation >> acquaintances [
	
	^acquaintances ifNil: [acquaintances := OrderedCollection new]
]

{ #category : #accessing }
CMAgentCommLocation >> acquaintances: x [
	
	acquaintances := x
]

{ #category : #accessing }
CMAgentCommLocation >> agentObs [
	
	^agentObs
]

{ #category : #accessing }
CMAgentCommLocation >> agentObs: unAgent [
	
	agentObs := unAgent
]

{ #category : #accessing }
CMAgentCommLocation >> channel [
	
	^channel
]

{ #category : #accessing }
CMAgentCommLocation >> channel: val [
	
	channel := val
]

{ #category : #testing }
CMAgentCommLocation >> isAgentComm [
	
	^true
]

{ #category : #deprecated }
CMAgentCommLocation >> lastMessage [
	"DEPRECATED"
	
	^self latestMessage
]

{ #category : #accessing }
CMAgentCommLocation >> latestMessage [
	"Purpose: picks the latest message received in the mailbox, removes it from the mailbox and returns it
Return value: <Msg>"
	
	| aMsg |
	self mailBox isEmpty ifTrue: [^nil].
	aMsg := mailBox last.
	mailBox removeLast.
	^aMsg
]

{ #category : #accessing }
CMAgentCommLocation >> mailBox [
	
	^mailBox ifNil: [mailBox := OrderedCollection new]
]

{ #category : #accessing }
CMAgentCommLocation >> mailBox: x [
	
	mailBox := x
]

{ #category : #utilities }
CMAgentCommLocation >> messageFromChannel: unMsg [
	"used by channel"
	
	self mailBox addLast: unMsg
]

{ #category : #deprecated }
CMAgentCommLocation >> nextMessage [
	"DEPRECATED"
	
	^self oldestMessage
]

{ #category : #accessing }
CMAgentCommLocation >> oldestMessage [
	"Purpose: picks the oldest message still stored in the mailbox, removes it from the mailbox and returns it
Return value: <Msg>"
	
	| aMsg |
	self mailBox isEmpty ifTrue: [^nil].
	aMsg := mailBox first.
	mailBox removeFirst.
	^aMsg
]

{ #category : #'initialize - release' }
CMAgentCommLocation >> reset [
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	self mailBox: OrderedCollection new.
	self acquaintances: Set new
]

{ #category : #'control - communication' }
CMAgentCommLocation >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic) 
Arguments: anAgent = <AgentCommLocation or AgentCommLocationLocation
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMsg |
	aMsg := CMMsg from: self to: anAgent topic: aSymbol.
	self channel transmit: aMsg
]

{ #category : #'control - communication' }
CMAgentCommLocation >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic and a content)
Arguments: anAgent = <AgentCommLocation or AgentCommLocationLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMsg |
	aMsg := CMMsg from: self to: anAgent topic: aSymbol.
	self channel transmit: aMsg
]

{ #category : #'control - communication' }
CMAgentCommLocation >> sendAsynchronouslyMsgToAll: aCollection topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic)
Arguments: aCollection =  <a collection of AgentCommLocation or AgentCommLocationLocation>
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	aCollection do: [ : anAgent | 
		| aMsg |
		aMsg := CMMsg from: self to: anAgent topic: aSymbol.
		self channel transmit: aMsg ]
]

{ #category : #'control - communication' }
CMAgentCommLocation >> sendAsynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic and a content)
Arguments: anAgent = aCollection =  <a collection of AgentCommLocation or AgentCommLocationLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := CMMsg from: self to: anAgent topic: aSymbol content: anObject.
			self channel transmit: aMsg]
]

{ #category : #control }
CMAgentCommLocation >> sendMessageAsynchronously: aMsg [
	"Purpose: sends and delivers IMMEDIATELY a given message
Argument: aMsg = <Msg>
Example: self sendMessageAsynchronously: (Msg to: self myFriend topic: #hello)"
	
	aMsg sender: self.
	self channel transmit: aMsg
]

{ #category : #control }
CMAgentCommLocation >> sendMessageSynchronously: aMsg [
	"Purpose: sends and delivers a given message at the end of the simulation timestep 
Argument: aMsg = <Msg>
Example: self sendMessageSynchronously: (Msg to: self myFriend topic  #hello)"
	
	aMsg sender: self.
	self channel stock: aMsg
]

{ #category : #'control - communication' }
CMAgentCommLocation >> sendSynchronouslyMsgTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers a message (with a topic) at the end of the simulation timestep 
Arguments: anAgent = <AgentCommLocation or AgentCommLocationLocation
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMsg |
	aMsg := CMMsg from: self to: anAgent topic: aSymbol.
	self channel stock: aMsg
]

{ #category : #'control - communication' }
CMAgentCommLocation >> sendSynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers  a message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = <AgentCommLocation or AgentCommLocationLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMsg |
	aMsg := CMMsg from: self to: anAgent topic: aSymbol.
	self channel stock: aMsg
]

{ #category : #'control - communication' }
CMAgentCommLocation >> sendSynchronouslyMsgToAll: aCollection topic: aSymbol [
	"Purpose: sends and delivers to many agents a same message (with a topic) at the end of the simulation timestep 
Arguments: aCollection =  <a collection of AgentCommLocation or AgentCommLocationLocation>
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := CMMsg from: self to: anAgent topic: aSymbol.
			self channel stock: aMsg]
]

{ #category : #'control - communication' }
CMAgentCommLocation >> sendSynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers to many agents a same message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = aCollection =  <a collection of AgentCommLocation or AgentCommLocationLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := CMMsg from: self to: anAgent topic: aSymbol content: anObject.
			self channel stock: aMsg]
]
