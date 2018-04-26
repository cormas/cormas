actions_menu
renameAttribute
	"Rename the attribute targeted by the selected row, but also the reader and writter acccessors + the default accessor at class level."
	
	| aCAV newName oldName |
	aCAV := self selectedRow value.
	aCAV isNil ifTrue: [^self cormas warn: 'Please, select a row.'].
	oldName := aCAV targetAttribute.
	newName := Cormas current
		request: 'Enter new attribute name'
		initialAnswer: oldName asString.
	newName = '' ifTrue: [^nil].	"Renaming the attribute"
	(aCAV targetClass instVarNames includes: oldName asString)
		ifTrue:
			[Cormas
				renameAttribute: oldName
				to: newName
				inClass: aCAV targetClass]
		ifFalse:
			[aCAV targetClass withAllSuperclasses
				do:
					[:cl | 
					(cl instVarNames includes: oldName asString)
						ifTrue:
							[(self cormas
								confirm:
									'Be careful ! The attribute ''<1s>'' is defined in the super-class <2s>.<n>Cormas will rename this attribute and all its accessors defined in <2s> and its super-classes.'
								with: oldName asString
								with: cl name asString)
								ifFalse: [^nil]
								ifTrue: [Cormas renameAttribute: oldName to: newName inClass: cl]]]].	"Renaming the accessors of the target class and its super classes and sub classes"
	((aCAV targetClass withAllSuperclasses)
		addAll: aCAV targetClass allSubclasses;
		yourself)
		do:
			[:cl | 
			(cl includesSelector: oldName)
				ifTrue:
					[Cormas
						renameSelector: oldName asSymbol
						to: newName asSymbol
						nbArguments: 0
						inClass: cl].
			(cl includesSelector: (oldName , ':') asSymbol)
				ifTrue:
					[Cormas
						renameSelector: (oldName , ':') asSymbol
						to: (newName , ':') asSymbol asSymbol
						nbArguments: 1
						inClass: cl].
			(cl class includesSelector: ('default_' , oldName) asSymbol)
				ifTrue:
					[Cormas
						renameSelector: ('default_' , oldName) asSymbol
						to: ('default_' , newName) asSymbol asSymbol
						nbArguments: 1
						inClass: cl class]].	"Refreshing the list"
	aCAV targetAttribute: newName asSymbol.	"self classAttribValue_List refreshList: self classAttribValue_List listHolder value"
	self classAttribValue_List
		list: self classAttribValue_List listHolder value.
	self superClassAttribValue_List listHolder value
		do:
			[:cav | 
			cav targetAttribute = oldName
				ifTrue: [cav targetAttribute: newName asSymbol]].
	self superClassAttribValue_List
		list: self superClassAttribValue_List listHolder value