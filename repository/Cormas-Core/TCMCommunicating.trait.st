Trait {
	#name : #TCMCommunicating,
	#instVars : [
		'mailBox',
		'channel'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #accessing }
TCMCommunicating >> channel [

	^ channel
]

{ #category : #accessing }
TCMCommunicating >> channel: anObject [

	channel := anObject
]

{ #category : #testing }
TCMCommunicating >> isCommunicatingEntity [
	
	^ true
]

{ #category : #accessing }
TCMCommunicating >> latestMessage [
	"Purpose: picks the latest message received in the mailbox, removes it from the mailbox and returns it
	Return value: <Msg>"
	
	| latestMessage |
	self mailBox ifEmpty: [ ^ nil ].
	
	latestMessage := self mailBox last.
	self mailBox removeLast.
	^ latestMessage
]

{ #category : #accessing }
TCMCommunicating >> mailBox [

	^ mailBox 
		ifNil: [ mailBox := OrderedCollection new ]
]

{ #category : #accessing }
TCMCommunicating >> mailBox: anObject [

	mailBox := anObject
]

{ #category : #utilities }
TCMCommunicating >> messageFromChannel: aMsg [
	"used by channel"
	
	self mailBox addLast: aMsg
]

{ #category : #accessing }
TCMCommunicating >> oldestMessage [
	"Purpose: picks the oldest message still stored in the mailbox, removes it from the mailbox and returns it
Return value: <Msg>"
	
	| oldestMessage |
	self mailBox ifEmpty: [ ^ nil ].
	
	oldestMessage := self mailBox first.
	self mailBox removeFirst.
	
	^ oldestMessage
]

{ #category : #'initialize - release' }
TCMCommunicating >> reset [
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	self mailBox: OrderedCollection new.
]

{ #category : #'control - communication' }
TCMCommunicating >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic) 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMessage |
	aMessage := CMMessage from: self to: anAgent topic: aSymbol.
	self channel transmit: aMessage
]

{ #category : #'control - communication' }
TCMCommunicating >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic and a content)
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMessage |
	aMessage := CMMessage from: self to: anAgent topic: aSymbol.
	self channel transmit: aMessage
]

{ #category : #'control - communication' }
TCMCommunicating >> sendAsynchronouslyMsgToAll: aCollection topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic)
Arguments: aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	| aMessage |
	
	aCollection do: [ :anAgent | 
		aMessage := CMMessage from: self to: anAgent topic: aSymbol.
		self channel transmit: aMessage ]
]

{ #category : #'control - communication' }
TCMCommunicating >> sendAsynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic and a content)
Arguments: anAgent = aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendAsynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	| aMessage |
	
	aCollection do: [ :anAgent | 
		aMessage := CMMessage from: self to: anAgent topic: aSymbol content: anObject.
		self channel transmit: aMessage ]
]

{ #category : #control }
TCMCommunicating >> sendMessageAsynchronously: aMessage [
	"Purpose: sends and delivers IMMEDIATELY a given message
Argument: amessage = <CMMessage>
Example: self sendMessageAsynchronously: (Msg to: self myFriend topic: #hello)"
	
	aMessage sender: self.
	self channel transmit: aMessage
]

{ #category : #control }
TCMCommunicating >> sendMessageSynchronously: aMessage [
	"Purpose: sends and delivers a given message at the end of the simulation timestep 
Argument: aMessage = <CMMessage>
Example: self sendMessageSynchronously: (CMMessage to: self myFriend topic  #hello)"
	
	aMessage sender: self.
	self channel stock: aMessage
]

{ #category : #'control - communication' }
TCMCommunicating >> sendSynchronouslyMsgTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers a message (with a topic) at the end of the simulation timestep 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #hello)"
	
	| aMessage |
	aMessage := CMMessage from: self to: anAgent topic: aSymbol.
	self channel stock: aMessage
]

{ #category : #'control - communication' }
TCMCommunicating >> sendSynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers  a message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgTo: self myFriend topic  #wantToBuy content: aLand )"
	
	| aMessage |
	aMessage := CMMessage from: self to: anAgent topic: aSymbol.
	self channel stock: aMessage
]

{ #category : #'control - communication' }
TCMCommunicating >> sendSynchronouslyMsgToAll: aCollection topic: aSymbol [
	"Purpose: sends and delivers to many agents a same message (with a topic) at the end of the simulation timestep 
Arguments: aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances  topic  #hello)"
	
	| aMessage |
	
	aCollection do: [ :anAgent | 
		aMessage := CMMessage from: self to: anAgent topic: aSymbol.
		self channel stock: aMessage ]
]

{ #category : #'control - communication' }
TCMCommunicating >> sendSynchronouslyMsgToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers to many agents a same message (with a topic and a content) at the end of the simulation timestep 
Arguments: anAgent = aCollection =  <a collection of AgentComm or AgentCommLocation>
			aSymbol = <anObject>
			anObject = <anObject>
Example: self sendSynchronouslyMsgToAll: self acquaintances topic  #fireHere content: aCell )"
	
	| aMessage |
	
	aCollection do: [ :anAgent |
		aMessage := CMMessage from: self to: anAgent topic: aSymbol content: anObject.
		self channel stock: aMessage ]
]
