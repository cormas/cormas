model entities
edit: aClass pov: aSymbol
	"Open a RefactoryBrowser on aClass by selecting the method aSymbol"
	
	| listMethods |
	self
		withBrowserDo:
			[:b | 
			| navigator |
			navigator := b navigator.
			navigator
				selectClass: aClass;
				beHierarchy.
			(aClass includesSelector: aSymbol)
				ifTrue: [navigator setSelector: aSymbol]
				ifFalse:
					[listMethods := aClass organization
						listAtCategoryNamed:
							(aSymbol = #init
								ifTrue: [#init]
								ifFalse: [#control]).
					listMethods isEmpty
						ifFalse: [navigator setSelector: listMethods first]].
			navigator changed]