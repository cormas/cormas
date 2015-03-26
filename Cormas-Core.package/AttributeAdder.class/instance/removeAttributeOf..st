actions_menu
removeAttributeOf: aCAV
	"Remove the attribute targeted by aCAV, but also the reader & writter acccessors and the default accessor at class level.
	aCAV =<ClassAttributeValue>"
	
	(self cormas
		confirm:
			'Do you really want to remove the attribute ''<1s> '' and its accessors?'
		with: aCAV targetAttribute asString) ifFalse: [^nil].
	aCAV valueType = Random ifTrue: [aCAV removeRandomAttribute].
	(aCAV targetClass instVarNames includes: aCAV targetAttribute asString)
		ifTrue:
			[aCAV targetClass removeInstVarName: aCAV targetAttribute asString]
		ifFalse:
			[aCAV targetClass withAllSuperclasses
				do:
					[:cl | 
					(cl instVarNames includes: aCAV targetAttribute asString)
						ifTrue:
							[self cormas
								warn:
									'Be careful ! The attribute ''<1s>'' is defined in the super class <2s>.<n>Cormas will just only remove the getter accessor (with its default value) defined at <3s> level.'
								with: aCAV targetAttribute asString
								with: cl name
								with: aCAV targetClass name]]].
	self
		removeSelector: aCAV targetAttribute
		from: aCAV targetClass.
	self
		removeSelector: (aCAV targetAttribute , '_default') asSymbol
		from: aCAV targetClass class.
	self
		removeSelector: (aCAV targetAttribute , '_default') asSymbol
		from: aCAV targetClass.
	self
		removeSelector: (aCAV targetAttribute , ':') asSymbol
		from: aCAV targetClass.
	self classAttribValue_List listHolder value remove: aCAV