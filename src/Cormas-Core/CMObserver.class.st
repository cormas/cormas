"
I prepare what one view shows: the look of each entity, seen from my perspective. I do not draw anything, so any renderer, such as Bloc or a web page, can draw the looks I fill.

## Responsibility:

- Hold the perspective of one view, and the look of each entity the view shows.
- Fill the look of an entity again from its current attributes, with the aspect my perspective chooses for its class. This is the only place where looks are filled.

## Collaborators:

- `CMPerspective` tells me which aspect to use for each class.
- An entity runs its aspect to fill the look I give it.
- A renderer asks me for looks and draws them.

## Public API and Key Messages

- `lookOf:` answers the look of an entity, filled from its current attributes.
- `perspective:`, `perspective`

```
| observer |
observer := CMObserver new.
observer perspective: (CMPerspective new show: CMMockCell as: #aspectState:; yourself).
(observer lookOf: aCell) color
```

## Internal Representation

- `perspective`: a `CMPerspective`, empty for a new observer.
- `looks`: a `WeakIdentityKeyDictionary` from an entity to its look. Each look is created once and filled again at each refresh, and is forgotten once its entity is gone.

### Implementation Points

- A copy, as for a duplicated view, starts with a copy of my perspective and fills looks of its own.
"
Class {
	#name : 'CMObserver',
	#superclass : 'Object',
	#instVars : [
		'perspective',
		'looks',
		'original'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'initialization' }
CMObserver >> initialize [

	super initialize.
	self perspective: CMPerspective new.
	looks := WeakIdentityKeyDictionary new
]

{ #category : 'testing' }
CMObserver >> isModified [
	"Answer whether my choices differ from the perspective I started from"

	^ (perspective hasSameChoicesAs: original) not
]

{ #category : 'accessing' }
CMObserver >> lookOf: anEntity [
	"Answer the look of anEntity, filled again from its current attributes by the aspect that my perspective chooses for its class, or invisible if its class is hidden"

	| look |
	look := looks
		        at: anEntity
		        ifAbsentPut: [ anEntity class lookClass new ].
	look reset.
	(perspective isVisible: anEntity class)
		ifTrue: [
			anEntity
				perform: (perspective aspectFor: anEntity class)
				with: look ]
		ifFalse: [ look beInvisible ].
	^ look
]

{ #category : 'accessing' }
CMObserver >> original [
	"Answer the perspective I started from"

	^ original
]

{ #category : 'accessing' }
CMObserver >> perspective [

	^ perspective
]

{ #category : 'accessing' }
CMObserver >> perspective: aPerspective [
	"Start from aPerspective. My choices change a copy of it, so that I can tell whether they differ from it, and go back to it"

	original := aPerspective.
	perspective := aPerspective copy
]

{ #category : 'initialization' }
CMObserver >> postCopy [
	"A copy chooses aspects on its own, and fills looks of its own"

	super postCopy.
	perspective := perspective copy.
	looks := WeakIdentityKeyDictionary new
]

{ #category : 'choosing' }
CMObserver >> reset [
	"Go back to the perspective I started from"

	perspective := original copy
]
