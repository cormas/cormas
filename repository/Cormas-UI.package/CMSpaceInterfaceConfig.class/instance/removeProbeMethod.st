actions
removeProbeMethod
	| aList |
	self probeMethodsList selections isEmpty
		ifTrue: [ ^ self alertMessage: self translator tNoMethodSelected ].
	aList := self probeMethodsList list copy.
	aList removeAll: self probeMethodsList selections.
	self probeMethodsList setList: aList selecting: Array new.
	self probeMethods
		at: self observedEntitiesList selection
		put: self probeMethodsList list