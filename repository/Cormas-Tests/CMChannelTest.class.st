Class {
	#name : #CMChannelTest,
	#superclass : #TestCase,
	#instVars : [
		'channel',
		'receiver1',
		'receiver2',
		'receiver3',
		'message1',
		'message2',
		'message3'
	],
	#category : #'Cormas-Tests-Communication'
}

{ #category : #initialization }
CMChannelTest >> setUp [

	| sender1 sender2 |
	super setUp.
	
	channel := CMChannel new.
	
	sender1 := CMFixtureCommunicatingAgent new.
	sender2 := CMFixtureCommunicatingAgent new.
	
	receiver1 := CMFixtureCommunicatingAgent new.
	receiver2 := CMFixtureCommunicatingAgent new.
	receiver3 := CMFixtureCommunicatingAgent new.
	
	message1 := CMMessage from: sender1 to: receiver1.
	message2 := CMMessage from: sender2 to: receiver1.
	message3 := CMMessage from: sender1 to: receiver3.
]

{ #category : #tests }
CMChannelTest >> testAddMessageToQueue [

	channel addMessageToQueue: message1.
	self deny: channel isEmpty.
]

{ #category : #tests }
CMChannelTest >> testIsEmpty [

	self assert: channel isEmpty.
]

{ #category : #tests }
CMChannelTest >> testIsEmptyAfterSendingAllMessages [

	channel
		addMessageToQueue: message1;
		addMessageToQueue: message2;
		addMessageToQueue: message3.
		
	channel sendAllMessages.
	self assert: channel isEmpty.
]

{ #category : #tests }
CMChannelTest >> testSendAllMessages [

	channel
		addMessageToQueue: message1;
		addMessageToQueue: message2;
		addMessageToQueue: message3.
		
	channel sendAllMessages.
	
	self assert: receiver1 mailBox asArray equals: { message1 . message2 }.
	self assert: receiver2 mailBox isEmpty.
	self assert: receiver3 mailBox asArray equals: { message3 }.
]
