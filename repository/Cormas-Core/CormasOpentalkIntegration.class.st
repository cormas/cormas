Class {
	#name : #CormasOpentalkIntegration,
	#superclass : #Object,
	#classInstVars : [
		'server'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #api }
CormasOpentalkIntegration class >> defaultServerPort [
	
	^4242
]

{ #category : #testing }
CormasOpentalkIntegration class >> isServerOn [
	
	^server isNil not and: [server state = #running]
]

{ #category : #api }
CormasOpentalkIntegration class >> server [
	
	self isServerOn ifFalse: [self startServer].
	^server
]

{ #category : #api }
CormasOpentalkIntegration class >> shareCormas: aCormas [
	"
	CormasNS.Kernel.Cormas allInstances first share
	"
	
	Transcript
		cr;
		show: 'sharing cormas'.
	self server namingService rebind: 'Cormas.current' to: aCormas
]

{ #category : #api }
CormasOpentalkIntegration class >> shareSpaceModel: aSpaceModel [
	"
	CormasNS.Kernel.Cormas allInstances first shareCurrentSpaceModel
	"
	
	Transcript
		cr;
		show: 'sharing spaceModel'.
	self server namingService rebind: 'Cormas.SpaceModel' to: aSpaceModel
]

{ #category : #api }
CormasOpentalkIntegration class >> startServer [
	"start the Opentalk server and share an entry in the naming service"
	"	server := Opentalk.RequestBroker newStstTcpAtPort: 4242."
	
	| ip |
	ip := IPSocketAddress
		hostName: SocketAccessor getHostname
		port: self defaultServerPort.	"POUR SPECIFIER L''IP DU SERVEUR -> hostName: '25.94.252.99'"
	server := RequestBroker newStstTcpAt: ip.
	server start.
	server openSelectors: server openSelectors , #(#namingService).
	server namingService create: 'Cormas'
]

{ #category : #api }
CormasOpentalkIntegration class >> stopServer [
	"stop the Opentalk server
	self stopServer
	"
	
	[server stop] ensure: [server := nil]
]
