testing
isForHabitus: aString
	"true if the receiver has a SIConfig with name aString"
	
	^self siConfig
		ifNil: [false]
		ifNotNil: [:si | si configName value = aString]