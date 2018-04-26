actions
setAttributeInitialValue
	"reset the parameter of the target classe to nil, then calls the attribut reader accessors to set the initial value"
	
	| writeAccessor allInstances |
	writeAccessor := (self targetAttribute , ':') asSymbol.
	allInstances := self targetClass allInstances.
	allInstances isEmpty
		ifTrue:
			[allInstances := OrderedCollection with: self targetClass basicNew].
	allInstances
		do:
			[:instance | 
			instance perform: writeAccessor with: nil.
			self currentValue: (instance perform: self targetAttribute)].
	self hasBeenModified: false.
	self setAttributeNewValue