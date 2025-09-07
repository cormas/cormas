Class {
	#name : 'CMTileset',
	#superclass : 'Object',
	#classVars : [
		'icons'
	],
	#category : 'Cormas-UI-Tilesets',
	#package : 'Cormas-UI-Tilesets'
}

{ #category : 'as yet unclassified' }
CMTileset class >> formFromBase64: aString [

	^ Form fromBinaryStream: aString base64Decoded asByteArray readStream
]

{ #category : 'accessing' }
CMTileset class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : 'inspecting' }
CMTileset class >> inspectionIcons: aBuilder [
	<inspectorPresentationOrder: 0 title: 'icons'>
	<script: 'self inspect'>
	^ aBuilder newTable
		  addColumn: (SpImageTableColumn title: 'Icon' evaluated: #value);
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
		  items:
			  ((self class selectorsInProtocol: 'accessing - icons') sorted
				   collect: [ :each | each -> (self perform: each) ]);
		  yourself
]

{ #category : 'initialization' }
CMTileset class >> resetIcons [
	<script>
	^ icons := nil
]

{ #category : 'see class side' }
CMTileset >> seeClassSide [
]
