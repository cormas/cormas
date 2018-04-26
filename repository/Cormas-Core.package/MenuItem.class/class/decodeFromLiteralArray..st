private
decodeFromLiteralArray: anArray
	"Answer a new instance of the receiver decoded from the given literal array."
	
	^self basicNew enable fromLiteralArrayEncoding: anArray