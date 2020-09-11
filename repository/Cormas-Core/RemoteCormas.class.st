Class {
	#name : #RemoteCormas,
	#superclass : #Object,
	#instVars : [
		'remoteCormas',
		'openTalkClient',
		'cachedValues',
		'spaceModel'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #'instance creation' }
RemoteCormas class >> current [
	"acces to the single current RemoteCormas  (pattern singleton)
	Conveniently retrieve the already created instance
	"
	
	^current
		ifNil:
			[current := self allInstances isEmpty
				ifTrue: [nil]
				ifFalse: [self allInstances first]]
]

{ #category : #accessing }
RemoteCormas >> cachedValueAt: aSymbol [
	
	^self cachedValues
		at: aSymbol
		ifAbsentPut: [remoteCormas perform: aSymbol]
]

{ #category : #accessing }
RemoteCormas >> cachedValues [
	
	^cachedValues ifNil: [cachedValues := IdentityDictionary new]
]

{ #category : #'error handling' }
RemoteCormas >> doesNotUnderstand: aMessage [
	
	(self remoteSelectors includes: aMessage selector)
		ifTrue:
			[^remoteCormas
				perform: aMessage selector
				withArguments: aMessage arguments].
	self halt: aMessage selector.
	^self
		perform: aMessage selector
		withArguments: aMessage arguments
]

{ #category : #networking }
RemoteCormas >> initClientIPSockectAddress: anIPSocketAddress [
	"start a client on this host at any port communicating with the serveur on anIPSocketAddress"
	
	openTalkClient := RequestBroker
		newStstTcpAt: IPSocketAddress thisHostAnyPort.
	openTalkClient start.
	self resolveIPSocketAddress: anIPSocketAddress
]

{ #category : #networking }
RemoteCormas >> initClientIPSocketAddress: anIPSocketAddress [
	"start a client on this host at any port communicating with the serveur on anIPSocketAddress"
	
	openTalkClient := RequestBroker
		newStstTcpAt: IPSocketAddress thisHostAnyPort.
	openTalkClient start.
	self resolveIPSocketAddress: anIPSocketAddress
]

{ #category : #accessing }
RemoteCormas >> openTalkClient [
	
	^openTalkClient
]

{ #category : #'error handling' }
RemoteCormas >> remoteSelectors [
	
	^#(#currentSimulation)
]

{ #category : #caching }
RemoteCormas >> resetCache [
	
	cachedValues := nil
]

{ #category : #networking }
RemoteCormas >> resolveIPSocketAddress: anIPSocketAddress [
	
	| ns distant |
	distant := openTalkClient activeBrokerAt: anIPSocketAddress.
	ns := distant namingService.
	remoteCormas := ns resolve: 'Cormas.current'
]

{ #category : #networking }
RemoteCormas >> simulationExists [
	
	^remoteCormas currentSimulation isNil not
]

{ #category : #accessing }
RemoteCormas >> spaceModel [
	
	^spaceModel ifNil: [spaceModel := ClientSpaceModel new on: self]
]

{ #category : #networking }
RemoteCormas >> spaceModelExists [
	
	^remoteCormas currentSimulation spaceModel isNil not
]

{ #category : #updating }
RemoteCormas >> update: aSymbol with: aParameter from: aSender [
	
	Transcript
		cr;
		show: 'RemoteCormas Receiveing update: ';
		print: aSymbol
]
