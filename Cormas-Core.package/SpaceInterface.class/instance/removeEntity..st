display
removeEntity: aEntityRef
	
	| aSelector |
	aSelector := self povMethodDicoAt: aEntityRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing removeEntity: aEntityRef.
	Cormas refresh: self