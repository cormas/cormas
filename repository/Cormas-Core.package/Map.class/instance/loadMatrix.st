fichier
loadMatrix
	
	| tmp stream ligne item |
	tmp := OrderedCollection new.
	stream := nomFichier asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.	" Lecture de la 1ere ligne, on en profite pour compter le nombre de colonnes "
	self dimensionY: 0.
	ligne := (stream upTo: Character cr) readStream.
	[ligne atEnd]
		whileFalse:
			[item := ligne upTo: Character space.
			tmp add: item.
			self dimensionY: self dimensionY + 1].
	ligne close.
	self dimensionX: 1.	" Lecture du reste du fichier, ligne par ligne "
	[stream atEnd]
		whileFalse:
			[ligne := (stream upTo: Character cr) readStream.
			[ligne atEnd]
				whileFalse:
					[item := ligne upTo: Character space.
					tmp add: item].
			ligne close.
			self dimensionX: self dimensionX + 1].
	stream close.
	donnee := tmp asArray.
	^donnee