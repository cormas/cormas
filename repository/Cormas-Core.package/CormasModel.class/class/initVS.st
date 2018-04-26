instance creation
initVS
	self flag:#shouldBeRevised.
	self cellClass notNil
		ifTrue:
			["self povColorsDict at: self cellClass put: Dictionary new."
			self cellClass colorsDict: Dictionary new	"(self povColorsDict at: self cellClass)"].
	(self compoundSpatialClasses select: [:cse | cse isGenericEntity not])
		do:
			[:aClass | 
			"self povColorsDict at: aClass put: Dictionary new."
			"self dicoImage at: aClass put: ImageObjetSpatialise new.
			aClass image: (self dicoImage at: aClass)."
			aClass colorsDict: Dictionary new	"(self povColorsDict at: aClass)"]