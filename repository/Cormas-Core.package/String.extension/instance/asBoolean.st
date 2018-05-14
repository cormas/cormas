*Cormas-Core
asBoolean

	self = 'false' ifTrue: [^false].
	self =  'true'  ifTrue: [^true].
	self = 'nil' ifTrue: [^nil].
	self error:  'unrecognized boolean name'.