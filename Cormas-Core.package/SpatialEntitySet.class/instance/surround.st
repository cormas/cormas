+ accessing
surround
	"Returns a collection of cells that surround the aggregate, including the cells located into the aggregate"
	
	^surround ifNil: [surround := self setSurround]