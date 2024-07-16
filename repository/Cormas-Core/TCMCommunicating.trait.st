Trait {
	#name : #TCMCommunicating,
	#instVars : [
		'mailBox',
		'channel'
	],
	#category : 'Cormas-Core-Entities'
}

{ #category : #accessing }
TCMCommunicating >> channel [

	^ channel
]

{ #category : #accessing }
TCMCommunicating >> channel: anObject [

	channel := anObject
]

{ #category : #initialization }
TCMCommunicating >> initialize [

	super initialize.
	channel := CMChannel new.
	mailBox := OrderedCollection new.
]

{ #category : #testing }
TCMCommunicating >> isCommunicatingEntity [
	
	^ true
]

{ #category : #accessing }
TCMCommunicating >> latestMessage [
	
	| latestMessage |
	self mailBox ifEmpty: [ ^ nil ].
	
	latestMessage := self mailBox last.
	self mailBox removeLast.
	^ latestMessage
]

{ #category : #accessing }
TCMCommunicating >> mailBox [

	^ mailBox
]

{ #category : #accessing }
TCMCommunicating >> mailBox: anObject [

	mailBox := anObject
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

{ #category : #utilities }
TCMCommunicating >> receiveMessage: aMessage [
	
	self mailBox addLast: aMessage
]

{ #category : #'initialize - release' }
TCMCommunicating >> reset [
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	self mailBox: OrderedCollection new.
]

{ #category : #control }
TCMCommunicating >> sendMessageAsynchronously: aMessage [
	"Purpose: sends and delivers IMMEDIATELY a given message"
	
	aMessage sender: self.
	aMessage send.
]

{ #category : #'control - communication' }
TCMCommunicating >> sendMessageAsynchronouslyTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic)"

	self sendMessageAsynchronously: (
		CMMessage
			to: anAgent
			topic: aSymbol)
]

{ #category : #'control - communication' }
TCMCommunicating >> sendMessageAsynchronouslyTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATELY a message (with a topic and a content)"

	self sendMessageAsynchronously: (
		CMMessage
			to: anAgent
			topic: aSymbol
			content: anObject)
]

{ #category : #'control - communication' }
TCMCommunicating >> sendMessageAsynchronouslyToAll: aCollectionOfAgents topic: aSymbol [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic)"
	
	aCollectionOfAgents do: [ :each | 
		self sendMessageAsynchronously: (
			CMMessage
				to: each
				topic: aSymbol) ]
]

{ #category : #'control - communication' }
TCMCommunicating >> sendMessageAsynchronouslyToAll: aCollection topic: aSymbol content: anObject [
	"Purpose: sends and delivers IMMEDIATLY to many agents a same message (with a topic and a content)"
	
	aCollection do: [ :anAgent | 
		self sendMessageAsynchronously: (
			CMMessage
				to: anAgent
				topic: aSymbol
				content: anObject) ]
]

{ #category : #control }
TCMCommunicating >> sendMessageSynchronously: aMessage [
	"Purpose: sends and delivers a given message at the end of the simulation timestep"
	
	aMessage sender: self.
	self channel addMessageToQueue: aMessage
]

{ #category : #'control - communication' }
TCMCommunicating >> sendMessageSynchronouslyTo: anAgent topic: aSymbol [
	"Purpose: sends and delivers a message (with a topic) at the end of the simulation timestep"
	
	self sendMessageSynchronously: (
		CMMessage
			to: anAgent
			topic: aSymbol)
]

{ #category : #'control - communication' }
TCMCommunicating >> sendMessageSynchronouslyTo: anAgent topic: aSymbol content: anObject [
	"Purpose: sends and delivers  a message (with a topic and a content) at the end of the simulation timestep"
	
	self sendMessageSynchronously: (
		CMMessage
			to: anAgent
			topic: aSymbol
			content: anObject)
]

{ #category : #'control - communication' }
TCMCommunicating >> sendMessageSynchronouslyToAll: aCollectionOfAgents topic: aSymbol [
	"Purpose: sends and delivers to many agents a same message (with a topic) at the end of the simulation timestep"
	
	aCollectionOfAgents do: [ :each | 
		self sendMessageSynchronously: (
			CMMessage
				to: each
				topic: aSymbol) ]
]

{ #category : #'control - communication' }
TCMCommunicating >> sendMessageSynchronouslyToAll: aCollectionOfAgents topic: aSymbol content: anObject [
	"Purpose: sends and delivers to many agents a same message (with a topic and a content) at the end of the simulation timestep"
	
	aCollectionOfAgents do: [ :each |
		self sendMessageSynchronously: (
			CMMessage
				to: each
				topic: aSymbol
				content: anObject) ]
]
