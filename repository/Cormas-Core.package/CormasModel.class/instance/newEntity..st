+ instance creation - agents & objects
newEntity: aClass
	"Creates a new instance of aClass and collects it, immediately, at the level of  theXXXs collection. 
	Set also the collector of the new instance"
	
	| anEntity |
	anEntity := aClass new.
	anEntity collector: self collector.
	self collect: anEntity.
	^anEntity