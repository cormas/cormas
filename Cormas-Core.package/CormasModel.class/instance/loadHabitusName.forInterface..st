- user interface
loadHabitusName: aString forInterface: aSI
	
	(self doesHabitusExists: aString) ifFalse: [^nil].
	self
		registerSpaceModelChange: #loadSilentltySIConfigName
		with: aSI -> aString