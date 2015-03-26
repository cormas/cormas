managing classes
renameSelector: oldName by: newName inputParametersNumber: nbArgs
	"ex: theCells by theLandUnits or 
	theCells:xx by theLandUnits:xx"
	
	| map |
	map := (1 to: nbArgs) collect: [:i | i].
	(self allSelectors includes: oldName asSymbol)
		ifTrue:
			[Cursor wait
				showWhile:
					[(RenameMethodRefactoring
						renameMethod: oldName asSymbol
						in: self
						to: newName asSymbol
						permutation: map) execute]]