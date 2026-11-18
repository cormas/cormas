Extension { #name : 'CMCombinedImage' }

{ #category : '*Cormas-Bloc' }
CMCombinedImage >> drawContentOn: aContext in: aRectangle folder: aFolder [

	self layers do: [ :each |
		each drawOn: aContext in: aRectangle folder: aFolder ]
]
