Extension { #name : 'CMNamedImage' }

{ #category : '*Cormas-Bloc' }
CMNamedImage >> drawContentOn: aContext in: aRectangle folder: aFolder [
	"Draw my file centred in aRectangle: scaled to cover it, or to fit inside it when I have a size"

	| source scales scale |
	source := aFolder surfaceNamed: self name.
	scales := aRectangle extent / source extent.
	scale := self coversTheCell
		         ifTrue: [ scales max ]
		         ifFalse: [ scales min ].
	aContext
		translateBy: aRectangle center - (source extent * scale / 2);
		scaleBy: scale asPoint;
		sourceSurface: source x: 0 y: 0;
		paint
]
