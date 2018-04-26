instance creation
newFor: aSI withConfig: aConfigName
	
	| x |
	x := super new.
	x spaceInterface: aSI.
	x prepareSettings.
	x configName value: aConfigName.
	x spaceInterface configName value: aConfigName.
	self
		loadSIconfig:
			(x spaceInterface cormasModelClass
				perform: ('SIconfig_' , aConfigName) asSymbol)
		in: x
		ofModel: aSI cormasModel.
	^x