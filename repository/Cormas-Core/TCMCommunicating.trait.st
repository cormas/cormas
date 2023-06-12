Trait {
	#name : #TCMCommunicating,
	#instVars : [
		'mailBox',
		'channel',
		'agentObs',
		'acquaintances'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #accessing }
TCMCommunicating >> acquaintances [

	^ acquaintances 
		ifNil: [ acquaintances := OrderedCollection new ]
]

{ #category : #accessing }
TCMCommunicating >> acquaintances: anObject [

	acquaintances := anObject
]

{ #category : #accessing }
TCMCommunicating >> agentObs [

	^ agentObs
]

{ #category : #accessing }
TCMCommunicating >> agentObs: anObject [

	agentObs := anObject
]

{ #category : #accessing }
TCMCommunicating >> channel [

	^ channel
]

{ #category : #accessing }
TCMCommunicating >> channel: anObject [

	channel := anObject
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
