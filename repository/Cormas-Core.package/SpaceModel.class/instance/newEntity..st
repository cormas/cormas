private - init
newEntity: aClass
	"Creates a new instance of aClass and collects it at the level of theXXXs collection. 
	Set also the collector of the new instance"
	
	^aClass new: self	"anEntity collector: self cormasModel collector.
	self cormasModel collect: anEntity."