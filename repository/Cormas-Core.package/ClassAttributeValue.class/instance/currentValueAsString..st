access as String
currentValueAsString: anObject
	
	anObject isNil
		ifTrue:
			["text := 'Undefined Object.\\Please use quote for a string (ex: ''Zorba'') \\If ' withCRs asText.
text := text, (self targetAttribute asText emphasizeAllWith: #(#bold #italic #color -> ColorValue red)).
text := text, ' is without default value, write ' asText.
text := text, ('''nil''' asText emphasizeAllWith: #(#bold)).
text := text, ' (with quote). \If ' withCRs.
text := text, (self targetAttribute asText emphasizeAllWith: #(#bold #italic #color -> ColorValue red)).
text := text, ' is a random value, write ' asText.
text := text, ('''random''' asText emphasizeAllWith: #(#bold)).
text := text, ' (with quote).' withCRs.
^Dialog warn: text"
			^nil].
	self hasBeenModified: (currentValue = anObject) not.
	(anObject isString
		and: [(anObject findString: 'random' startingAt: 1) = 1])
		ifTrue:
			[| theClass |
			"test if already defined"
			theClass := targetClass isMeta
				ifTrue: [targetClass instanceBehavior]
				ifFalse: [targetClass].
			(theClass
				hasRandomAttribute: targetAttribute
				classVariable: targetClass isMeta
				value: anObject) ifFalse: [^self chooseRandomness]].
	(anObject isKindOf: Array)
		ifTrue: [^self currentValue: (Array withAll: anObject)].
	anObject = 'nil' ifTrue: [^self currentValue: nil].
	^self currentValue: anObject