Class {
	#name : #SpMorphicUnstyledLayoutAdapter,
	#superclass : #SpMorphicBoxAdapter,
	#category : #'Cormas-UI-Spec2'
}

{ #category : #private }
SpMorphicUnstyledLayoutAdapter >> buildMorph: aPresenter constraints: constraints [ 
	| childMorph |
	
	childMorph := aPresenter buildWithSpec: constraints spec.
	"Add children alignment constraints (if applies)"
	childMorph := self 
		applyChildrenAlignmentTo: childMorph 
		constraints: constraints. 
	childMorph := self 
		addConstraints: constraints 
		toChild: childMorph.
	
	^ childMorph
]
