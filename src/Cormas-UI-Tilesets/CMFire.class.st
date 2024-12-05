Class {
	#name : 'CMFire',
	#superclass : 'Object',
	#classVars : [
		'icons'
	],
	#category : 'Cormas-UI-Tilesets',
	#package : 'Cormas-UI-Tilesets'
}

{ #category : 'animations' }
CMFire class >> fire [

	<script: 'self fire inspect'>
	^ self icons
		at: #fire
		ifAbsentPut: [ Form fromBinaryStream: self fireContents base64Decoded asByteArray readStream ]
]

{ #category : 'as yet unclassified' }
CMFire class >> fireContents [

	^ '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'
]

{ #category : 'accessing' }
CMFire class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : 'initialization' }
CMFire class >> resetIcons [
	<script>
	^ icons := nil
]