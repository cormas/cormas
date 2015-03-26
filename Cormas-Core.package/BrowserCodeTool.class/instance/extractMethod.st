refactorings
extractMethod
	
	self updateRequest ifFalse: [^self].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(ExtractMethodRefactoring
						extract: (self convertToSourceInterval: self selectedInterval)
						from: self selector
						in: self methodClass))