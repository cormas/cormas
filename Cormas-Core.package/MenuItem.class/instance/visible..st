hidden
visible: aValue
	"Invert of hidden:. Restricted to arguments which respond to value such as Booleans and Blocks."
	
	self hidden: [aValue value not]