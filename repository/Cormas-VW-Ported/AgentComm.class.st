"
AgentComm is a class which subclasses will be able to exchange messages. 

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
	#name : #AgentComm,
	#superclass : #CMAgent,
	#instVars : [
		'mailBox',
		'channel',
		'agentObs',
		'acquaintances'
	],
	#category : 'Cormas-VW-Ported'
}

{ #category : #'- testing' }
AgentComm class >> isAgentCommClass [
	
	^true
]

{ #category : #'+ accessing' }
AgentComm >> acquaintances [
	
	^acquaintances ifNil: [acquaintances := OrderedCollection new]
]

{ #category : #'+ accessing' }
AgentComm >> acquaintances: x [
	
	acquaintances := x
]

{ #category : #'- accessing' }
AgentComm >> agentObs [
	
	^agentObs
]

{ #category : #'- accessing' }
AgentComm >> agentObs: unAgent [
	
	agentObs := unAgent
]

{ #category : #'- accessing' }
AgentComm >> channel [
	
	^channel
]

{ #category : #'- accessing' }
AgentComm >> channel: val [
	
	channel := val
]

{ #category : #'+ testing' }
AgentComm >> isAgentComm [
	
	^true
]

{ #category : #'- deprecated' }
AgentComm >> lastMessage [
	"DEPRECATED"
	
	^self latestMessage
]

{ #category : #'+ accessing' }
AgentComm >> latestMessage [
	"Purpose: picks the latest message received in the mailbox, removes it from the mailbox and returns it
Return value: <Msg>"
	
	| aMsg |
	mailBox isEmpty ifTrue: [^nil].
	aMsg := mailBox last.
	mailBox removeLast.
	^aMsg
]

{ #category : #'+ accessing' }
AgentComm >> mailBox [
	
	^mailBox ifNil: [mailBox := OrderedCollection new]
]

{ #category : #'+ accessing' }
AgentComm >> mailBox: anOrderedCollection [
	
	mailBox := anOrderedCollection
]

{ #category : #'- utilities' }
AgentComm >> messageFromChannel: aMsg [
	"used by channel"
	
	self mailBox addLast: aMsg
]

{ #category : #'- deprecated' }
AgentComm >> nextMessage [
	"DEPRECATED"
	
	^self oldestMessage
]

{ #category : #'+ accessing' }
AgentComm >> oldestMessage [
	"Purpose: picks the oldest message still stored in the mailbox, removes it from the mailbox and returns it
Return value: <Msg>"
	
	| aMsg |
	mailBox isEmpty ifTrue: [^nil].
	aMsg := mailBox first.
	mailBox removeFirst.
	^aMsg
]

{ #category : #'+ initialize - release' }
AgentComm >> reset [
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	self mailBox: OrderedCollection new.
	self acquaintances: Set new
]

{ #category : #'+ control - communication' }
AgentComm >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic) 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMsg |
	aMsg := Msg from: self to: anAgent topic: aSymbol.
	self channel transmit: aMsg
]

{ #category : #'+ control - communication' }
AgentComm >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic and a content)
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMsg |
	aMsg := Msg from: self to: anAgent topic: aSymbol.
	self channel transmit: aMsg
]

{ #category : #'+ control - communication' }
AgentComm >> sendAsynchronouslyMsgToAll: aCollection topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic)
Arguments: aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := Msg from: self to: anAgent topic: aSymbol.
			self channel transmit: aMsg]
]

{ #category : #'+ control - communication' }
AgentComm >> sendAsynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic and a content)
Arguments: anAgent = aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := Msg from: self to: anAgent topic: aSymbol content: anObject.
			self channel transmit: aMsg]
]

{ #category : #'+ control' }
AgentComm >> sendMessageAsynchronously: aMsg [
	"Purpose: sends and delivers IMMEDIATELY a given message
Argument: aMsg = <Msg>
Example: self sendMessageAsynchronously: (Msg to: self myFriend topic: #hello)"
	
	aMsg sender: self.
	self channel transmit: aMsg
]

{ #category : #'+ control' }
AgentComm >> sendMessageSynchronously: aMsg [
	"Purpose: sends and delivers a given message at the end of the simulation timestep 
Argument: aMsg = <Msg>
Example: self sendMessageSynchronously: (Msg to: self myFriend topic  #hello)"
	
	aMsg sender: self.
	self channel stock: aMsg
]

{ #category : #'+ control - communication' }
AgentComm >> sendSynchronouslyMsgTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers a message (with a topic) at the end of the simulation timestep 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMsg |
	aMsg := Msg from: self to: anAgent topic: aSymbol.
	self channel stock: aMsg
]

{ #category : #'+ control - communication' }
AgentComm >> sendSynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers  a message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMsg |
	aMsg := Msg from: self to: anAgent topic: aSymbol.
	self channel stock: aMsg
]

{ #category : #'+ control - communication' }
AgentComm >> sendSynchronouslyMsgToAll: aCollection topic: aSymbol [
	"Purpose: sends and delivers to many agents a same message (with a topic) at the end of the simulation timestep 
Arguments: aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := Msg from: self to: anAgent topic: aSymbol.
			self channel stock: aMsg]
]

{ #category : #'+ control - communication' }
AgentComm >> sendSynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers to many agents a same message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	| aMsg |
	aCollection
		do:
			[:anAgent | 
			aMsg := Msg from: self to: anAgent topic: aSymbol content: anObject.
			self channel stock: aMsg]
]
