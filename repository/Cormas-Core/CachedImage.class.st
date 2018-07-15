"
CachedImages hold both a real image and a retained medium (Mask or Pixmap) and can be displayed quickly.  The retained medium is created from the image when needed.

Instance Variables:
	image				<Image>  
	retainedMedium	<Mask | Pixmap>  Mask if image paintBasis == CoverageValue, Pixmap otherwise


Object Reference:
A display surface such as a Pixmap usually can be displayed much more quickly than an equivalent image. However, an image has greater longevity because it survives even after you exit and restart the system. A CachedImage combines the longevity of an image with the displaying speed of a display surface. 
Given an image at creation time, a CachedImage generates an equivalent Pixmap or Mask, known as its retainedMedium. Whenever its display surface is unavailable, usually because the system has been restarted, a new display surface is generated. For frequently displayed images, the improvement in display speed is worth the cost in storage space. For example, the insertion point used by text editors is stored in a CachedImage. 
A CachedImage is created by sending #on: to this class, with the image as the argument. After that, it can be displayed just like any other visual component, though it cannot perform image-specific operations such as magnification and rotation. 

"
Class {
	#name : #CachedImage,
	#superclass : #Object,
	#instVars : [
		'image',
		'retainedMedium',
		'conversionMessage'
	],
	#category : 'Cormas-Core-Others'
}

{ #category : #private }
CachedImage class >> flushCaches [
	
	self allGeneralInstancesDo: [:each | each flushCache]
]

{ #category : #'instance creation' }
CachedImage class >> on: anImage [
	"Answer a new instance of the receiver on anImage."
	
	^self new setImage: anImage
]

{ #category : #'instance creation' }
CachedImage class >> on: anImage rendered: message [
	"Answer a new instance of the receiver on anImage."
	
	^(self new)
		setImage: anImage;
		conversionMessage: message
]

{ #category : #converting }
CachedImage >> asImage [
	"Answer the base image for this CachedImage.
	The image you get should not be modified because it is shared."
	
	^self image
]

{ #category : #converting }
CachedImage >> asPattern [
	"Answer a pattern with my contents."
	
	^Pattern from: self
]

{ #category : #converting }
CachedImage >> asRetainedMedium [
	"Answer the cached retained medium (pixmap or mask).
	The medium you get should not be modified because it is shared."
	
	(retainedMedium == nil or: [retainedMedium isOpen not])
		ifTrue:
			[conversionMessage == nil
				ifTrue: [retainedMedium := image asRetainedMedium]
				ifFalse:
					[retainedMedium := self perform: conversionMessage with: image]].
	^retainedMedium
]

{ #category : #accessing }
CachedImage >> conversionMessage [
	
	^conversionMessage
]

{ #category : #accessing }
CachedImage >> conversionMessage: aMessageSelector [
	
	conversionMessage := aMessageSelector
]

{ #category : #private }
CachedImage >> flushCache [
	
	retainedMedium ifNotNil: [retainedMedium close].
	retainedMedium := nil
]

{ #category : #accessing }
CachedImage >> height [
	"Answer the receiver's height."
	
	^image height
]

{ #category : #accessing }
CachedImage >> image [
	"Answer the receiver's image."
	
	^image
]

{ #category : #'image processing' }
CachedImage >> magnifiedBy: scale [
	
	^self species
		on: (self image magnifiedBy: scale)
		rendered: self conversionMessage
]

{ #category : #accessing }
CachedImage >> paintBasis [
	"Answer the type of the receiver's underlying paint (ColorValue or CoverageValue)."
	
	^image paintBasis
]

{ #category : #converting }
CachedImage >> renderDithered: im [
	
	| medium gc |
	medium := im paintBasis retainedMediumWithExtent: im extent.
	gc := medium graphicsContext.
	gc paintPolicy: gc paintPolicy copy.
	gc paintPolicy imageRenderer: OrderedDither new.
	gc
		copyImage: im
		to: Point zero.
	^medium
]

{ #category : #'binary storage' }
CachedImage >> representBinaryOn: binWriter [
	
	^MessageSend
		receiver: self class
		selector: #on:
		argument: image
]

{ #category : #private }
CachedImage >> setImage: anImage [
	"Set the receiver's image to be anImage."
	
	image := anImage
]

{ #category : #'image processing' }
CachedImage >> shrunkenBy: scale [
	
	^self species
		on: (self image shrunkenBy: scale)
		rendered: self conversionMessage
]

{ #category : #printing }
CachedImage >> storeOn: aStream [
	"Don't store the retainedMedium"
	
	aStream
		nextPut: $(;
		store: self class;
		nextPutAll: ' on: ('.
	image storeOn: aStream.
	aStream
		nextPutAll: ') rendered: ';
		store: self conversionMessage;
		nextPutAll: ')'
]

{ #category : #accessing }
CachedImage >> width [
	"Answer the receiver's width."
	
	^image width
]
