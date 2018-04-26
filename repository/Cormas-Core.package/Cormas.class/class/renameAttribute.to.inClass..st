util_codeManagement
renameAttribute: oldName to: newName inClass: aClass
	"Rename the attribute of aClass by newName.
	
	oldName = <Symbol>
	newName = <Symbol>
	aClass = <Class> (full name of aClass, with its nameSpace)

	Ex: 
		Cormas renameAttribute: #energy to: #biomass inClass: CormasNS.Models.ECEC.Forager
		Cormas renameAttribute: #harvestRate: to: #harvestRateZZ: inClass: CormasNS.Models.ECEC.Forager class"
	
	| rb |
	(aClass instVarNames includes: oldName asString)
		ifTrue:
			[Cursor wait
				showWhile:
					[rb := RenameInstanceVariableRefactoring
						rename: oldName asString
						to: newName
						in: aClass.
					rb transform.
					RefactoringManager instance addRefactoring: rb]]