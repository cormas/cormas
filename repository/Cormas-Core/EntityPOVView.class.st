Class {
	#name : #EntityPOVView,
	#superclass : #Object,
	#instVars : [
		'rien',
		'figure'
	],
	#classInstVars : [
		'referencedBounds'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #accessing }
EntityPOVView class >> referencedBounds [
	
	referencedBounds
		ifNil:
			[referencedBounds := Rectangle
				origin: 0 @ 0
				corner: 65 @ 65].
	^referencedBounds
]

{ #category : #accessing }
EntityPOVView class >> referencedBounds: anObject [
	
	referencedBounds := anObject
]

{ #category : #display }
EntityPOVView >> displayOn: aGC [
	
	super displayOn: aGC.
	self class referencedBounds: self bounds.
	self figure notNil
		ifTrue:
			[self figure isBitmapFigure
				ifTrue:
					[self figure
						displayOn: aGC
						at: self bounds center - (self figure bounds extent / 2)]
				ifFalse:
					[self figure
						displayOn: aGC
						at: self bounds center]]
]

{ #category : #accessing }
EntityPOVView >> figure [
	
	^figure
]

{ #category : #accessing }
EntityPOVView >> figure: anObject [
	
	figure := anObject
]
