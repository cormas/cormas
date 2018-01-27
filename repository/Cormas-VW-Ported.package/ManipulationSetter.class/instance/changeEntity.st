initialize-release
changeEntity
	
	| aList aMS |
	"collect all methods by using the setDefaultValues method, put them in the dataset, and then set back all the settings to false"
	self setDefaultValues.
	aList := self methodsForManip_List list copy.
	aList
		do:
			[:i | 
			i isInit: false.
			i isControl: false.
			i isTesting: false].	"read user defined preferences. If the preferences exists, set default value to fasle and then overwrite the preferences in the dataset"
	(self entityClass class selectors includes: #methodsForInit_UserDefined)
		ifTrue:
			[self entityClass methodsForInit_UserDefined
				do:
					[:m | 
					aMS := aList
						detect: [:i | i methodName = m asString]
						ifNone: [nil].
					aMS ifNotNil: [aMS isInit: true]]].
	(self entityClass class selectors includes: #methodsForControl_UserDefined)
		ifTrue:
			[self entityClass methodsForControl_UserDefined
				do:
					[:m | 
					aMS := aList
						detect: [:i | i methodName = m asString]
						ifNone: [nil].
					aMS ifNotNil: [aMS isControl: true]]].
	(self entityClass class selectors includes: #methodsForTesting_UserDefined)
		ifTrue:
			[self entityClass methodsForTesting_UserDefined
				do:
					[:m | 
					aMS := aList
						detect: [:i | i methodName = m asString]
						ifNone: [nil].
					aMS ifNotNil: [aMS isTesting: true]]].
	self methodsForManip_List list: aList.
	self entityClass subclasses isEmpty
		ifFalse:
			[self applyToSubclasses value: true.
			(self builder componentAt: #applyToSubclasses) isVisible: true.
			(self builder componentAt: #labelapplyToSubclasses1) isVisible: true.
			(self builder componentAt: #labelapplyToSubclasses2) isVisible: true]
		ifTrue:
			[self applyToSubclasses value: false.
			(self builder componentAt: #applyToSubclasses) isVisible: false.
			(self builder componentAt: #labelapplyToSubclasses1) isVisible: false.
			(self builder componentAt: #labelapplyToSubclasses2) isVisible: false]