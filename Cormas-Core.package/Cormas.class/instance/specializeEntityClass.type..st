model entities
specializeEntityClass: superClass type: aType
	
	self
		addNewClassType: aType
		inheritingFrom: superClass
		name: (self askUserTheClassNameWithDefaultValue: superClass name)
		initProtocol: false
		stepProtocol: false