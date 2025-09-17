Trait {
	#name : 'TCMTileset',
	#classInstVars : [
		'tiles'
	],
	#category : 'Cormas-UI-Tilesets-Core',
	#package : 'Cormas-UI-Tilesets',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
TCMTileset classSide >> formFromBase64: aString [

	^ Form fromBinaryStream: aString base64Decoded asByteArray readStream
]

{ #category : 'inspecting' }
TCMTileset classSide >> inspectionTiles: aBuilder [
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
TCMTileset classSide >> resetTiles [
	<script>
	^ tiles := nil
]

{ #category : 'as yet unclassified' }
TCMTileset classSide >> tileSelectors [

	^ (Pragma allNamed: 'tile' in: self class) collect: #methodSelector
]

{ #category : 'accessing' }
TCMTileset classSide >> tiles [
	^ tiles ifNil: [ tiles := Dictionary new ]
]

{ #category : 'see class side' }
TCMTileset >> seeClassSide [
]
