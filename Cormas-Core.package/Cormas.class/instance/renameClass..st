model entities
renameClass: aClass
	
	| newName oldName |
	oldName := aClass name asString.
	newName := self askUserTheClassNameWithDefaultValue: oldName.
	newName isNil ifTrue: [^nil].
	[aClass renameAndFixSourceTo: newName]
		on: Error
		do:
			[:ex | 
			self warn: ex messageText.
			^self renameClass: aClass].
	^aClass