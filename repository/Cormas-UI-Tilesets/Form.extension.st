Extension { #name : 'Form' }

{ #category : '*Cormas-UI-Tilesets' }
Form >> + aForm [
	
	"Combine two forms by drawing aForm on top of self. Bits of aForm that are equal to 0 are not drawn (they are transparent and you can see self through them). aForm is scaled to the size of self"
	
	| topForm bottomForm xOffset yOffset newBits |
	
	topForm := aForm.
	bottomForm := self.
	
	topForm extent > bottomForm extent ifTrue: [
		| maxExtent |
		maxExtent := topForm extent max.
		bottomForm := bottomForm scaledToSize: (maxExtent @ maxExtent) ].
		
	xOffset := bottomForm width - topForm width // 2.
	yOffset := bottomForm height - topForm height // 2.
		
	newBits := bottomForm bits copy.
	
	1 to: topForm height do: [ :i |
		1 to: topForm width do: [ :j |
			| topFormBit |
			topFormBit := topForm bits at: ((i - 1) * topForm width) + j.
			
			topFormBit > 0 ifTrue: [
				newBits
					at: (((i - 1 + yOffset) * bottomForm width) + j + xOffset)
					put: topFormBit ] ] ].
		
	^ (self class extent: bottomForm extent depth: bottomForm depth)
		bits: newBits;
		yourself
]

{ #category : '*Cormas-UI-Tilesets' }
Form >> movedDownBy: aNumber [

	^ (self class
		extent: self extent
		depth: depth)
		bits: (Bitmap new: aNumber * width), (bits allButLast: aNumber * width);
		yourself.
]

{ #category : '*Cormas-UI-Tilesets' }
Form >> movedUpBy: aNumber [

	^ (self class
		extent: self extent
		depth: depth)
		bits: (bits allButFirst: aNumber * width), (Bitmap new: aNumber * width);
		yourself.
]
