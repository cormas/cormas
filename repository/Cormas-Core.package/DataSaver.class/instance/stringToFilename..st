private
stringToFilename: aStringOrFilename
	"Returns a Filename from (aStringOrFilename) located into the current model 'data' 
	directory "
	
	self directory isNil
		ifTrue: [^self cormasModel stringToFilename: aStringOrFilename]
		ifFalse: [^self directory construct: aStringOrFilename]