model saving&loading
saveModelAsParcel
	
	| aPackage |
	self cormasModelClass isNil ifTrue: [^nil].
	self cormasModel isNil
		ifFalse:
			[self cormasModel defaultAttributesSetter modifiedAttribute isEmpty
				ifFalse:
					[(Dialog confirm:
							'Some attributes have been modified.
Before saving, Cormas will set them to their default values, OK?')
						ifFalse: [^nil]
						ifTrue:
							[self cormasModel defaultAttributesSetter backToDefaultValues]]].
	self cormasModelClass setCormasAndVwVersion.
	aPackage := self cormasModelClass package.
	self saveParcelFromPackage: aPackage	"OBSOLETE self saveVisualStates"