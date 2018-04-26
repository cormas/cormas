probes
changedMethodFrom: oldMethod to: newMethod by: aBrowser
	"This message notifies the receiver that the method text for
	aSelector has changed and should be updated."
	
	| widget |
	builder isNil ifTrue: [^self].
	widget := builder componentAt: #textEditor.
	widget isNil ifTrue: [^self].
	widget isOpen ifFalse: [^self].
	(newMethod selector == self selector
		and: [newMethod mclass == self methodClass]) ifFalse: [^self].
	(aBrowser ~~ self and: [self isEditing])
		ifTrue: [self textNoChange: self text allItalic]
		ifFalse: [self updateContents]