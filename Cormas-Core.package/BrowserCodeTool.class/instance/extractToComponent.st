refactorings
extractToComponent
	
	self updateRequest ifFalse: [^self].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(ExtractMethodToComponentRefactoring
						extract: (self convertToSourceInterval: self selectedInterval)
						from: self selector
						in: self methodClass))