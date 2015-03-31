+ initialize-release
reset
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	theCSE := nil.
	includedEntities := nil.
	self initOcc