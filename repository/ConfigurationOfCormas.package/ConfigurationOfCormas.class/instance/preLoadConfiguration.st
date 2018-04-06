doits
preLoadConfiguration

	| logoFilename |
	(logoFilename := 'CormasLogoFull.png') asFileReference exists 
		ifTrue: [ PolymorphSystemSettings desktopLogoFileName: logoFilename ].
	Smalltalk tools debugger
		alwaysOpenFullDebugger: true;
		filterCommonMessageSends: true.
	Pharo3Theme beCurrent.


