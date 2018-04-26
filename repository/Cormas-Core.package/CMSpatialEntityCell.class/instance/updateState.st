control
updateState
	"Purpose: updates 'state' attribute with the value stored in 'bufferState' attribute"

	self state ~= self bufferState
		ifTrue: [ self state: self bufferState ]