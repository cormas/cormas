initialize-release
newWith: aModel
	
	| a |
	HistogramsInterface allInstances isEmpty
		ifTrue:
			[a := self new.
			a cormasModel: aModel.
			a init.
			a open]