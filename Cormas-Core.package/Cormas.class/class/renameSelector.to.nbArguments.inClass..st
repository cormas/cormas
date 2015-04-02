util_codeManagement
renameSelector: oldName to: newName nbArguments: nbArgs inClass: aClass
	"Rename the method of aClass by newName. nbArgs is an integer representing the number of arguments of the method.
	
	oldName = <Symbol>
	newName = <Symbol>
	nbArgs = <Integer (positive)>
	aClass = <Class> (full name of aClass, with its nameSpace)

	Ex: 
		Cormas renameSelector: #updateEnergy to: #consumeEnergy nbArguments: 0 inClass: CormasNS.Models.ECEC.Forager
		Cormas renameSelector: #harvestRate: to: #harvestRateZZ: nbArguments: 1 inClass: CormasNS.Models.ECEC.Forager class"
	
	| map |
	map := (1 to: nbArgs) collect: [:i | i].
	(aClass allSelectors includes: oldName asSymbol)
		ifTrue:
			[Cursor wait
				showWhile:
					[(RenameMethodRefactoring
						renameMethod: oldName asSymbol
						in: aClass
						to: newName asSymbol
						permutation: map) execute]]