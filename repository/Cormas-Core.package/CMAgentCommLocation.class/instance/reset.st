+ initialize - release
reset
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	self mailBox: OrderedCollection new.
	self acquaintances: Set new