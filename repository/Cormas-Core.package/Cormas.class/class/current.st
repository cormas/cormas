accessing
current
	"acces to the single current Cormas  (pattern singleton)
	Conveniently retrieve the already created instance
	"
	
	^current ifNil: [current := self allInstances first]