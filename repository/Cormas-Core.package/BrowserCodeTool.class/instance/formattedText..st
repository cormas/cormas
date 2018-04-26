updating
formattedText: aText
	
	| node |
	[node := RBParser parseMethod: aText]
		on: Error
		do:
			[:ex | 
			InputState default altDown ifTrue: [ex pass].
			Transcript
				show: 'Browse auto format errror: ' , ex errorString;
				cr.
			^aText].
	^self formattedNode: node