private actions
shouldBeCopiedSource: aFilename
	"indicates if aFilename representing a source file should be copied to the target"
	
	aFilename isNil ifTrue: [^false].
	aFilename extension = '.pst' ifFalse: [^false].
	^true