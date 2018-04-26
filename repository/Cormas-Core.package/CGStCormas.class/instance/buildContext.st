mustache-templates
buildContext
	" Private - Build Mustache context "

	^ Dictionary new
		at: 'povAttribute' put: self buildPovAttribute;
		yourself.