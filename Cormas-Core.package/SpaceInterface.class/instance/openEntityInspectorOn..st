manipulate instances
openEntityInspectorOn: anEntity
	
	| result |
	result := self openedEntityInspectors_IsTheOnlyOne.
	result value
		ifTrue:
			["the entity inspector is set to be the only one"
			result key first goToEntity: (EntityReference on: anEntity)]
		ifFalse:
			["there are multiple entity inspectors possible. It should now open one more"
			EntityInspector
				inspect: (EntityReference on: anEntity)
				spaceInterface: self]	"self siConfig
		ifNil: [CormasNS.Kernel.BasicEntityInspector openOn: anEntity]
		ifNotNil:
			[CormasNS.Kernel.BasicEntityInspector
				openOn: anEntity
				attributesSpec: self siConfig attributes]"