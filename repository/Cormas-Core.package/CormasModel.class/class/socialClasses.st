managing classes
socialClasses
	" Answer a <Collection> of social classes of the model. Already configured in #initializeWithoutVS "
	" self allClassesInPackage select: [ :e | e inheritsFrom: CMAgent ] "

	^ socialClasses ifNil: [ socialClasses := self allClassesInPackage select: [ :e | e inheritsFrom: CMAgent ] ]