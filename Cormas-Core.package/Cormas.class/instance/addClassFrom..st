model entities
addClassFrom: aSuperClass
	
	| aName newClass |
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	aName := self askUserTheClassNameWithDefaultValue: aSuperClass name.
	aName isNil ifTrue: [^nil].
	newClass := self createClassNamed: aName from: aSuperClass.
	((self cormasModelClass passiveClasses includes: aSuperClass)
		or: [aSuperClass = PassiveObject or: [aSuperClass = ObjectLocation]])
		ifTrue:
			[self cormasModelClass passiveClasses add: newClass.
			(newClass inheritsFrom: ObjectLocation)
				ifTrue:
					[self createColorsDictClass: newClass.
					self createImageDictClass: newClass.
					self createInit: newClass].
			self listPassiveEntities list add: aName asSymbol.
			self listPassiveEntities selection: aName asSymbol.
			self modifyPassiveEntityClass].
	((self cormasModelClass socialClasses includes: aSuperClass)
		or: [self basicAgentClasses includes: aSuperClass])
		ifTrue:
			[self cormasModelClass socialClasses add: newClass.
			self
				createInit: newClass;
				createStep: newClass.
			self createColorsDictClass: newClass.
			self createImageDictClass: newClass.
			self listSocialEntities list add: aName asSymbol.
			self listSocialEntities selection: aName asSymbol.
			self modifySocialEntityClass].
	self createModelAccessors: newClass.
	(newClass inheritsFrom: Msg)
		ifTrue:
			[self listPassiveEntities list add: aName asSymbol.
			self listPassiveEntities selection: aName asSymbol.
			self cormasModelClass passiveClasses add: newClass.
			self modifyPassiveEntityClass]