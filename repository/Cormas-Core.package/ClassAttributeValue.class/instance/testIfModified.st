actions
testIfModified
	"test If the parameter initial value has been modified, then store information in hasBeenModified "
	
	| default initial |
	self valueType = Random ifTrue: [^self hasBeenModified: false].
	default := DefaultAttributesSetter
		getDefaultValueOfAttribut: self targetAttribute
		ofClass: self targetClass.
	initial := DefaultAttributesSetter
		getInitialValueOfAttribut: self targetAttribute
		ofClass: self targetClass.
	default = initial
		ifTrue: [self hasBeenModified: false]
		ifFalse:
			[default isNil
				ifTrue: [self hasBeenModified: false]
				ifFalse:
					[default class = initial class
						ifFalse:
							[self hasBeenModified: true.
							^true].
					default cormasHelper isTypeSet
						ifTrue:
							[self
								hasBeenModified:
									(default cormasHelper elementsOf: default equalElemenstOf: initial) not]
						ifFalse: [self hasBeenModified: true]]].
	^self hasBeenModified