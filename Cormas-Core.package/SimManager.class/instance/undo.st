undo/redo
undo
	"reload the last BOS File from the undoList"
	
	| filename |
	self undoList isEmpty ifTrue: [^Dialog warn: 'No available Undo'].
	filename := self undoList last.
	self redoList isEmpty
		ifTrue:
			[self storeBeforeManipulation.
			self redoList add: self undoList last.
			self undoList removeLast].
	self undoList removeLast.
	self redoList add: filename.
	(self cormasModel restoreOrganizationFromFile: filename)
		ifFalse: [undoList := nil]