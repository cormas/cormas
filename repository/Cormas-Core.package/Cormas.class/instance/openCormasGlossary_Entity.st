main menu
openCormasGlossary_Entity
	
	| entityClasses |
	entityClasses := ('Cormas-Core' asPackage classTagNamed: 'Entities') classes.
	entityClasses remove: Entity.
	entityClasses addFirst: Entity.
	entityClasses
		remove: CMGroupComm;
		remove: CMAgentCommLocation;
		remove: CMGroupCommLocation;
		remove: CMGroupLocation.
	^self openCormasGlossaryClasses: entityClasses