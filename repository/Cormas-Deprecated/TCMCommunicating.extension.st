Extension { #name : #TCMCommunicating }

{ #category : #'*Cormas-Deprecated' }
TCMCommunicating >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol [
	"This method was renamed to sendMessageAsynchronouslyTo:topic:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #sendMessageAsynchronouslyTo:topic: instead'.
	self sendMessageAsynchronouslyTo: anAgent topic: aSymbol.
]

{ #category : #'*Cormas-Deprecated' }
TCMCommunicating >> sendAsynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"This method was renamed to sendMessageAsynchronouslyTo:topic:content:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #sendMessageAsynchronouslyTo:topic:content: instead'.
	self sendMessageAsynchronouslyTo: anAgent topic: aSymbol content: anObject.
]

{ #category : #'*Cormas-Deprecated' }
TCMCommunicating >> sendAsynchronouslyMsgToAll: aCollectionOfAgents topic: aSymbol [
	"This method was renamed to sendMessageAsynchronouslyToAll:topic:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #sendMessageAsynchronouslyToAll:topic: instead'.
	self sendMessageAsynchronouslyToAll: aCollectionOfAgents topic: aSymbol.
]

{ #category : #'*Cormas-Deprecated' }
TCMCommunicating >> sendAsynchronouslyMsgToAll: aCollectionOfAgents topic: aSymbol content: anObject [
	"This method was renamed to sendMessageAsynchronouslyToAll:topic:content:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #sendMessageAsynchronouslyToAll:topic:content: instead'.
	self sendMessageAsynchronouslyToAll: aCollectionOfAgents topic: aSymbol content: anObject.
]

{ #category : #'*Cormas-Deprecated' }
TCMCommunicating >> sendSynchronouslyMsgTo: anAgent topic: aSymbol [
	"This method was renamed to sendMessageSynchronouslyTo:topic:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #sendMessageSynchronouslyTo:topic: instead'.
	self sendMessageSynchronouslyTo: anAgent topic: aSymbol.
]

{ #category : #'*Cormas-Deprecated' }
TCMCommunicating >> sendSynchronouslyMsgTo: anAgent topic: aSymbol content: anObject [
	"This method was renamed to sendMessageSynchronouslyTo:topic:content:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #sendMessageSynchronouslyTo:topic:content: instead'.
	self sendMessageSynchronouslyTo: anAgent topic: aSymbol content: anObject.
]

{ #category : #'*Cormas-Deprecated' }
TCMCommunicating >> sendSynchronouslyMsgToAll: aCollectionOfAgents topic: aSymbol [
	"This method was renamed to sendMessageSynchronouslyToAll:topic:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #sendMessageSynchronouslyToAll:topic: instead'.
	self sendMessageSynchronouslyToAll: aCollectionOfAgents topic: aSymbol.
]

{ #category : #'*Cormas-Deprecated' }
TCMCommunicating >> sendSynchronouslyMsgToAll: aCollectionOfAgents topic: aSymbol content: anObject [
	"This method was renamed to sendMessageSynchronouslyToAll:topic:content:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #sendMessageSynchronouslyToAll:topic:content: instead'.
	self sendMessageSynchronouslyToAll: aCollectionOfAgents topic: aSymbol content: anObject.
]
