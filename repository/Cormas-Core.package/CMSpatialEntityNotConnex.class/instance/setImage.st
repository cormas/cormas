- obsolete
setImage
	"a collec of components images"
	
	| collec |
	collec := OrderedCollection new.
	self components
		do:
			[:c | 
			c image isNil ifTrue: [c setImage].
			collec add: c image].
	self image: collec