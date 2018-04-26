initialization
initializePresenter
	" Private - See superimplementor's comment "

	self attributeAddButton action: [ self addAttributeCallback ].
	self attributeRemoveButton action: [ self removeAtributeCallback ].

	self classVarAddButton action: [ self shouldBeImplemented ].
	self classVarRemoveButton action: [ self shouldBeImplemented ].