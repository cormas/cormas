Class {
	#name : #VectorialView,
	#superclass : #Object,
	#category : 'Cormas-Core-HotDraw'
}

{ #category : #'controller accessing' }
VectorialView >> defaultControllerClass [
	
	^VectorialController
]

{ #category : #'menu actions' }
VectorialView >> group [
	
	| figures newFigure |
	figures := selections copy.
	figures isEmpty ifTrue: [^self].
	self removeAll: figures.
	newFigure := CompositeEntityFigure new.
	newFigure addAll: figures.
	self
		add: newFigure;
		selection: newFigure
]
