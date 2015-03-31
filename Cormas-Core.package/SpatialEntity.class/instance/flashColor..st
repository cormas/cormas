- displaying
flashColor: aColorValue
	"Purpose: changes background color to a given color (to draw observer attention to the receiver). If aColorValue is not a standard Color, it displays the entity in red.
	Argument: aColorValue = <ColorValue> or <String> or <Symbol>
	Example: self flashColor: ColorValue pink or self flashColor: #pink"
	
	aColorValue isString
		ifTrue: [^self flashColor: (ColorValue perform: aColorValue asSymbol)].
	self currentSimulation
		registerEntityChange: #flash
		with: aColorValue
		from: (EntityReference on: self)