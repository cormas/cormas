accessing
reduceNbEntitiesToCreateBy: aNumber
	"return a number or nil if nbEntitiesToCreate value is not a number"
	
	| result |
	result := self numberEntitiesToCreate.
	result ifNil: [^nil].
	self nbEntitiesToCreate value: (result - aNumber) asString