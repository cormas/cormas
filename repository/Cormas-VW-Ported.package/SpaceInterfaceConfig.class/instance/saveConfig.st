actions
saveConfig
	
	self configName value isEmpty
		ifTrue:
			[^self cormas warn: 'Please enter a title for that configuration'].
	(self configName value includes: $ )
		ifTrue:
			[(self cormas confirm:
					'Space characters are not allowed for Habitus names. Do you want to replace by ''_'' character ?')
				ifTrue:
					[self configName value: (self configName value replaceAll: $  with: $_)]
				ifFalse: [^nil]].
	self checkClassAndMethodsExist.
	self class
		saveSIconfig: self
		intoClass: self spaceInterface cormasModelClass
		name: self configName value.
	self spaceInterface configName value: self configName value