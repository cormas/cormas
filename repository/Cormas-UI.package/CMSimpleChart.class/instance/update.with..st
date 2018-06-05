deprecated
update: anAspectSymbol with: aParameter
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."

	anAspectSymbol = #timeChanged
		ifTrue: [ ^ self timeChanged ].
		
	"	anAspectSymbol = #noticeChanges
		ifTrue: 
			[aParameter isEmpty ifTrue:[^self].
			aParameter do: [: aChange | self noticeChange: aChange ].
			^Cormas refresh: self]."

	super update: anAspectSymbol with: aParameter