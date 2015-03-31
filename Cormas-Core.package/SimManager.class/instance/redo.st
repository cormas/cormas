undo/redo
redo
	"reload the last redo BOS File from the redoList"
	
	| filename currentFile |
	self redoList size < 2 ifTrue: [^Dialog warn: 'No available Redo'].
	currentFile := self redoList last.
	self redoList removeLast.
	filename := self redoList last.
	(self cormasModel restoreOrganizationFromFile: filename)
		ifTrue: [self undoList add: currentFile]
		ifFalse: [redoList := nil]