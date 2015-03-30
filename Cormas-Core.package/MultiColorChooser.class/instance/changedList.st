initialize-release
changedList
	
	| color |
	color := self elementColorDict
		at: self listElements selection
		ifAbsent: [^self selection: ColorValue black].
	self selection: (Cormas colorOrBlackFrom: color)