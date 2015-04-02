main menu
openCormasGlossary_Entity
	
	| entityClasses |
	entityClasses := Cormas allClassesInCategory: #'CormasKernel-Entities'
		fromNameSpace: Kernel.
	entityClasses remove: Entity.
	entityClasses addFirst: Entity.
	entityClasses
		remove: GroupComm;
		remove: AgentCommLocation;
		remove: GroupCommLocation;
		remove: GroupLocation.
	^self openCormasGlossaryClasses: entityClasses