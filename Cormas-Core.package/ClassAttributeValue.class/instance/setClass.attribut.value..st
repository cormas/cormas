actions
setClass: class attribut: attrib value: valor
	
	| theClass |
	targetClass := class.
	targetAttribute := attrib.
	theClass := class isMeta
		ifTrue: [class instanceBehavior]
		ifFalse: [class].
	(theClass
		isRandomAttribute: targetAttribute
		classVariable: (theClass = class) not) ifTrue: [^valueType := Random].
	theClass isGenericEntity
		ifTrue: [currentValue := valor]
		ifFalse:
			[(class instVarNames includes: attrib asString)
				ifFalse: [currentValue := valor]
				ifTrue: [currentValue := self currentValueAsString: valor]].
	valor isString
		ifTrue:
			[(valor findString: 'random' startingAt: 1) = 1
				ifTrue: [^valueType := Random]].
	valueType := valor class