control
updateState
	self lostOrReceivedQty ~= 0
		ifTrue: [ self qty: (self qty + self lostOrReceivedQty) asFloat.
			self lostOrReceivedQty: 0.
			self qty < CMDiffuseCell minimunState
				ifTrue: [ self qty: 0 ] ]