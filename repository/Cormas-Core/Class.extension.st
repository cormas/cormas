Extension { #name : 'Class' }

{ #category : '*Cormas-Core' }
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

{ #category : '*Cormas-Core' }
Class >> concreteSubclasses [

	^ self allSubclasses select: [ : cls | cls subclasses isEmpty ]

]

{ #category : '*Cormas-Core' }
Class >> ifTerminal: aBlock [
	" Perform aBlock if the receiver is a terminal (or concrete) class (has no subclasses) "
	
	^ self isTerminal ifTrue: aBlock
	
]

{ #category : '*Cormas-Core' }
Class >> isTerminal [
	" Answer <true> if the receiver is a terminal (or concrete) class (has no subclasses)

	Object isTerminal.
	SystemOrganizer isTerminal.
	"
	
	^ self hasSubclasses not
	
]
