Extension { #name : #Class }

{ #category : #'*Cormas-Core' }
Class >> chunkOut [
	"Create a file whose name is the name of the receiver with '.st' as the 
	extension, and file a description of the receiver onto it."
	
	| internalStream |
	
	internalStream := GRPlatform current readWriteCharacterStream.
	internalStream header; timeStamp.

	self hasSharedPools ifTrue: [
		self shouldFileOutPools
			ifTrue: [self fileOutSharedPoolsOn: internalStream]].
	self fileOutOn: internalStream.
	^ internalStream reset
]
