display
redisplayCompoundSpatialEntity: aCompoundEntityRef withComponents: componentsRef
	"Called when one compound spatial entity is created or when one one compound spatial entity changes its components"
	
	| selectorName aClass |
	aClass := aCompoundEntityRef entityClass.
	selectorName := self povMethodDico
		at: aClass name
		ifAbsent: [#nil].
	(aClass ~= self activeSpatialEntity and: [selectorName ~= #delimitors])
		ifTrue: [^nil].
	self drawing redisplayCompoundSpatialEntity: aCompoundEntityRef
		withComponents: componentsRef