version
updateVersion
	"Create the Cormas 'version' method. Example:
version
	^ #(2010 6 24 8 31 54)   
Cormas updateVersion"
	
	self class
		compile: 'version\	^ ' withCRs , self dateAsArray printString
		classified: 'version'
		notifying: nil.
	self updateName.
	self updateComments