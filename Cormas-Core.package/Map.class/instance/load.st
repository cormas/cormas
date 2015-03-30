fichier
load
	
	| aString tmp michelField stream |
	stream := nomFichier asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	aString := stream contents.
	stream close.
	tmp := OrderedCollection new.
	michelField := String new.
	aString
		do:
			[:aChar | 
			aChar isSeparator
				ifTrue:
					[michelField isEmpty
						ifFalse:
							[tmp add: michelField.
							michelField := String new]]
				ifFalse:
					[michelField isEmpty
						ifTrue: [michelField := String with: aChar]
						ifFalse: [michelField := michelField , (String with: aChar)]]].	"	tmp size ~= (dimension x * dimension y)
		ifTrue: 
			[Dialog warn: 'Pb Lecture Carte'.
			^nil]."
	donnee := tmp asArray.
	^donnee