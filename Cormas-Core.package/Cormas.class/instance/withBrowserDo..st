model entities
withBrowserDo: aBlock
	"Evaluate a block with a browser in parameter"
	
	RefactoringBrowser
		ifDefinedDo:
			[:browserClass | 
			self useOnlyOneRB
				ifTrue: [self checkBrowserNotEditing ifFalse: [^nil]]
				ifFalse: [browser := browserClass open].
			aBlock value: browser]
		elseDo: [self alert: 'There is no browser in this image!']