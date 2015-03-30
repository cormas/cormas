+ initialize - release
reset
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	self components: Set new.
	self newComponents: Set new.
	self removedComponents: Set new