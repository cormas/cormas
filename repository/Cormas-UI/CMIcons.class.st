Class {
	#name : #CMIcons,
	#superclass : #Object,
	#category : #'Cormas-UI'
}

{ #category : #'as yet unclassified' }
CMIcons class >> runIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas
		fillColor: Color transparent;
		drawPolygon: { 
				(4 @ 2).
				(12 @ 8).
				(4 @ 14) }
		color: Color darkGray
		borderWidth: 0
		borderColor: Color darkGray.
	^ form
]

{ #category : #'as yet unclassified' }
CMIcons class >> stepIcon [

	| form |
	form := Form extent: 16 @ 16 depth: 32.
	form getCanvas
		fillColor: Color transparent;
		fillRectangle: (2 @ 3 corner: 5 @ 13) color: Color darkGray;
		drawPolygon: { 
				(7 @ 2).
				(15 @ 8).
				(7 @ 14) }
		color: Color darkGray
		borderWidth: 0
		borderColor: Color darkGray.
	^ form
]
