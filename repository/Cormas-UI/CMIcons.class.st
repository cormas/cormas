Class {
	#name : 'CMIcons',
	#superclass : 'Object',
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'as yet unclassified' }
CMIcons class >> colorGreen [

	^ Color fromHexString: '00b44c'
]

{ #category : 'as yet unclassified' }
CMIcons class >> runIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas
		fillColor: Color transparent;
		drawPolygon: { 
				(4 @ 2).
				(12 @ 8).
				(4 @ 14) }
		color: self colorGreen
		borderWidth: 0
		borderColor: Color darkGray.
	^ form
]

{ #category : 'as yet unclassified' }
CMIcons class >> stepIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas
		fillColor: Color transparent;
		drawPolygon: { 
				(1 @ 2).
				(9 @ 8).
				(1 @ 14) }
		color: self colorGreen
		borderWidth: 0
		borderColor: self colorGreen;
		fillRectangle: (11 @ 3 corner: 14 @ 14) color: self colorGreen.
	^ form
]
