"
I check that a tile can be found by its name among the tilesets.
"
Class {
	#name : 'CMTilesetTest',
	#superclass : 'TestCase',
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMTilesetTest >> testATileIsFoundByItsName [

	self
		assert: (CMTileset tileNamed: #firefighter)
		identicalTo: CMDefaultTileset firefighter
]

{ #category : 'tests' }
CMTilesetTest >> testAnUnknownNameRaisesAnErrorNamingIt [

	| error |
	error := [ CMTileset tileNamed: #noSuchTile ]
		         on: Error
		         do: [ :each | each ].
	self assert: (error messageText includesSubstring: 'noSuchTile')
]
