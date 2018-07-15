"
LineFigure is a special PolylineFigure that can add annotations to its start and end points. These annotations can be arrows, circles, etc.

Instance Variables:
	annotations	<SequenceableCollection of: LineAnnotation>	the annotations to display on our line


"
Class {
	#name : #LineFigure,
	#superclass : #Object,
	#instVars : [
		'annotations'
	],
	#category : 'Cormas-Core-HotDraw'
}

{ #category : #'instance creation' }
LineFigure class >> connect: aFigure to: anotherFigure [
	
	| figure |
	figure := super connect: aFigure to: anotherFigure.
	figure addDependent: aFigure.
	figure addDependent: anotherFigure.
	figure addStopArrow.
	^figure
]

{ #category : #accessing }
LineFigure >> addAnnotation: aLineAnnotation [
	
	annotations := annotations copyWith: aLineAnnotation.
	aLineAnnotation container: self.
	self recomputePreferredBounds
]

{ #category : #accessing }
LineFigure >> addStartArrow [
	
	^self addAnnotation: ArrowAnnotation forStart
]

{ #category : #accessing }
LineFigure >> addStopArrow [
	
	^self addAnnotation: ArrowAnnotation forStop
]

{ #category : #private }
LineFigure >> computePreferredBounds [
	
	^annotations
		inject: super computePreferredBounds
		into: [:sum :each | sum merge: each bounds]
]

{ #category : #displaying }
LineFigure >> displayOn: aGraphicsContext [
	
	super displayOn: aGraphicsContext.
	annotations do: [:each | each displayOn: aGraphicsContext].
	info isNil ifFalse: [self displayInfoOn: aGraphicsContext]
]

{ #category : #'initialize-release' }
LineFigure >> initialize [
	
	super initialize.
	annotations := #()
]

{ #category : #testing }
LineFigure >> isLineFigure [
	
	^true
]

{ #category : #accessing }
LineFigure >> menuAt: aPoint [
	
	| menu submenu selectedAnnotation |
	submenu := MenuBuilder new.
	LineAnnotation allSubclasses
		do:
			[:each | 
			| name |
			name := each name asString.
			(name
				copyFrom: (name size - 9 max: 1)
				to: name size) = 'Annotation'
				ifTrue:
					[name := name
						copyFrom: 1
						to: name size - 10].
			submenu
				add: ('Start ' , name) -> [self addAnnotation: each forStart];
				add: ('Stop ' , name) -> [self addAnnotation: each forStop]].
	selectedAnnotation := annotations
		detect: [:each | each containsPoint: aPoint]
		ifNone: [nil].
	selectedAnnotation notNil
		ifTrue:
			[submenu
				line;
				add: 'Remove annotation' -> [self removeAnnotation: selectedAnnotation]].
	menu := super menuAt: aPoint.
	menu addItem: ((MenuItem labeled: 'Annotations') submenu: submenu menu).
	^menu
]

{ #category : #accessing }
LineFigure >> removeAnnotation: aLineAnnotation [
	
	annotations := annotations copyWithout: aLineAnnotation.
	aLineAnnotation container: nil.
	self recomputePreferredBounds
]

{ #category : #accessing }
LineFigure >> startDirection [
	
	| direction |
	direction := points first - (points at: 2).
	^direction = (0 @ 0)
		ifTrue: [1 @ 0]
		ifFalse: [direction unitVector]
]

{ #category : #accessing }
LineFigure >> stopDirection [
	
	| direction |
	direction := points last - (points at: points size - 1).
	^direction = (0 @ 0)
		ifTrue: [1 @ 0]
		ifFalse: [direction unitVector]
]

{ #category : #printing }
LineFigure >> writeStoreStringOn: codeStream [
	
	codeStream
		nextPutAll: ' from: ( ';
		nextPutAll: self model from name;
		nextPutAll: ' new id: ' , self model from id asString , '); to:  (';
		nextPutAll: self model to name;
		nextPutAll: ' new id: ' , self model to id asString , ')'.
	codeStream nextPutAll: '; points: '.
	points storeOn: codeStream.
	infoText isNil
		ifFalse:
			[codeStream
				cr;
				nextPutAll: '	 ; type: ' , infoText string printString].
	codeStream nextPutAll: '; yourself'
]
