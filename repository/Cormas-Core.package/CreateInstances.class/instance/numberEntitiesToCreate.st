accessing
numberEntitiesToCreate
	"return a number or nil if nbEntitiesToCreate value is not a number"
	
	| result |
	result := self nbEntitiesToCreate value asNumber.
	result = 0
		ifTrue:
			[self nbEntitiesToCreate value string = '0' ifFalse: [result := nil]].
	^result