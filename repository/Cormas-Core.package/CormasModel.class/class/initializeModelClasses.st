instance creation
initializeModelClasses
"Distributes and stores the classes of the model in the 3 main archetypes (spatialClasses, socialClasses and passiveClasses)"
	| collec subset |
	collec := self allClassesInPackage copy.
	subset := collec select: [ :e | e inheritsFrom: CMSpatialEntity ].
	self spatialClasses: subset.
	collec removeAll: subset.
	subset := collec select: [ :e | e inheritsFrom: CMAgent ].
	self socialClasses: subset.
	collec removeAll: subset.
	subset := collec select: [ :e | (e inheritsFrom: CMPassiveObject) or:[ e inheritsFrom: CMMsg]].
	self passiveClasses: subset