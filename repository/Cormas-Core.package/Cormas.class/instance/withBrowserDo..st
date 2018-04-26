model entities
withBrowserDo: aBlock
	"Evaluate a block with a browser in parameter"
	
	self halt.
	aBlock value: Smalltalk tools browser
