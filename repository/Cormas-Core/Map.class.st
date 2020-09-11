Class {
	#name : #Map,
	#superclass : #Ressource,
	#instVars : [
		'dimension',
		'nomFichier'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #fichier }
Map >> close [
	
	donnee := nil
]

{ #category : #acces }
Map >> dimension [
	
	^dimension
]

{ #category : #acces }
Map >> dimensionX [
	
	^dimension x
]

{ #category : #acces }
Map >> dimensionX: unEntier [
	
	dimension x: unEntier
]

{ #category : #acces }
Map >> dimensionY [
	
	^dimension y
]

{ #category : #acces }
Map >> dimensionY: unEntier [
	
	dimension y: unEntier
]

{ #category : #'initialize-release' }
Map >> initialize [
	
	super initialize.
	dimension := 10 @ 10
]

{ #category : #fichier }
Map >> load [
	
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
]

{ #category : #fichier }
Map >> loadMatrix [
	
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
]

{ #category : #acces }
Map >> nomFichier [
	
	^nomFichier
]

{ #category : #acces }
Map >> nomFichier: aString [
	
	nomFichier := aString
]

{ #category : #acces }
Map >> printOn: aStream [
	
	aStream nextPutAll: 'Carte : ' , symbol displayString
]

{ #category : #edition }
Map >> readFrom: unCommeMoi [
	
	super readFrom: unCommeMoi.
	dimension := unCommeMoi dimension.
	nomFichier := unCommeMoi nomFichier
]

{ #category : #fichier }
Map >> save [
	
	
]
