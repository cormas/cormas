model entities
modifySocialEntityPoVSetter
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Social'.
	aClass isNil
		ifFalse:
			[self openPovSetterGUI.
			self visualStateWin controller model majorKeys selection: aClass name]