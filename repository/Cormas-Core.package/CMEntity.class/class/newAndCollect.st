- instance creation
newAndCollect
	"Creates a new instance of Entity and add it immediatelly to cormasModel collection (theXXXs).
This works but this is not the best way to do !
We suggest to use 'newAndCollect: aCollector' to create and collect an entity"
	
	| anInstance |
	anInstance := self new.
	Cormas collect: anInstance.
	^anInstance