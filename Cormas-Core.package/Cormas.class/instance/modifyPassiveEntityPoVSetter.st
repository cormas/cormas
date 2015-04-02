model entities
modifyPassiveEntityPoVSetter
	
	| aClass |
	aClass := self getSelectedEntityClassType: 'Passive'.
	aClass isNil
		ifFalse:
			[self openPovSetterGUI.
			self visualStateWin controller model majorKeys selection: aClass name]