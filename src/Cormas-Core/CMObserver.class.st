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
- `looks`: an `IdentityDictionary` from an entity to its look. Each look is created once and filled again at each refresh.
"
Class {
	#name : 'CMObserver',
	#superclass : 'Object',
	#instVars : [
		'perspective',
		'looks'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'initialization' }
CMObserver >> initialize [

	super initialize.
	perspective := CMPerspective new.
	looks := IdentityDictionary new
]

{ #category : 'accessing' }
CMObserver >> lookOf: anEntity [
	"Answer the look of anEntity, filled again from its current attributes by the aspect that my perspective chooses for its class"

	| look |
	look := looks
		        at: anEntity
		        ifAbsentPut: [ anEntity class lookClass new ].
	look reset.
	anEntity perform: (perspective aspectFor: anEntity class) with: look.
	^ look
]

{ #category : 'accessing' }
CMObserver >> perspective [

	^ perspective
]

{ #category : 'accessing' }
CMObserver >> perspective: aPerspective [

	perspective := aPerspective
]
