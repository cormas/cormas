"
I am a tileset with tiles whose colors tell which form is drawn and how it is cut, so that tests can find them by their names.
"
Class {
	#name : 'CMBlTestTileset',
	#superclass : 'CMTileset',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'tiles' }
CMBlTestTileset class >> halfRedHalfBlue [
	"A tile that is red on its left half and blue on its right half"

	<tile>
	| form |
	^ self tiles at: #halfRedHalfBlue ifAbsentPut: [
			  form := Form extent: 32 @ 32 depth: 32.
			  form fill: (0 @ 0 extent: 16 @ 32) fillColor: Color red.
			  form fill: (16 @ 0 extent: 16 @ 32) fillColor: Color blue.
			  self
				  tileWithLarge: form
				  medium: form
				  small: form
				  verySmall: form ]
]

{ #category : 'tiles' }
CMBlTestTileset class >> oneColorPerSize [
	"A tile with a large red form, a medium green one, a small blue one and a very small yellow one"

	<tile>
	^ self tiles at: #oneColorPerSize ifAbsentPut: [
			  self
				  tileWithLarge: (self solidForm: Color red)
				  medium: (self solidForm: Color green)
				  small: (self solidForm: Color blue)
				  verySmall: (self solidForm: Color yellow) ]
]

{ #category : 'private' }
CMBlTestTileset class >> solidForm: aColor [

	^ (Form extent: 32 @ 32 depth: 32)
		  fillColor: aColor;
		  yourself
]

{ #category : 'private' }
CMBlTestTileset class >> tileWithLarge: largeForm medium: mediumForm small: smallForm verySmall: verySmallForm [

	^ CMTile new
		  instVarNamed: #largeForm put: largeForm;
		  instVarNamed: #mediumForm put: mediumForm;
		  instVarNamed: #smallForm put: smallForm;
		  instVarNamed: #verySmallForm put: verySmallForm;
		  yourself
]
