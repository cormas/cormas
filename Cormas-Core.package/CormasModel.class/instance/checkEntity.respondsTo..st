private
checkEntity: anEntity respondsTo: aSymbol
	"check the entity can responds to a message. Alert the user if not"
	
	(anEntity respondsTo: aSymbol) ifTrue: [^self].
	self cormas
		warn: 'The class <1s> does not have a method called <2p>'
		with: anEntity class name
		with: aSymbol.
	self halt