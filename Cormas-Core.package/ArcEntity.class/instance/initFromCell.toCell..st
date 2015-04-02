+ initialize-release
initFromCell: startCell toCell: endCell
	
	| previousNodes initNode endNode |
	previousNodes := startCell occupants: self nodeType name.
	previousNodes isEmpty
		ifTrue: [initNode := self newNode	"initNode isMovedTo: startCell"]
		ifFalse: [initNode := previousNodes first].
	self startNode: initNode.
	previousNodes := endCell occupants: self nodeType name.
	previousNodes isEmpty
		ifTrue: [endNode := self newNode	"endNode isMovedTo: endCell"]
		ifFalse: [endNode := previousNodes first].
	self stopNode: endNode.
	self isMovedFrom: startCell to: endCell