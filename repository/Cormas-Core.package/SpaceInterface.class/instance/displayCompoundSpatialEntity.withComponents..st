display
displayCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef
	"Called when one compound spatial entity is created or when one one compound spatial entity changes its components"
	
	| aClass selectorName infoName |
	aClass := aCompoundEntityRef entityClass.
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	infoName := self infoMethodDicoAt: aClass.
	self drawing loadFigureCompoundSpatialEntity: aCompoundEntityRef
		withComponents: componentsRef povSelector: selectorName andInfo: infoName