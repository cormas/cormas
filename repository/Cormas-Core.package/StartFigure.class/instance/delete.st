changing
delete
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	self model delete.
	^super delete