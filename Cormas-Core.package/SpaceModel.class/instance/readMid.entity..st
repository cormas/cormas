private - irregular polygons creation
readMid: fileName entity: class
	"Read the MID file storing the values of the attributs of the entities.
The MID file looks like :
354,'37','2',3,0,'4','37 4','37 2 4 3 0','3','0'
354,'37','2',3,0,'4','37 4','37 2 4 3 0','3','0'   ....
The COR file looks like :
poly	1	asNumber
prov_45	2	asNumber
Then, poly of cell 1 = 354, prov_45 of cell 1 = 37..."
	
	| midFile lesEntites stream listeCor listeMots corFile readingBlock wordList cpt e f collec i |
	midFile := (((Filename splitExtension: fileName asString) at: 1) , '.mid')
		asFilename.
	midFile exists not ifTrue: [^nil].	"Interface pour recuperer la liste de correspondance de couples: 
	1. nom attribut entite <-> 2. numero colonne midFile <-> 3. type"
	listeCor := OrderedCollection new.
	corFile := (((Filename splitExtension: fileName asString) at: 1) , '.cor')
		asFilename.
	corFile exists not ifTrue: [^nil].
	stream := corFile readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	readingBlock := [[stream atEnd]
		whileFalse:
			[wordList := Cormas
				splitLine: stream
				sep: Character tab.
			listeCor
				add:
					(Array
						with: (wordList at: 1)
						with: (wordList at: 2) asNumber
						with: (wordList at: 3) asSymbol)]].
	readingBlock valueNowOrOnUnwindDo: [stream close].	"Lecture des valeurs, 1 ligne <-> 1 entite; 1 colonne <-> 1 valeur pour attribut"
	lesEntites := 'the' , class name asString , 's'.
	stream := midFile readStream.
	collec := self cormasModel perform: lesEntites asSymbol.
	cpt := 0.
	i := 1.
	[i + cpt <= collec size]
		whileTrue:
			[e := collec at: i + cpt.
			e spaceModel: self.
			listeMots := Cormas splitLine: stream sep: $,.
			listeMots := listeMots collect: [:u | u copyWithout: $"].
			listeCor
				do:
					[:a | 
					e
						perform: ((a at: 1) , ':') asSymbol
						with: ((listeMots at: (a at: 2)) perform: (a at: 3))].
			1
				to: e includedEntities size
				do:
					[:j | 
					cpt := cpt + 1.
					f := collec at: i + cpt.
					listeCor
						do:
							[:a | 
							f
								perform: ((a at: 1) , ':') asSymbol
								with: ((listeMots at: (a at: 2)) perform: (a at: 3))]].
			i := i + 1].
	stream close