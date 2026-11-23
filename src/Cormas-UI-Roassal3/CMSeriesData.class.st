"
I am one series of a chart, ready to draw: a name, a color, and the values of a probe at the steps they were recorded. A value is a number, or the collection of the numbers of all instances at that step for the charts of a spread.

## Responsibility:

- I know my name, shown in the legend, and by which I am hidden.
- I know my color.
- I know my steps and my values, of the same size, and can return the part of them recorded up to a step.

## Collaborators:

- `CMChart>>seriesDataOf:in:` creates me from recorded data.
- `CMChart>>canvasOf:hiding:` draws me, and hides me by my name.

## Public API and Key Messages

- `CMSeriesData named:color:steps:values:` creates me.
- `name`, `color`, `steps` and `values` return what I know.
- `upToStep:` returns a copy of me with the values recorded up to a step.

```smalltalk
(CMSeriesData
	named: 'boars'
	color: Color brown
	steps: #( 0 1 2 )
	values: #( 40 38 41 )) upToStep: 1
```
"
Class {
	#name : 'CMSeriesData',
	#superclass : 'Object',
	#instVars : [
		'name',
		'color',
		'steps',
		'values'
	],
	#category : 'Cormas-UI-Roassal3',
	#package : 'Cormas-UI-Roassal3'
}

{ #category : 'instance creation' }
CMSeriesData class >> named: aString color: aColor steps: someSteps values: someValues [

	^ self new
		  setName: aString
		  color: aColor
		  steps: someSteps
		  values: someValues;
		  yourself
]

{ #category : 'accessing' }
CMSeriesData >> color [

	^ color
]

{ #category : 'accessing' }
CMSeriesData >> name [

	^ name
]

{ #category : 'accessing' }
CMSeriesData >> setName: aString color: aColor steps: someSteps values: someValues [

	name := aString.
	color := aColor.
	steps := someSteps.
	values := someValues
]

{ #category : 'accessing' }
CMSeriesData >> steps [

	^ steps
]

{ #category : 'accessing' }
CMSeriesData >> upToStep: aStep [
	"Return a copy of me with only the values recorded at aStep and before, as they were when the simulation reached aStep"

	| count |
	count := steps count: [ :each | each <= aStep ].
	^ self class
		  named: name
		  color: color
		  steps: (steps first: count)
		  values: (values first: count)
]

{ #category : 'accessing' }
CMSeriesData >> values [

	^ values
]
