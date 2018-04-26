model scheduling
runButtonLabel: aString
	"(self builder componentAt: #runButton) isNil ifFalse:[(self builder componentAt: #runButton) labelString: aString]."
	
	(self builder componentAt: #runButton) isNil
		ifFalse: [(self builder componentAt: #runButton) labelString: aString]