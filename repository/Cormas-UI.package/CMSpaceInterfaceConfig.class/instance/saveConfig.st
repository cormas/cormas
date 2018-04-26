actions
saveConfig
	self configName value isEmpty
		ifTrue: [ ^ self alertMessage: self translator tConfigTitle ].
	(self configName value includes: $ )
		ifTrue: [ (self confirm: self translator tSpaceNotAllowed)
				ifTrue: [ self configName
						value: (self configName value replaceAll: $  with: $_) ]
				ifFalse: [ ^ nil ] ].
	self checkClassAndMethodsExist.
	self class
		saveSIconfig: self
		intoClass: self spaceInterface cormasModelClass
		name: self configName value.
	self spaceInterface configName value: self configName value