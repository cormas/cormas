Class {
	#name : 'CMTileset',
	#superclass : 'Object',
	#classInstVars : [
		'tiles'
	],
	#category : 'Cormas-UI-Tilesets-Core',
	#package : 'Cormas-UI-Tilesets',
	#tag : 'Core'
}

{ #category : 'base64 conversion' }
CMTileset class >> formFromBase64: aString [

	^ Form fromBinaryStream: aString base64Decoded asByteArray readStream
]

{ #category : 'inspecting' }
CMTileset class >> inspectionTiles: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Tiles'>
	<script: 'self inspect'>
	^ aBuilder newTable
		propagateNaturalHeight: false;
		addColumn: (SpImageTableColumn title: 'Image' evaluated: [ :each |
			each value smallForm scaledToSize: 30@30 ]);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		items: (self tileSelectors sorted
			collect: [ :each | each -> (self perform: each) ]);
		yourself
]

{ #category : 'initialization' }
CMTileset class >> resetTiles [
	<script>
	^ tiles := nil
]

{ #category : 'accessing' }
CMTileset class >> tileNamed: aSymbol [
	"Answer the tile named aSymbol, from the one tileset that has a tile with that name"

	| tilesets |
	tilesets := self allSubclasses select: [ :each |
		            each tileSelectors includes: aSymbol ].
	tilesets ifEmpty: [
		self error: ('No tileset has a tile named #{1}' format: { aSymbol }) ].
	tilesets size > 1 ifTrue: [
			self error:
				('The tilesets {1} all have a tile named #{2}' format: {
						 (', ' join: (tilesets collect: #name)).
						 aSymbol }) ].
	^ tilesets first perform: aSymbol
]

{ #category : 'as yet unclassified' }
CMTileset class >> tileSelectors [

	^ (Pragma allNamed: 'tile' in: self class) collect: #methodSelector
]

{ #category : 'accessing' }
CMTileset class >> tiles [
	^ tiles ifNil: [ tiles := Dictionary new ]
]
