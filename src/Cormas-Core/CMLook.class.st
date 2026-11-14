"
I describe how one entity appears in a view: its color, and whether it is drawn at all. I am pure data: I know nothing about how I am drawn, so a model that uses me still runs without any UI.

## Responsibility:

- Hold the values that every kind of entity shares, such as `color`.
- Start with defaults that always draw something, and return to them with `reset`.
- Compute colors from the attributes of an entity, through helpers such as `colorShadeOf:forValue:from:to:`.

## Collaborators:

- An aspect of an entity fills me from the entity's attributes.
- A renderer, such as a Bloc element, reads me and draws what I describe.
- `CMColor` gives the named colors of `colorGroupedBy:`.

## Public API and Key Messages

- `color:`, `color`
- `beInvisible`, `isVisible`
- `colorShadeOf:forValue:from:to:`, `colorBetween:and:forValue:from:to:`, `colorGroupedBy:`
- `reset`

I am abstract. Each kind of entity has its own subclass, such as `CMCellLook` or `CMAgentLook`.

```
| look |
look := CMCellLook new.
look colorShadeOf: Color green forValue: 15 from: 0 to: 20.
look color
```

## Internal Representation

- `color`: a `Color`. A translucent color lets what is below show through.
- `isVisible`: a `Boolean`, false when nothing must be drawn.

### Implementation Points

- A view reuses the same look at every refresh, so `reset` returns every value to its default before an aspect fills it again.
- Sizes and thicknesses in my subclasses are fractions of the side of a cell.
"
Class {
	#name : 'CMLook',
	#superclass : 'Object',
	#instVars : [
		'color',
		'isVisible'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'visibility' }
CMLook >> beInvisible [
	"Draw nothing for this entity"

	isVisible := false
]

{ #category : 'accessing' }
CMLook >> color [

	^ color
]

{ #category : 'accessing' }
CMLook >> color: aColor [

	color := aColor
]

{ #category : 'helpers' }
CMLook >> colorBetween: firstColor and: secondColor forValue: aNumber from: minimum to: maximum [
	"Use a color that goes from firstColor at the minimum to secondColor at the maximum. Values outside the range are clamped"

	color := firstColor
		         interpolateTo: secondColor
		         at: (self fractionOf: aNumber from: minimum to: maximum)
]

{ #category : 'helpers' }
CMLook >> colorGroupedBy: anObject [
	"Use a color computed from anObject: the same object always gets the same color, in every view and every run, and different objects almost always get colors that are easy to tell apart, by their hue, their brightness or their saturation"

	| bits |
	bits := self mixedBitsOf: anObject hash.
	color := Color
		         h: bits / 4294967296.0 * 360
		         s: (#( 0.85 0.55 ) at: bits // 3 \\ 2 + 1)
		         v: (#( 0.9 0.7 0.5 ) at: bits \\ 3 + 1)
]

{ #category : 'helpers' }
CMLook >> colorShadeOf: aColor forValue: aNumber from: minimum to: maximum [
	"Use a shade of aColor that goes from white at the minimum to aColor itself at the maximum. Values outside the range are clamped"

	color := Color white
		         interpolateTo: aColor
		         at: (self fractionOf: aNumber from: minimum to: maximum)
]

{ #category : 'helpers' }
CMLook >> fractionOf: aNumber from: minimum to: maximum [
	"Answer where aNumber lies between minimum and maximum, from 0 to 1. Values outside the range are clamped, and an empty range answers 1"

	minimum > maximum ifTrue: [
			self error:
				('The range from {1} to {2} has its minimum above its maximum'
					 format: {
							 minimum.
							 maximum }) ].
	minimum = maximum ifTrue: [ ^ 1 ].
	^ (aNumber - minimum / (maximum - minimum) max: 0) min: 1
]

{ #category : 'initialization' }
CMLook >> initialize [

	super initialize.
	self reset
]

{ #category : 'accessing' }
CMLook >> isVisible [

	^ isVisible
]

{ #category : 'helpers' }
CMLook >> mixedBitsOf: anInteger [
	"Answer 32 bits that depend on every bit of anInteger, so that close integers, such as the hashes of similar names, give unrelated results. This is a variant of the finalizer of MurmurHash"

	| bits |
	bits := anInteger bitXor: (anInteger bitShift: -13).
	bits := bits * 2654435761 \\ 4294967296.
	bits := bits bitXor: (bits bitShift: -16).
	^ bits * 2246822519 \\ 4294967296
]

{ #category : 'initialization' }
CMLook >> reset [
	"Return every value to its default, which always draws something. A view reuses the same look at every refresh, so its aspect starts from these defaults each time"

	isVisible := true.
	color := Color gray
]
