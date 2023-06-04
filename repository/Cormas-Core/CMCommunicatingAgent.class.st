"
Please note the following possible problems:
	In the description of ordre, type is not a class name.

Please note the following possible problems:
	The value of the class instance variable ordre is nil, which does not match the declared types >.

Instance Variables:
	patch	<SpatialEntity>  the location of the agent as a reference to a spatial entity. Symetrically, the spatial entity records the agents located there in its ""theOccupants"" attribute, a dictionary of collections of located entities.

Class Instance Variables:
	ordre	<type>  comment

"
Class {
	#name : #CMCommunicatingAgent,
	#superclass : #CMAgent,
	#instVars : [
		'mailBox',
		'channel',
		'agentObs',
		'acquaintances'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #testing }
CMCommunicatingAgent class >> isAgentCommClass [
	
	^ true
]

{ #category : #accessing }
CMCommunicatingAgent >> acquaintances [
	
	^ acquaintances 
		ifNil: [ acquaintances := OrderedCollection new ]
]

{ #category : #accessing }
CMCommunicatingAgent >> acquaintances: x [
	
	acquaintances := x
]

{ #category : #accessing }
CMCommunicatingAgent >> agentObs [
	
	^ agentObs
]

{ #category : #accessing }
CMCommunicatingAgent >> agentObs: unAgent [
	
	agentObs := unAgent
]

{ #category : #accessing }
CMCommunicatingAgent >> channel [
	
	^channel
]

{ #category : #accessing }
CMCommunicatingAgent >> channel: val [
	
	channel := val
]

{ #category : #testing }
CMCommunicatingAgent >> isAgentComm [
	
	^ true
]

{ #category : #accessing }
CMCommunicatingAgent >> latestMessage [
	"Purpose: picks the latest message received in the mailbox, removes it from the mailbox and returns it
	Return value: <Msg>"
	
	| aMsg |
	mailBox isEmpty 
		ifTrue: [ ^ nil ].
	aMsg := mailBox last.
	mailBox removeLast.
	^ aMsg
]

{ #category : #accessing }
CMCommunicatingAgent >> mailBox [
	
	^ mailBox 
		ifNil: [ mailBox := OrderedCollection new ]
]

{ #category : #accessing }
CMCommunicatingAgent >> mailBox: anOrderedCollection [
	
	mailBox := anOrderedCollection
]

{ #category : #utilities }
CMCommunicatingAgent >> messageFromChannel: aMsg [
	"used by channel"
	
	self mailBox addLast: aMsg
]

{ #category : #accessing }
CMCommunicatingAgent >> oldestMessage [
	"Purpose: picks the oldest message still stored in the mailbox, removes it from the mailbox and returns it
Return value: <Msg>"
	
	| aMsg |
	mailBox isEmpty ifTrue: [^nil].
	aMsg := mailBox first.
	mailBox removeFirst.
	^aMsg
]

{ #category : #'initialize - release' }
CMCommunicatingAgent >> reset [
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	self mailBox: OrderedCollection new.
	self acquaintances: Set new
]

{ #category : #'control - communication' }
CMCommunicatingAgent >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic) 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMsg |
	aMsg := CMMessage from: self to: anAgent topic: aSymbol.
	self channel transmit: aMsg
]

{ #category : #'control - communication' }
CMCommunicatingAgent >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic and a content)
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMsg |
	aMsg := CMMessage from: self to: anAgent topic: aSymbol.
	self channel transmit: aMsg
]

{ #category : #'control - communication' }
CMCommunicatingAgent >> sendAsynchronouslyMsgToAll: aCollection topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic)
Arguments: aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	aCollection do: [ : anAgent | 
		| aMsg |
		aMsg := CMMessage from: self to: anAgent topic: aSymbol.
		self channel transmit: aMsg ]
]

{ #category : #'control - communication' }
CMCommunicatingAgent >> sendAsynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic and a content)
Arguments: anAgent = aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	aCollection do: [ : anAgent | 
		| aMsg |
		aMsg := CMMessage from: self to: anAgent topic: aSymbol content: anObject.
		self channel transmit: aMsg ]
]

{ #category : #control }
CMCommunicatingAgent >> sendMessageAsynchronously: aMsg [
	"Purpose: sends and delivers IMMEDIATELY a given message
Argument: aMsg = <Msg>
Example: self sendMessageAsynchronously: (Msg to: self myFriend topic: #hello)"
	
	aMsg sender: self.
	self channel transmit: aMsg
]

{ #category : #control }
CMCommunicatingAgent >> sendMessageSynchronously: aMsg [
	"Purpose: sends and delivers a given message at the end of the simulation timestep 
Argument: aMsg = <Msg>
Example: self sendMessageSynchronously: (Msg to: self myFriend topic  #hello)"
	
	aMsg sender: self.
	self channel stock: aMsg
]

{ #category : #'control - communication' }
CMCommunicatingAgent >> sendSynchronouslyMsgTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers a message (with a topic) at the end of the simulation timestep 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMsg |
	aMsg := CMMessage from: self to: anAgent topic: aSymbol.
	self channel stock: aMsg
]

{ #category : #'control - communication' }
CMCommunicatingAgent >> sendSynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers  a message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMsg |
	aMsg := CMMessage from: self to: anAgent topic: aSymbol.
	self channel stock: aMsg
]

{ #category : #'control - communication' }
CMCommunicatingAgent >> sendSynchronouslyMsgToAll: aCollection topic: aSymbol [
	"Purpose: sends and delivers to many agents a same message (with a topic) at the end of the simulation timestep 
Arguments: aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	aCollection do: [ : anAgent | 
		| aMsg |
		aMsg := CMMessage from: self to: anAgent topic: aSymbol.
		self channel stock: aMsg ]
]

{ #category : #'control - communication' }
CMCommunicatingAgent >> sendSynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers to many agents a same message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	aCollection do: [:anAgent | 
		| aMsg |
		aMsg := CMMessage from: self to: anAgent topic: aSymbol content: anObject.
		self channel stock: aMsg ]
]
