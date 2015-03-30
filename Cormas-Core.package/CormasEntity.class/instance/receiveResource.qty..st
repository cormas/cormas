+ common-pool resources
receiveResource: anAtt qty: x
	"Purpose: adds a quantity of resource (x) to an attribute representing a common-pool resource. 
Arguments: anAtt = <Symbol> Warning : anAtt has to be an instance variable of the class, with a couple of accessing methods
			x = <Number>
Example: self receiveResource: #surfaceWater qty: 10.3"
	
	| att newValue |
	anAtt isSymbol
		ifTrue: [att := anAtt asString]
		ifFalse: [att := anAtt].
	(self class instVarNames includes: att) ifFalse: [self halt].
	newValue := (self perform: att asSymbol) + x.
	self
		perform: (att , ':') asSymbol
		with: newValue