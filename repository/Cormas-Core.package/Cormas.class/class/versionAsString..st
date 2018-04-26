version
versionAsString: aDateCollection
	"  Cormas versionAsString:#(2010 6 24 8 31 54)  -> '2010.6.24 '  "
	
	| text |
	text := ''.
	text := text , (aDateCollection at: 1) printString , '.'.
	text := text , (aDateCollection at: 2) printString , '.'.
	text := text , (aDateCollection at: 3) printString.	", ' - ' "	"text := text , (aDateCollection at: 4) printString , ':'.
	text := text , (aDateCollection at: 5) printString , ':'.
	text := text , (aDateCollection at: 6) printString."
	^text