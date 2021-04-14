Class {
	#name : #ArcPOV,
	#superclass : #EntityPOV,
	#instVars : [
		'lineWidth',
		'lineColor',
		'startAnnotation',
		'stopAnnotation',
		'startPosition',
		'stopPosition'
	],
	#category : #'Cormas-Core-Legacy'
}

{ #category : #'instance creation' }
ArcPOV class >> new [
	"Answer a newly created and initialized instance."
	
	^super new initialize
]

{ #category : #private }
ArcPOV >> asFigure [
	
	| arcFig |
	arcFig := self class asFigure
		start: -30 @- 10
		stop: 30 @ 10.
	self stopAnnotation ifTrue: [arcFig addStopArrow].
	self startAnnotation ifTrue: [arcFig addCircleStart].
	arcFig lineWidth: self lineWidth.
	arcFig lineColor: self lineColor.
	arcFig model: self.
	^arcFig
]

{ #category : #accessing }
ArcPOV >> center [
	" *** This method was defined by CormasNS.Kernel.EntityPOV as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #changed }
ArcPOV >> changeColor [
	" *** This method was defined by CormasNS.Kernel.EntityPOV as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #accessing }
ArcPOV >> color: aColor [
	
	lineColor := aColor
]

{ #category : #private }
ArcPOV >> exportIn: aStream [
	"Export the atributes value of the ArcPOV into a stream, to save it on the disk (in .EV file)"
	
	aStream
		nextPutAll:
			self lineColor red printString , ' ' , self lineColor green printString ,
					' ' , self lineColor blue printString , ' '.
	aStream nextPutAll: self lineWidth printString , ' '.
	aStream nextPutAll: self startAnnotation printString , ' '.
	aStream nextPutAll: self stopAnnotation printString , ' '.	"aStream nextPutAll: self isStroked printString , ' '."	"stroke ne sert plus √† rien a priori dans Cormas MVC"
	aStream nextPutAll: '\' withCRs
]

{ #category : #'initialize-release' }
ArcPOV >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	" *** Replace this comment with the appropriate initialization code *** "
	
	^self
]

{ #category : #testing }
ArcPOV >> isArcPOV [
	
	^true
]

{ #category : #accessing }
ArcPOV >> label [
	
	^self entity class name asString
]

{ #category : #accessing }
ArcPOV >> lineColor [
	
	^ lineColor 
		ifNil: [ lineColor := Color black ]
]

{ #category : #accessing }
ArcPOV >> lineColor: anObject [
	
	lineColor := anObject
]

{ #category : #accessing }
ArcPOV >> lineWidth [
	
	^lineWidth ifNil: [lineWidth := 1]
]

{ #category : #accessing }
ArcPOV >> lineWidth: anObject [
	
	lineWidth := anObject
]

{ #category : #obsolete }
ArcPOV >> newStartPosition [
	
	self halt	"supposed to be obsolete"	"self changed: #moveStartTo: with: entity patch defaultPOV bounds center."
]

{ #category : #obsolete }
ArcPOV >> newStopPosition [
	
	self halt	"supposed to be obsolete"	"self changed: #moveStopTo: with: entity stopCell defaultPOV bounds center."
]

{ #category : #display }
ArcPOV >> show [
	" *** This method was defined by CormasNS.Kernel.EntityPOV as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #accessing }
ArcPOV >> startAnnotation [
	
	^startAnnotation ifNil: [startAnnotation := false]
]

{ #category : #accessing }
ArcPOV >> startAnnotation: anObject [
	
	startAnnotation := anObject
]

{ #category : #accessing }
ArcPOV >> startPosition [
	
	^startPosition ifNil: [startPosition := #center]
]

{ #category : #accessing }
ArcPOV >> startPosition: anObject [
	
	startPosition := anObject
]

{ #category : #accessing }
ArcPOV >> startPositionposition [
	
	^startPosition ifNil: [startPosition := #center]
]

{ #category : #accessing }
ArcPOV >> stopAnnotation [
	
	^stopAnnotation ifNil: [stopAnnotation := true]
]

{ #category : #accessing }
ArcPOV >> stopAnnotation: anObject [
	
	stopAnnotation := anObject
]

{ #category : #accessing }
ArcPOV >> stopPosition [
	
	^stopPosition ifNil: [stopPosition := #center]
]

{ #category : #accessing }
ArcPOV >> stopPosition: anObject [
	
	stopPosition := anObject
]
