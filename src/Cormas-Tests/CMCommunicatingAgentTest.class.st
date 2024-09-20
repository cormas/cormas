Class {
	#name : 'CMCommunicatingAgentTest',
	#superclass : 'TestCase',
	#instVars : [
		'senderAgent',
		'receiverAgent'
	],
	#category : 'Cormas-Tests-Agents',
	#package : 'Cormas-Tests',
	#tag : 'Agents'
}

{ #category : 'initialization' }
CMCommunicatingAgentTest >> setUp [

	super setUp.
	senderAgent := CMFixtureCommunicatingAgent new.
	receiverAgent := CMFixtureCommunicatingAgent new.
]

{ #category : 'tests' }
CMCommunicatingAgentTest >> testAgentHasChannel [

	self deny: senderAgent channel isNil.
]

{ #category : 'tests' }
CMCommunicatingAgentTest >> testAgentHasMailBox [

	self assert: senderAgent mailBox isCollection.
]

{ #category : 'tests' }
CMCommunicatingAgentTest >> testIsCommunicatingEntity [

	self assert: senderAgent isCommunicatingEntity.
	self assert: receiverAgent isCommunicatingEntity.
]

{ #category : 'tests' }
CMCommunicatingAgentTest >> testLatestMessage [

	| message1 message2 |
	
	message1 := CMMessage
		from: senderAgent
		to: receiverAgent
		content: 'Hello'.
	
	message2 := CMMessage
		from: senderAgent
		to: receiverAgent
		content: 'Hi there!'.
	
	message1 send.
	message2 send.
	
	self assert: receiverAgent latestMessage equals: message2.
	self assert: receiverAgent latestMessage equals: message1.
	self assert: receiverAgent mailBox isEmpty.
]

{ #category : 'tests' }
CMCommunicatingAgentTest >> testNewChannelIsEmpty [

	self assert: senderAgent channel isEmpty.
]

{ #category : 'tests' }
CMCommunicatingAgentTest >> testNewMailBoxIsEmpty [

	self assert: senderAgent mailBox isEmpty.
]
