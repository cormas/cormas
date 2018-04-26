default values
sensitivitySetter
	
	^sensitivitySetter
		ifNil: [sensitivitySetter := OATsensitivity newOn: self]