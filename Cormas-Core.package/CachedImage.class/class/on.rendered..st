instance creation
on: anImage rendered: message
	"Answer a new instance of the receiver on anImage."
	
	^(self new)
		setImage: anImage;
		conversionMessage: message