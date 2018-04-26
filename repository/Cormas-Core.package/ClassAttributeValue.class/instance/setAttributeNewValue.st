actions
setAttributeNewValue
	"set the attribut (of targetAttribute) to its new value (currentValue) by calling the writter accessor of the attribute"
	
	| writeAccessor allInstances |
	writeAccessor := (self targetAttribute , ':') asSymbol.
	allInstances := self entityInstances
		ifNil: [self targetClass allInstances].
	self valueType = Random
		ifTrue:
			[allInstances do: [:instance | instance perform: writeAccessor with: nil]]
		ifFalse:
			[allInstances
				do:
					[:instance | 
					instance
						perform: writeAccessor
						with: self currentValue]]