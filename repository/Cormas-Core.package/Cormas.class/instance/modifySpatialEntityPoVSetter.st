model entities
modifySpatialEntityPoVSetter
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Spatial'.
	aClass isNil
		ifFalse:
			[self openPovSetterGUI.
			self visualStateWin controller model majorKeys selection: aClass name]