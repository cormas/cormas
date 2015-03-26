accessing
distributionListAsString: aString
	
	aString isNil
		ifTrue:
			[^self cormas warn:
					'UndefinedObject. Please use quote for a string (ex: ''newString'') '].
	(aString = 'nil' or: [aString = '' or: [aString = ' ']])
		ifTrue: [^self distributionList: nil].
	^self distributionList: (self convertStringAsList: aString)