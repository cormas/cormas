private - irregular polygons creation
readMif: fileName entity: class
	"Read the MIF file storing the coordinates of the shapes. The instances of 'class' are created here and their shape is stored in the 'outline' attribut.
The MIF file looks like :
Version 300
Index 7,8
CoordSys Earth Projection 1, 0
Columns 10
  ID Float
  N__PROV_ Char(2)
...
Data
Region  1
  28
-2.30042376 13.88605788
  .... (28 points)
-2.30042376 13.88605788
    Pen (1,2,0) 
    Brush (1,0,16777215)
    Center -2.43676116 13.83987069
Region  1
  51
-2.501586 13.94239248...."
	
	| stream readingBlock sep temp zoneDonnees listeTemp readOtherInfo |
	sep := Character cr.
	stream := fileName asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	zoneDonnees := 0.
	self spatialEntities
		at: class name
		put: OrderedCollection new.
	readOtherInfo := self cormas confirm:
			' Does your MIF file includes the Pen, Brush, Center data?'.
	readingBlock := [[stream atEnd]
		whileFalse:
			[temp := stream upTo: sep.
			listeTemp := self traiterChaineDeCaractere: temp.
			listeTemp isEmpty
				ifFalse:
					[((listeTemp at: 1) sameAs: 'Region') ifTrue: [zoneDonnees := 1]].
			zoneDonnees = 1
				ifTrue:
					[self
						traiterDonneesMif: temp
						pointeur: stream
						separateur: sep
						nombre: (listeTemp at: 2) asNumber
						classe: class
						info: readOtherInfo.
					zoneDonnees := 0]]].
	readingBlock valueNowOrOnUnwindDo: [stream close].
	self initEntitesSpatiales: class.
	self activeSpatialEntity: class