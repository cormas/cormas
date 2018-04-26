initialize-release
initialize
	
	model ifNil: [super initialize].
	self model: DecisionPointModel new.
	bounds := 0 @ 0 extent: 10 @ 10.
	self opaque.
	self defaultAttributes.
	self moveable: true