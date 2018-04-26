initialize-release
initialize
	
	inset := 20 @ 20.
	model ifNil: [super initialize].
	self model: ActivityModel new.
	bounds := 0 @ 0 extent: 0 @ 0.
	self opaque.
	self defaultAttributes