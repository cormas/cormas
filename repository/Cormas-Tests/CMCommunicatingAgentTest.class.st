Class {
	#name : #CMCommunicatingAgentTest,
	#superclass : #TestCase,
	#instVars : [
		'senderAgent',
		'receiverAgent'
	],
	#category : #'Cormas-Tests-Agents'
}

{ #category : #initialization }
CMCommunicatingAgentTest >> setUp [

	super setUp.
	senderAgent := CMFixtureCommunicatingAgent new.
	receiverAgent := CMFixtureCommunicatingAgent new.
]

{ #category : #tests }
CMCommunicatingAgentTest >> testAgentHasChannel [

	self deny: senderAgent channel isNil.
]

{ #category : #tests }
CMCommunicatingAgentTest >> testAgentHasMailBox [

	self assert: senderAgent mailBox isCollection.
]

{ #category : #tests }
CMCommunicatingAgentTest >> testNewChannelIsEmpty [

	self assert: senderAgent channel isEmpty.
]

{ #category : #tests }
CMCommunicatingAgentTest >> testNewMailBoxIsEmpty [

	self assert: senderAgent mailBox isEmpty.
]
