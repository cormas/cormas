Class {
	#name : #VueEllipse,
	#superclass : #Object,
	#instVars : [
		'a',
		'b',
		'e',
		'aa',
		'bb',
		'f',
		'r',
		'extent',
		'interieur'
	],
	#category : 'Cormas-Core-Observer'
}

{ #category : #acces }
VueEllipse >> a [
	
	interieur ifTrue: [^a].
	^aa
]

{ #category : #acces }
VueEllipse >> a: v [
	
	interieur
		ifTrue: [a := v]
		ifFalse: [aa := v]
]

{ #category : #acces }
VueEllipse >> b [
	
	interieur ifTrue: [^b].
	^bb
]

{ #category : #acces }
VueEllipse >> b: v [
	
	interieur
		ifTrue: [b := v]
		ifFalse: [bb := v]
]

{ #category : #acces }
VueEllipse >> compute [
	
	e := self compute: a @ b.
	f := self compute: aa @ bb.
	self invalidate
]

{ #category : #private }
VueEllipse >> compute: abPoint [
	
	| angle x y tmp |
	tmp := OrderedCollection new.
	0
		to: 360
		do:
			[:i | 
			angle := i degreesToRadians.
			x := abPoint x * angle cos.
			y := abPoint y * angle sin.
			tmp add: x @ y].
	^Polyline vertices: tmp
]

{ #category : #private }
VueEllipse >> displayOn: aGC [
	
	(Circle
		center: self bounds extent / 2
		radius: r) asFiller
		displayOn: (aGC paint: (ColorValue perform: #royalBlue)).
	e asStroker
		displayOn: (aGC paint: (ColorValue perform: #black))
		at: self bounds extent / 2.
	f asStroker
		displayOn: (aGC paint: (ColorValue perform: #red))
		at: self bounds extent / 2
]

{ #category : #acces }
VueEllipse >> e [
	
	^e
]

{ #category : #acces }
VueEllipse >> extent [
	
	^extent
]

{ #category : #acces }
VueEllipse >> extent: v [
	
	extent := v
]

{ #category : #acces }
VueEllipse >> f [
	
	^f
]

{ #category : #initialise }
VueEllipse >> initialize [
	
	a := 10.
	b := 10.
	aa := 15.
	bb := 15.
	extent := 10.
	e := self compute: a @ b.
	f := self compute: aa @ bb.
	interieur := true.
	^self
]

{ #category : #acces }
VueEllipse >> interieur: v [
	
	interieur := v
]

{ #category : #acces }
VueEllipse >> rrr: v [
	
	r := v
]
