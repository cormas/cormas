refactorings
preloadSourceTree: aRefactoring
	"Some refactorings which take source intervals may be sensitive to the fact the source in the browser is not the same format as found in the method. When such is the case, we preload the sourceTree into the refactoring, otherwise let the refactorings fetch it at will."
	
	BrowseAutoFormat == true
		ifTrue: [aRefactoring sourceTree: (self parseSource: self text asString)].
	^aRefactoring