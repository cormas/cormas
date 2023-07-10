Class {
	#name : #CMMessageTest,
	#superclass : #TestCase,
	#instVars : [
		'senderAgent',
		'receiverAgent',
		'topic',
		'content'
	],
	#category : #'Cormas-Tests-Communication'
}

{ #category : #initialization }
CMMessageTest >> setUp [

	super setUp.
	
	senderAgent := CMFixtureCommunicatingAgent new.
	receiverAgent := CMFixtureCommunicatingAgent new.
	
	topic := #lipsum.
	content := 'Lorem ipsum dolor sit amet'.
]

{ #category : #tests }
CMMessageTest >> testFrom [

	| message |
	message := CMMessage from: senderAgent.
	self assert: message sender equals: senderAgent
]

{ #category : #tests }
CMMessageTest >> testFromTo [

	| message |
	
	message := CMMessage
		from: senderAgent
		to: receiverAgent.
		
	self assert: message sender equals: senderAgent.
	self assert: message receiver equals: receiverAgent.
]

{ #category : #tests }
CMMessageTest >> testFromToContent [

	| message |
	
	message := CMMessage
		from: senderAgent
		to: receiverAgent
		content: content.
		
	self assert: message sender equals: senderAgent.
	self assert: message receiver equals: receiverAgent.
	self assert: message content equals: content.
]

{ #category : #tests }
CMMessageTest >> testFromToTopic [

	| message |
	
	message := CMMessage
		from: senderAgent
		to: receiverAgent
		topic: topic.
		
	self assert: message sender equals: senderAgent.
	self assert: message receiver equals: receiverAgent.
	self assert: message topic equals: topic.
]

{ #category : #tests }
CMMessageTest >> testFromToTopicContent [

	| message |
	
	message := CMMessage
		from: senderAgent
		to: receiverAgent
		topic: topic
		content: content.
		
	self assert: message sender equals: senderAgent.
	self assert: message receiver equals: receiverAgent.
	self assert: message topic equals: topic.
	self assert: message content equals: content.
]

{ #category : #tests }
CMMessageTest >> testSend [

	| message |
	
	message := CMMessage
		from: senderAgent
		to: receiverAgent
		topic: topic
		content: content.
		
	message send.
	self assert: receiverAgent latestMessage equals: message.
]

{ #category : #tests }
CMMessageTest >> testTo [

	| message |
	message := CMMessage to: receiverAgent.
	self assert: message receiver equals: receiverAgent
]

{ #category : #tests }
CMMessageTest >> testToContent [

	| message |
	
	message := CMMessage
		to: receiverAgent
		content: content.
		
	self assert: message receiver equals: receiverAgent.
	self assert: message content equals: content.
]

{ #category : #tests }
CMMessageTest >> testToTopic [

	| message |
	
	message := CMMessage
		to: receiverAgent
		topic: topic.
	
	self assert: message receiver equals: receiverAgent.
	self assert: message topic equals: topic.
]

{ #category : #tests }
CMMessageTest >> testToTopicContent [

	| message |
	
	message := CMMessage
		to: receiverAgent
		topic: topic
		content: content.
	
	self assert: message receiver equals: receiverAgent.
	self assert: message topic equals: topic.
	self assert: message content equals: content.
]
