private actions
pstFileFrom: aParcelFilename
	"return the pst file associated to aParcelFilename"
	
	| s |
	s := WriteStream with: aParcelFilename asString.
	s setToEnd.
	s skip: -3.
	s nextPutAll: 'pst'.
	^s contents asFilename