- instance creation
newAndCollect: aCollector
	"Creates a new instance of Entity and add it immediatelly to cormasModel collection (theXXXs)"
	
	| anInstance |
	anInstance := self new.
	anInstance collector: aCollector.
	aCollector collect: anInstance.
	aCollector updateEntities.
	^anInstance