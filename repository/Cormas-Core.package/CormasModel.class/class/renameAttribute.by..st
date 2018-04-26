managing classes
renameAttribute: oldName by: newName
	"(ex: theCells by theLandUnits)"
	
	(self instVarNames includes: oldName)
		ifTrue:
			[Cursor wait
				showWhile:
					[(RenameInstanceVariableRefactoring rename: oldName to: newName in: self)
						execute]]