debuging
checkClassAndMethodsExist
	
	self checkHabitusList: #observedEntitiesList existsIn: #entitiesList
		dialogConfirmTypeName: 'observed entities'.
	self checkHabitusList: #manipEntitiesList existsIn: #entitiesList
		dialogConfirmTypeName: 'manipulated entities'.
	self checkHabitusList: #createEntitiesList existsIn: #entitiesList
		dialogConfirmTypeName: 'created entities'.
	self checkMethods: #povMethods exists_dialogConfirmTypeName: 'pov methods'.
	self checkMethods: #manipMethods exists_dialogConfirmTypeName:
			'manip methods'.
	self checkMethods: #attributes exists_dialogConfirmTypeName: 'attributes'.
	self checkMethods: #infoMethods exists_dialogConfirmTypeName:
			'info methods'.
	self checkMethods: #probeMethods exists_dialogConfirmTypeName: 'probes'.
	self checkDefaultValue: #defaultPov exists_dialogConfirmTypeName:
			'default pov'.
	self checkDefaultValue: #defaultInfo exists_dialogConfirmTypeName:
			'default info'