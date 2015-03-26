instance creation
initVS
	"	self imageDict: Dictionary new.
	self povColorsDict: Dictionary new.  
	(self socialClasses select: 
			[:e | 
			e isGenericEntity not
				and: [e superclass ~= Agent and: [e superclass ~= Group]]])
		do: 
			[:aClass | 
			self povColorsDict at: aClass put: Dictionary new.
			self imageDict at: aClass put: VectorialElementaryPOV new.
			aClass image: (self imageDict at: aClass).
			aClass colorsDict: (self povColorsDict at: aClass)].
	(self passiveObjectClasses select: [:o | o isGenericEntity not]) do: 
			[:aClass | 
			self povColorsDict at: aClass put: Dictionary new.
			self imageDict at: aClass put: VectorialElementaryPOV new.
			aClass image: (self imageDict at: aClass).
			aClass colorsDict: (self povColorsDict at: aClass)]."
	
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