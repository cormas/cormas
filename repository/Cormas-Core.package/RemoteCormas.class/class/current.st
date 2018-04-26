instance creation
current
	"acces to the single current RemoteCormas  (pattern singleton)
	Conveniently retrieve the already created instance
	"
	
	^current
		ifNil:
			[current := self allInstances isEmpty
				ifTrue: [nil]
				ifFalse: [self allInstances first]]