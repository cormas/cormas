"
I am a choice of one aspect for each class of entities, such as ""the ecologist's perspective"": vegetation by biomass, foragers by energy. A view shows the simulation from one perspective, so two views with two perspectives show the same simulation from two points of view.

## Responsibility:

- Remember which aspect is chosen for which class, and check that the class has that aspect.
- Answer the aspect of any class: the choice made for the class itself, or for its nearest superclass, or else its default aspect.

## Collaborators:

- `CMEntity` classes define the aspects, as methods with the pragma `<aspect>`.
- `CMObserver` holds a perspective, and asks it which aspect fills the look of each entity.
- A model defines named perspectives, as methods with the pragma `<perspective>` that return one of my instances.

## Public API and Key Messages

- `show:as:` chooses an aspect for a class and its subclasses.
- `aspectFor:` answers the selector of the aspect of a class.

A new perspective is empty: every class shows its default aspect.

```
perspectiveEcologist
	<perspective>
	^ CMPerspective new
		show: ECECVegetationUnit as: #aspectBiomass:;
		show: ECECForager as: #aspectEnergy:
```

## Internal Representation

- `aspects`: a `Dictionary` from a class to the selector of the aspect chosen for it.
"
Class {
	#name : 'CMPerspective',
	#superclass : 'Object',
	#instVars : [
		'aspects'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'accessing' }
CMPerspective >> aspectFor: aClass [
	"Answer the selector of the aspect that shows the instances of aClass: the choice for aClass, or for its nearest superclass that has one, or else its default aspect"

	^ aClass withAllSuperclasses
		  detect: [ :each | aspects includesKey: each ]
		  ifFound: [ :each | aspects at: each ]
		  ifNone: [ #aspectDefault: ]
]

{ #category : 'initialization' }
CMPerspective >> initialize [

	super initialize.
	aspects := Dictionary new
]

{ #category : 'accessing' }
CMPerspective >> show: aClass as: aSelector [
	"Show the instances of aClass and of its subclasses with the aspect named aSelector, unless a subclass has its own choice"

	(aClass aspectSelectors includes: aSelector) ifFalse: [
			self error:
				('{1} has no aspect #{2}. Its aspects are {3}' format: {
						 aClass name.
						 aSelector.
						 (', ' join:
							  (aClass aspectSelectors collect: [ :each | '#' , each ])) }) ].
	aspects at: aClass put: aSelector
]
