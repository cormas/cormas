"
Represents a client connected to a DistributionControl.

Instance Variables:
	habitusNames	<Collection of: String>	the habitus names played by this client
	distributionControl	<DistributionControl>	the distributionControl registered as a client (a RemoteObject)
	broker	<RequestBroker>	the client's broker (a RemoteObject)



"
Class {
	#name : #DistributedClient,
	#superclass : #Object,
	#instVars : [
		'habitusNames',
		'distributionControl',
		'hostName',
		'port'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #'instance creation' }
DistributedClient class >> new [
	
	^super new initialize
]

{ #category : #'instance creation' }
DistributedClient class >> on: aDistributionControl [
	
	^(self new)
		distributionControl: aDistributionControl;
		hostName: aDistributionControl broker accessPoint hostName;
		port: aDistributionControl broker accessPoint port;
		habitusNames: aDistributionControl habitusNames selections asArray;
		yourself
]

{ #category : #comparing }
DistributedClient >> = aDistributedObject [
	
	^aDistributedObject hostName = hostName
		and: [aDistributedObject port = port]
]

{ #category : #accessing }
DistributedClient >> distributionControl [
	
	^distributionControl
]

{ #category : #accessing }
DistributedClient >> distributionControl: aDistributionControl [
	
	distributionControl := aDistributionControl
]

{ #category : #accessing }
DistributedClient >> habitusNames [
	
	^habitusNames
]

{ #category : #accessing }
DistributedClient >> habitusNames: anObject [
	
	habitusNames := anObject
]

{ #category : #accessing }
DistributedClient >> hostName [
	
	^hostName
]

{ #category : #accessing }
DistributedClient >> hostName: anObject [
	
	hostName := anObject
]

{ #category : #'initialize-release' }
DistributedClient >> initialize [
	
	
]

{ #category : #accessing }
DistributedClient >> port [
	
	^port
]

{ #category : #accessing }
DistributedClient >> port: anObject [
	
	port := anObject
]

{ #category : #printing }
DistributedClient >> printOn: aStream [
	
	aStream
		nextPutAll: hostName;
		nextPut: $:;
		print: port;
		nextPutAll: ' - '.
	self habitusNames isEmpty
		ifTrue: [aStream nextPutAll: 'no habitus']
		ifFalse:
			[self habitusNames
				do: [:each | aStream nextPutAll: each]
				separatedBy: [aStream nextPut: $,]]
]
