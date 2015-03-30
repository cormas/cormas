- accessing
isRandomAttribute: anAttributeName classVariable: boolean
	"' Answer if anAttributeName defined at level (#instance or #class) is a random attribute"
	
	^self
		isRandomAttribute: anAttributeName
		scopeLevel:
			(boolean
				ifTrue: [#class]
				ifFalse: [#instance])