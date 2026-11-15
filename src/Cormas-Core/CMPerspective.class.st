"
I am a choice of one aspect for each class of entities, and of the classes that are hidden, such as ""the ecologist's perspective"": vegetation by biomass, foragers by energy. A view shows the simulation from one perspective, so two views with two perspectives show the same simulation in two ways.

## Responsibility:

- Remember which aspect is chosen for which class, and check that the class has that aspect.
- Answer the aspect of any class: the choice made for the class itself, or for its nearest superclass, or else its default aspect.
- Answer whether a class is shown, in the same way. A hidden class keeps its aspect for when it is shown again.

## Collaborators:

- `CMEntity` classes define the aspects, as methods with the pragma `<aspect>`.
- `CMObserver` holds a perspective, and asks it which aspect fills the look of each entity.
- A model defines named perspectives, as methods with the pragma `<perspective>` that return one of my instances.

## Public API and Key Messages

- `show:as:` chooses an aspect for a class and its subclasses.
- `aspectFor:` answers the selector of the aspect of a class.
- `hide:`, `show:` and `isVisible:` for the classes that are hidden.
- `forget:` removes the choice of aspect for a class, which then follows its superclass.

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
- `visibilities`: a `Dictionary` from a class to whether it is shown, for the classes that were hidden or shown.
- `name`: the name shown to users, given by `CMModel>>perspectiveNamed:` after the method that defines me, and empty for a perspective made in a view.
"
Class {
	#name : 'CMPerspective',
	#superclass : 'Object',
	#instVars : [
		'aspects',
		'name',
		'visibilities'
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

{ #category : 'private' }
CMPerspective >> aspects [

	^ aspects
]

{ #category : 'choosing' }
CMPerspective >> forget: aClass [
	"Remove the choice made for aClass, so that its instances follow the choice for its superclass"

	aspects removeKey: aClass ifAbsent: [ ]
]

{ #category : 'testing' }
CMPerspective >> hasChoiceFor: aClass [
	"Answer whether a choice was made for aClass itself, rather than inherited from a superclass"

	^ aspects includesKey: aClass
]

{ #category : 'testing' }
CMPerspective >> hasSameChoicesAs: aPerspective [

	^ aspects = aPerspective aspects and: [
		  visibilities = aPerspective visibilities ]
]

{ #category : 'choosing' }
CMPerspective >> hide: aClass [
	"Hide the instances of aClass and of its subclasses, unless a subclass is shown. Their aspect is kept for when they are shown again"

	visibilities at: aClass put: false
]

{ #category : 'initialization' }
CMPerspective >> initialize [

	super initialize.
	aspects := Dictionary new.
	visibilities := Dictionary new.
	name := ''
]

{ #category : 'testing' }
CMPerspective >> isChosenFor: aClass [
	"Answer whether an aspect, or whether to show it, was chosen for aClass itself"

	^ (aspects includesKey: aClass) or: [
		  visibilities includesKey: aClass ]
]

{ #category : 'testing' }
CMPerspective >> isVisible: aClass [
	"Answer whether the instances of aClass are shown: the choice for aClass, or for its nearest superclass that has one, or else true"

	^ aClass withAllSuperclasses
		  detect: [ :each | visibilities includesKey: each ]
		  ifFound: [ :each | visibilities at: each ]
		  ifNone: [ true ]
]

{ #category : 'accessing' }
CMPerspective >> name [
	"Answer the name shown to users, which is empty for a perspective made in a view"

	^ name
]

{ #category : 'accessing' }
CMPerspective >> name: aString [

	name := aString
]

{ #category : 'initialization' }
CMPerspective >> postCopy [

	super postCopy.
	aspects := aspects copy.
	visibilities := visibilities copy
]

{ #category : 'choosing' }
CMPerspective >> show: aClass [
	"Show the instances of aClass again, with their aspect. If a superclass is hidden, only aClass and its subclasses are shown"

	visibilities removeKey: aClass ifAbsent: [ ].
	(self isVisible: aClass) ifFalse: [
		visibilities at: aClass put: true ]
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

{ #category : 'private' }
CMPerspective >> visibilities [

	^ visibilities
]
