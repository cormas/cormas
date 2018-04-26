autocomplete extension
wordCompletionSearchFor: aParagraphEditor
	
	| composite |
	composite := CompositeWordSearch new.
	composite addSearch: (ParagraphSearch for: aParagraphEditor text asString).
	(self instVarSearchFor: aParagraphEditor)
		ifNotNil: [:search | composite addSearch: search].
	composite
		addSearch:
			((self knownReceiverSearchFor: aParagraphEditor)
				ifNil: [SymbolTableSearch new]).
	^composite