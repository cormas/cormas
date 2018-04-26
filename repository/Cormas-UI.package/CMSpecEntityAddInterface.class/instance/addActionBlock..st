callbacks
addActionBlock: aBlockClosure 
	" Private - Delegate the receiver's action block to its owner "

	self owner addActionBlock: aBlockClosure.