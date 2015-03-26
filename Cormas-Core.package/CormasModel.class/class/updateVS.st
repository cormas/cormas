Obsolete
updateVS
	"	self imageDict: Dictionary new.
	self povColorsDict: Dictionary new.
	self allClasses do: 
			[:aClass | 
			aClass image notNil ifTrue: [self imageDict at: aClass put: aClass image].
			self povColorsDict at: aClass put: aClass colorsDict]"
	
	